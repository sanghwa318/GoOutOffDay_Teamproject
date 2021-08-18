/**
 * 
 */


$(function() {



	$("#btn_cancel").click(function(e) {
			e.preventDefault();
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title: '확인', // 제목
				text: "정말 취소 하시겠습니까?", // 내용
				type: 'warning', // 종류
				confirmButtonText: '네', // 확인버튼 표시 문구
				showCancelButton: true, // 취소버튼 표시 여부
				cancelButtonText: '아니오', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
					swal('취소',	'나만의 코스 작성이 취소되었습니다.', 'success');
					setTimeout(function() {
					location.href = getContextPath()+'/commPage/comm_myCourse.do';
				}, 1000);
			}
		});
	});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.5160832, 126.9661696), // 지도의 중심좌표
		level: 4, // 지도의 확대 레벨
		mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
	};


	$('#course_name').change(function(e) {
		$('#map').html("");
		e.preventDefault();
		var course_name = $(this[this.selectedIndex]).val();
		map = null;
		var map = new kakao.maps.Map(mapContainer, mapOption);
		$.ajax({
			url: getContextPath() + '/commPage/comm_myCourseGetLoc',
			type: 'post',
			data: { course_name },
			success: function(data) {
				var linepath = [];
				var lat = [];
				var lon = [];
				for (var i = 0; i < data.courseName.length; i++) {
					console.log(data.courseName[i].lat)
					console.log(data.courseName[i].lon)

					lat[i] = parseFloat(data.courseName[i].lat);
					lon[i] = parseFloat(data.courseName[i].lon);
					linepath[i] = new kakao.maps.LatLng(parseFloat(data.courseName[i].lat), parseFloat(data.courseName[i].lon));
				};
				// 지도에 선을 표시한다 
				var polyline = new kakao.maps.Polyline({
					map: map, // 선을 표시할 지도 객체 
					path: linepath,
					strokeWeight: 2, // 선의 두께
					strokeColor: '#FF0000', // 선 색
					strokeOpacity: 0.9, // 선 투명도
					strokeStyle: 'solid' // 선 스타일
				});
				// 지도에 마커를 생성하고 표시한다
				var marker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(lat[0], lon[0]), // 마커의 좌표
					map: map // 마커를 표시할 지도 객체
				});

				map.setCenter(new kakao.maps.LatLng(lat[0], lon[0]));
			}
		});
	});
	$('#write-btn').click(function(e){
	let mycourse_name=$('#course_name option:selected').val();
	let mycourse_area=$('#mycourse_area option:selected').val();
	let mycourse_content=CKEDITOR.instances['mycourse_content'].getData()
		e.preventDefault();
		console.log(mycourse_name, mycourse_area, mycourse_content)
			$.ajax({
					url: getContextPath()+"/commPage/comm_myCourseWriteOk",
					dataType: 'json',
					method:'post',
					data: {mycourse_name, mycourse_area, mycourse_content},
					success: function(data) {
						swal("성공", "나만의 코스가 작성되었습니다.", "success").then(function(){
							window.location.href= getContextPath()+"/commPage/comm_myCourseDetail.do"
							+ "?mycourse_no=" + data.output.mycourse_no;
						})
					},error: function(data, status, error){
						console.log(data)
							var error_msg =data.responseJSON.rt
								swal({
									title : "에러",
									text :error_msg,
									type : "error"
									})
							return false; // <-- 실행 중단
						}
			})
		})
});




