<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<head>
<meta charset="utf-8">
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 300px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}
.wrap * {
	padding: 0;
	margin: 0;
}
.wrap .info {
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	background: #fff;
}
.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}
.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}
.container {
	padding: 10px;
}
.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}
.info .close:hover {
	cursor: pointer;
}
.info .body {
	position: relative;overflow: hidden;
}
.info:after {
    content: '';
    position: absolute;
    margin-left: -12px;
    left: 50%;
    bottom: 0;
    width: 22px;
    height: 12px;
    background: url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png);
}
.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}
</style>
</head>

<div id="map" style="height: 520px; margin: auto"></div>

<!-- // 본문 JS시작 -->
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
	var colors = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
	
	function getRandomInt(min, max) {
	     min = Math.ceil(min);
	     max = Math.floor(max);
	     return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
	 }
		
	/* 서울둘레길 선형정보 */
    $.getJSON(getContextPath()+"/assets/map/moonhwa_line.geojson", function(geojson){
       
     var data = geojson.features;
     var coordinates = [];    //좌표 저장할 배열
     var name = '';            //코스 이름
   
     
     $.each(data, function(index, val) {
    	 var color = '#'+colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] +
	  	 colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)];
    	 
         coordinates = val.geometry.coordinates;
         name = val.properties.CONTS_NAME;
         
         displayLine(coordinates, data[index], color);
        })
    })
    
var overlay = new kakao.maps.CustomOverlay({
        map: map,
        content:'',
        disableAutoPan:true,
        removable : true
});	
var polylines=[];
var isoverlay = false;
// 라인 표시
function displayLine(coordinates, data, color){
	
	var name = data.properties.NAME;
	var path = []; 
	var addr = null;
    if(data.properties.ADDR_NEW == null && data.properties.ADDR_OLD == null){
   	 addr = '정보 없음';
    } else if(data.properties.ADDR_OLD != null && data.properties.ADDR_OLD != ''){
   	 addr = data.properties.ADDR_OLD
    } else if(data.properties.ADDR_NEW != null && data.properties.ADDR_NEW != ''){
    	addr = data.properties.ADDR_NEW;
    }
    
    
$.each(coordinates[0], function(index, coordinate){
	//라인 그려줄 path
	path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
})
	// 지도에 선을 표시한다 
	var polyline  = new kakao.maps.Polyline({
		map: map, // 선을 표시할 지도 객체 
		path: path,
		strokeWeight: 6, // 선의 두께
		strokeColor: color, // 선 색
		strokeOpacity: 0.9, // 선 투명도
	});
	 var length=Math.ceil(polyline.getLength());
    	length = (length / 1000).toFixed(1);
	console.log('options = '+options.toString())
	// 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다 
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polyline, 'mouseover', function(mouseEvent) {
	    polyline.setOptions({
    	clickable: true,
	    strokeColor: '#FF0000'
	    })
	});
    kakao.maps.event.addListener(polyline, 'mouseout', function(mouseEvent) {
	    polyline.setOptions({
		    strokeColor: color
		    })
	    });
    kakao.maps.event.addListener(polyline, 'click', function(mouseEvent) {
		    polyline.setOptions({
		    strokeColor: '#FF0000'
        })
		    
		    
        // 인포윈도우에 들어갈 내용
         var content = '<div class="wrap">' + 
        	'<div class="info">' + 
            '<div class="title">' + 
            name + 
            '<div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '</div>' + 
            '<div class="container">' +
            '<div class="body">' + 
            '테마명 : 생태문화길' +
            '</div>' + 
            '<div class="desc">' + 
            '<div class="ellipsis">' +'주소 : '+ addr + '</div>' + 
            '<div class="ellipsis">' + '거리 : ' + length + 'Km' + '</div>' + 
            '</div>' + 
            '</div>' + 
            '</div>' +    
            '</div>' +
        '</div>';
		    var loc = mouseEvent.latLng;
		    
		    
		    if(!isoverlay) {
		        // 인포윈도우 지도에 표시
			    overlay.setMap(map);
			    overlay.setPosition(loc);
			    overlay.setContent(content);
		    } else {
		    	overlay.setMap(null);
		    }
	    })
}
	
 // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    function closeOverlay() {
    	overlay.setMap(null);     
    }
	</script>
