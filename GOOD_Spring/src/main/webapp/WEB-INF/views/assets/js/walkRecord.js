/**
 * @decription 걷기기록하기 자바스크립트
 * @author 이상화
 * @file - walkRecord.js
 */
var watchId = null;
var interval = null;
var count = 0;
var linepath=[];
function startRecord() {
	
	if (navigator.geolocation) { // GPS를 지원하면
		watchId = navigator.geolocation.watchPosition(function(position) {
			var wat_latitude = String(position.coords.latitude); // 위도
			var wat_longitude = String(position.coords.longitude); //경도
			var wat_accuracy = position.coords.accuracy; //정확도
			var wat_timestamp = position.timestamp; // 시간

			map.setCenter(new kakao.maps.LatLng(wat_latitude, wat_longitude));
			console.log("위도: " + wat_latitude + ", 경도: " + wat_longitude + ", 정확도: " + wat_accuracy + ", 타임스탬프: " + wat_timestamp+", count: "+count)
			linepath.push(new kakao.maps.LatLng(wat_latitude, wat_longitude));
						// 지도에 선을 표시한다 
			var polyline = new kakao.maps.Polyline({
				map: map, // 선을 표시할 지도 객체 
				path: linepath,
				strokeWeight: 1, // 선의 두께
				strokeColor: '#FF0000', // 선 색
				strokeOpacity: 0.8, // 선 투명도
				strokeStyle: 'dotted' // 선 스타일
			});
			marker.setPosition(new kakao.maps.LatLng(wat_latitude, wat_longitude));
			infowindow.setPosition(new kakao.maps.LatLng(wat_latitude, wat_longitude));
			infowindow.setContent('<div style="padding:5px; padding-left:10px; font-size:18px;">당신의 현재 위치는...</div>')
			
			//  ajax로 로딩
			$.ajax({
				url: getContextPath() + '/walkPage/walk_record.do',
				type: 'post',
				dataType: 'json',
				data: { wat_latitude, wat_longitude, wat_timestamp, count },
				success: function(data) { }
			});

			count = 1;
		}, function(error) {
			console.error(error);
			alert(error.code);
		}, {
			enableHighAccuracy: true,
			maximumAge: 250,
		});

		window.setTimeout(function() {
			window.navigator.geolocation.clearWatch(watchId)
		},
			3000 //stop checking after 5 seconds
		);
	} else {
		alert('GPS를 지원하지 않습니다');
	}
}

function endRecord() {
if (watchId != null) {

		var course_name=$("#course_name").val();
		if(course_name==null || course_name==""){
			alert("코스 이름을 입력해주세요.")
			
		}else{

			$.ajax({
				url: getContextPath() + '/walkPage/walk_courseNameUniqueCheck.do',
				type: 'post',
				dataType: 'json',
				data: {course_name},
				success: function(result) {
						if(result.result=='true'){
							navigator.geolocation.clearWatch(watchId);
							console.log(watchId);
							swal("기록을 중지합니다.")
							watchId = 0;
							clearInterval(interval);
							noRecording();
								$.ajax({
									url: getContextPath() + '/walkPage/walk_recordEnd.do',
									type: 'post',
									dataType: 'json',
									data: {course_name},
									success: function(data){
										noRecording()
									}
								})
						}else {
							alert("이미 존재하는 코스 이름입니다. 다시 입력해주세요.")
						}
				 }
			});

		}
		
	} else {
		swal("기록하기를 눌러 기록을 시작해주세요.")
	}
}

/* 기록하기 시작하고 현재까지의 시간을 구하는 함수*/

