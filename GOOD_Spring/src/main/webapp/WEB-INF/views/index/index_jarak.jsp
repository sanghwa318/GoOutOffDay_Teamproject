<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<div id="map" style="height: 520px; margin: auto"></div>

<!-- // 본문 JS시작 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6b1199a25d6406101fb441c0afa0e00&libraries=services,clusterer,drawing"></script>
	<!-- 카카오 맵 -->
	<script type="text/javascript">
	function getContextPath() {
		var hostIndex = location.href.indexOf(location.host)
				+ location.host.length;
		var contextPath = location.href.substring(hostIndex, location.href
				.indexOf('/', hostIndex + 1));
		return contextPath;
	}
	// 카카오 지도
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 
		level : 9,
		mapTypeId: kakao.maps.MapTypeId.ROADMAP
	// 지도의 확대 레벨 
	};
	<!-- geoJson 파일 불러와서 카카오 맵에 표시 -->
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	var courseName='${output.COURSE_NAME}'
	
	    	/* 자락길 선형정보 */
			$.getJSON(getContextPath()+"/assets/map/jarak_line.geojson", function(geojson){
				
		    var data = geojson.features;
		    var coordinates = [];    //좌표 저장할 배열
		    var name = '';            //코스 이름
		    var color = '#FF6666'
		    $.each(data, function(index, val) {
		 
		        coordinates = val.geometry.coordinates;
		        name = val.properties.CONTS_NAME;
		        displayLine(coordinates, name, color);
		    	})
			})
			/* 자락길 점형정보 */
			$.getJSON(getContextPath()+"/assets/map/jarak_point.geojson", function(geojson_p){
				var data_p = geojson_p.features;
				var coordinates_p = [];
				var name_p= '';

				$.each(data_p, function(index,val){
					
					coordinates_p=val.geometry.coordinates;
			        name_p = val.properties.CONTS_NAME;
			        displayPoint(coordinates_p, name_p);
			        
				})
				
			})
			
	    // 포인트 표시
	    function displayPoint(coordinates, name){
			var point=null;
				point=new kakao.maps.LatLng(coordinates[1], coordinates[0]);
				// 지도에 마커를 생성하고 표시한다
				var marker = new kakao.maps.Marker({
					opacity:0.001,
					position: point, // 마커의 좌표
					map: map, // 마커를 표시할 지도 객체
					zIndex:300
				});
				
			     var infowindow = new kakao.maps.InfoWindow({
				        content: '<div> 포인트명: '+name+'</div>'
				    }); 
			     
			    kakao.maps.event.addListener(marker, 'mouseover', function(mouseEvent) { 
			    	infowindow.open(map,marker);
			    	marker.setOpacity(1);
				});
			    
			    kakao.maps.event.addListener(marker, 'mouseout', function(mouseEvent) {  
					     infowindow.close();
					     marker.setOpacity(0.01);
				    });  
		}
		
		var polylines=[];
		

		// 인포윈도우
		var infowindow = new kakao.maps.InfoWindow({
		        map: map,
		        content:'',
		        removable:true,
		        disableAutoPan:true
		});

		// 라인 표시
		function displayLine(coordinates, name, color){
			var path = []; 
		$.each(coordinates[0], function(index, coordinate){
			//라인 그려줄 path
			path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
		})
			// 지도에 선을 표시한다 
			var polyline  = new kakao.maps.Polyline({
				map: map, // 선을 표시할 지도 객체 
				path: path,
				strokeWeight: 4, // 선의 두께
				strokeColor: color, // 선 색
				strokeOpacity: 0.9, // 선 투명도
			});
		
			// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
		    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
		    kakao.maps.event.addListener(polyline, 'mouseover', function(mouseEvent) {
			    polyline.setOptions({
			    strokeColor: '#4aed64'
			    })
			});
		    kakao.maps.event.addListener(polyline, 'mouseout', function(mouseEvent) {
			    polyline.setOptions({
				    strokeColor: color
				    })
			    });
		    kakao.maps.event.addListener(polyline, 'click', function(mouseEvent) {
				    polyline.setOptions({
				    strokeColor: '#4aed64'
		        })
				    var loc = mouseEvent.latLng;
				    var length=Math.ceil(polyline.getLength());
				    var content='<div> 상세 코스명: '+name+'</div><div> 길이: '+length+'m</div>';
					infowindow.open(map);
				    infowindow.setPosition(loc);
				    infowindow.setContent(content);
		    })
		}
	
	</script>
