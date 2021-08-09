/**
 * 
 */
		function relayout() {

			// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
			// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
			// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
			map.relayout();
		}
$(function() {
	//화면에 표시되는 리스트의 개수를 저장하는 변수
    var length = $('#item-box').data('length');

	//지도에서 사용될 변수들의 초기 선언.
    var map = [];
    var mapContainer = [];
    var mapOption = null;
    var linepath = [];
    var lat = [];
    var lon = [];

	//리스트 하나당 반복문 한번.
    for (var j = 0; j < length; j++) {
	//반복문이 한번 실행될때마다 지도와 선, 마커 등의 객체를 초기화해준다.
		var polyline=null;
		var marker=null;
		linepath=[];
        var mycourse_noId = document.getElementById('item' + j + '')
        var mycourse_no = mycourse_noId.dataset.mycourseno;
		map[j] = null;

        console.log(mapContainer[j])
       

        //지도 띄우기 ajax 처리
        $.ajax({
            url: getContextPath() + '/commPage/comm_myCourseListGetLoc.do',
            type: 'post',
            data: { mycourse_no },
            success: function(data) {

                for (var i = 0; i < data.courseName.length; i++) {
                    linepathLength = data.courseName.length;
                    console.log(data.courseName.length)

                    lat[i] = parseFloat(data.courseName[i].lat);
                    lon[i] = parseFloat(data.courseName[i].lon);

                    linepath[i] = new kakao.maps.LatLng(parseFloat(data.courseName[i].lat), parseFloat(data.courseName[i].lon));
            	

				};
				 mapContainer[j] = document.getElementById('map' + j + ''), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(lat[0], lon[0]), // 지도의 중심좌표
                level: 5, // 지도의 확대 레벨
                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
            };
        		map[j] = new kakao.maps.Map(mapContainer[j], mapOption);
				map[j].setDraggable(false);
				polyline = new kakao.maps.Polyline({
					map: map[j], // 선을 표시할 지도 객체 
					path: linepath,
					strokeWeight: 2, // 선의 두께
					strokeColor: '#FF0000', // 선 색
					strokeOpacity: 1, // 선 투명도
					strokeStyle: 'solid' // 선 스타일
				});
                // 지도에 마커를 생성하고 표시한다
                  marker = new kakao.maps.Marker({
					position: new kakao.maps.LatLng(lat[0], lon[0]), // 마커의 좌표
					map: map[j] // 마커를 표시할 지도 객체
					})
        },async:false //반복문을 위한 비동기 처리.
         });
    }
})