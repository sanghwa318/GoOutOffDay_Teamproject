/**
 * @decription 걷기기록하기 자바스크립트
 * @author 이상화
 * @file - walkRecord.js
 */
var watchId = null;
var interval = null;
var count = 0;
function startRecord() {
	if (navigator.geolocation) { // GPS를 지원하면
		watchId = navigator.geolocation.watchPosition(function(position) {
			//alert(position.coords.latitude + ' ' + position.coords.longitude);
			var wat_latitude = position.coords.latitude; // 위도
			var wat_longitude = position.coords.longitude; //경도
			var wat_accuracy = position.coords.accuracy; //정확도
			var wat_timestamp = position.timestamp; // 시간

			map.setCenter(new kakao.maps.LatLng(wat_latitude, wat_longitude));
			console.log("위도: " + wat_latitude + ", 경도: " + wat_longitude + ", 정확도: " + wat_accuracy + ", 타임스탬프: " + wat_timestamp+", count: "+count)

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
			5000 //stop checking after 5 seconds
		);
	} else {
		alert('GPS를 지원하지 않습니다');
	}
}

function endRecord() {
	if (watchId == 0) {

	} else if (watchId != null) {
		navigator.geolocation.clearWatch(watchId);
		console.log(watchId);
		alert("기록을 중지합니다.")
		watchId = 0;
		clearInterval(interval);
		$.ajax({
			url: getContextPath() + '/walkPage/walk_recordEnd.do',
			type: 'post',
			dataType: 'json',
			data: {},
			success: function(data) { }
		});
	} else if (watchId == null) {
		alert("기록하기를 눌러 기록을 시작해주세요.")
	}
}

$(function() {


	$("#startRecord").click(function(event) {
		interval = setInterval(function() {
			startRecord();
		},
			15000 //check every 15 seconds
		);
	});

	$("#endRecord-btn").click(function(e) {
		endRecord();
	});
});
