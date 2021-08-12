<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style>
/*찜하기 버튼*/
.fa-heart-o {
	color: #FF685F;
	cursor: pointer;
}

.fa-heart {
	color: #FF685F;
	cursor: pointer;
}

#heart_button {
	margin-bottom: 30px
}

.detail_map {
	padding-left: 20px;
}

.admin_content {
	padding-left: 20px;
}

ul, li {
	list-style: none;
}

.info li {
	border: 1px solid #eee;
	padding: 17px 20px 20px 10px;
	border-bottom: 1px solid #ddd;
}

.info p {
	font-size: 25px;
	display: inline;
}

.info strong {
	font-size: 25px;
}
.btn-bookmark {
	background-color: #ffdedd;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../inc/Header.jsp"%>

		<div class="row">
			<div class="container" style="margin-bottom: 10px;">
				<div class="header clearfix" style="margin-bottom: 50px;">
					<h1 style="text-align: center;">&lt; ${output.COURSE_NAME}
						&gt;</h1>
					<button class="btn btn-blue disabled pull-right"
						style="cursor: default; padding-top: 0; padding-bottom: 0;">
						<h4>총 ${output.COUNT_BM} 명의 사용자가 찜한 코스입니다!</h4>
					</button>
				</div>


				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12">
						<!-- 지도 영역 -->
						<div class="detail_map">
							<div class="map" id="map" style="width: 500px; height: 520px;"></div>

						</div>

						<!-- 버튼 -->
						<div class="btn_container"
							style="text-align: center; margin-left: -50px; margin-top: 30px;">

							<!-- 							<button class="btn btn-info" type="submit" -->
							<!-- 								style="font-size: 20px; width: 140px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;"> -->
							<!-- 								<span style="font-size: 20px;"><i -->
							<!-- 									class="glyphicon glyphicon-arrow-right" -->
							<!-- 									style="padding-right: 5px;"></i> 위치 안내</span> -->
							<!-- 							</button> -->
							<c:if test="${outputcount eq 1}">
								<button class="heart btn btn-bookmark liked" id="heart_button"
									type="button" style="width: 140px; font-size: 18px;">
									<i class="fa fa-heart" aria-hidden="true" role="button"
										style="padding-right: 5px; font-size: 18px;"></i>찜제거
								</button>
							</c:if>
							<c:if test="${outputcount eq 0}">
								<button class="heart btn btn-bookmark" id="heart_button"
									type="button" style="width: 140px; font-size: 18px;">
									<i class="fa fa-heart-o" aria-hidden="true" role="button"
										style="padding-right: 5px; font-size: 18px;"></i> 찜하기
								</button>
							</c:if>
						</div>
					</div>


					<!-- 포인트 상세 설명 -->
					<div class="col-md-6 col-sm-12 col-xs-12 main_info">
						<ul class="info">
							<li class="infoItem"><strong class="infoLabel">지역 :</strong>
								<p class="infoText">${output.AREA_GU }</p></li>
							<li class="infoItem"><strong class="infoLabel">거리 :
							</strong>
								<p class="infoText">${output.DISTANCE }</p></li>
							<li class="infoItem"><strong class="infoLabel">소요시간
									: </strong>
								<p class="infoText">${output.LEAD_TIME }</p></li>
							<li class="infoItem"><strong class="infoLabel">난이도
									: </strong>
								<p class="infoText">
									<c:choose>
										<c:when test="${output.COURSE_LEVEL =='1'}">초급</c:when>
										<c:when test="${output.COURSE_LEVEL =='2'}">중급</c:when>
										<c:when test="${output.COURSE_LEVEL =='3'}">고급</c:when>
									</c:choose>
								</p></li>
							<li class="infoItem"><strong class="infoLabel">세부코스
									: </strong>
								<p class="infoText">${output.DETAIL_COURSE }</p></li>
							<li class="infoItem"><strong class="infoLabel">교통편
									: </strong>
								<p class="infoText">${output.TRAFFIC_INFO }</p>
								<h3 class="infoText">[관련지하철 - ${output.RELATE_SUBWAY }]</h3></li>
							<li class="infoItem">
								<h2 style="text-align: center;">- ${output.COURSE_NAME} -</h2>
								<p class="infoText">${output.CONTENT }</p>
								<h3 class="infoText">[추가날짜:${output.REG_DATE }]</h3>
							</li>
						</ul>
					</div>
					<!-- // 포인트 상세 설명 -->
					<!-- 코스 전체 포인트 테이블 -->
					<h2>- ${output.COURSE_NAME} 의 세부경로 포인트-</h2>
					<table class="table table-hover table-condensed table-responsive">
						<thead>
							<tr>
								<th class="col-xs-1"><h4>번호</h4></th>
								<th class="col-xs-3"><h4>코스포인트</h4></th>
								<th class="col-xs-8"><h4>포인트 설명</h4></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<%-- 조회결과가 없는 경우 --%>
								<c:when
									test="${output_path==null || fn:length(output_path)==0 }">
									<tr>
										<td align="center">경로가 존재하지 않습니다.</td>
									</tr>
								</c:when>
								<%-- 조회결과가 있는 경우 --%>
								<c:otherwise>
									<%-- 조회 결과에 따른 반복 처리 --%>
									<c:forEach var="item" items="${output_path }"
										varStatus="status">
										<%-- 출력을 위해 준비한 변수 --%>
										<c:set var="CPI_NAME" value="${item.CPI_NAME }" />

										<c:set var="COURSE_NAME" value="${item.COURSE_NAME }" />
										<c:set var="CPI_CONTENT" value="${item.CPI_CONTENT }" />

										<%-- 										상세페이지로 이동하기 위한 URL --%>
										<%-- 										<c:url value="/walkPage/walk_detailCourse.do" var="viewUrl"> --%>
										<%-- 											<c:param name="CPI_IDX" value="${item.CPI_IDX }" /> --%>
										<%-- 										</c:url> --%>

										<tr>
											<td><h4>${status.index +1 }</h4></td>
											<td><h4>${CPI_NAME }</h4></td>
											<td><h4>${CPI_CONTENT }</h4></td>
										</tr>

									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<!-- //코스 전체 포인트 테이블 -->


				</div>
				<div class="text-center">
					<button
						onclick="location.href='${pageContext.request.contextPath}/walkPage/walk_search.do'"
						class="btn btn-default"
						style="font-size: 20px; width: 140px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
						코스목록</button>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../inc/Footer.jsp"%>

	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	b6b1199a25d6406101fb441c0afa0e00&libraries=services,clusterer,drawing"></script>
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
		level : 6
	// 지도의 확대 레벨 
	};
	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	var bounds = new kakao.maps.LatLngBounds();  
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
	
	
	
	var courseName='${output.COURSE_NAME}'
	console.log(courseName)
	courseName=courseName.replace(" ","").replace(" ","").replace("ㆍ","").replace(" ","")
	console.log(courseName)
	if(courseName.indexOf("(")>-1){
	courseName=courseName.substring(0, courseName.indexOf("(")-1)
	console.log(courseName)
	}
	if(courseName=="인왕산구간"){courseName="인왕구간"}
	if(courseName=="불광천길"){courseName="불광천긴"}
	if(courseName=="성동광진구한강길"){courseName="성동광진한강길"}
	
	var courseCategoryNM='${output.COURSE_CATEGORY_NM}'.replace(" ","");
	var colors = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'];
	
	function getRandomInt(min, max) {
	     min = Math.ceil(min);
	     max = Math.floor(max);
	     return Math.floor(Math.random() * (max - min)) + min; //최댓값은 제외, 최솟값은 포함
	 }
	 var color = '#'+colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] +
	 colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)]
	 var color2 = '#'+colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] +
	 colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)] + colors[getRandomInt(0, 16)]
	
		<!-- geoJson 파일 불러와서 카카오 맵에 표시 -->
		if(courseCategoryNM=='한강지천길/계절길'){
		/* 지천길 선형정보 */
		$.getJSON(getContextPath()+"/assets/map/jichun_line.geojson", function(geojson){
			
	    var data = geojson.features;
	    var coordinates = [];    //좌표 저장할 배열
	    var name = '';            //코스 이름
	    $.each(data, function(index, val) {
	 
	        coordinates = val.geometry.coordinates;
	        name_trim = (val.properties.NAME).replace(" ","");
	        name = val.properties.NAME
	           if(name_trim.indexOf(courseName)!=-1){
		           displayLine(coordinates, name, color);
		           map.setDraggable(false);
		           map.setZoomable(false); 
	           	}         	
	    	})
		})
		
		/* 지천길 점형 정보 */
		/* $.getJSON(getContextPath()+"/assets/map/jichun_point.geojson", function(geojson_p){
			var data_p = geojson_p.features;
			var coordinates_p = [];
			var name_p= '';

			$.each(data_p, function(index,val){
				
				coordinates_p=val.geometry.coordinates;
		        name_p = val.properties.NAME;
		        displayPoint(coordinates_p, name_p);
			})
		}) */
		}
		if(courseCategoryNM=='근교산자락길'){
		/* 자락길 선형정보 */
		$.getJSON(getContextPath()+"/assets/map/jarak_line.geojson", function(geojson){
			
	    var data = geojson.features;
	    var coordinates = [];    //좌표 저장할 배열
	    var name = '';            //코스 이름
	    $.each(data, function(index, val) {
	 
	        coordinates = val.geometry.coordinates;
	        name_trim = (val.properties.CONTS_NAME).replace(" ","");
	        name = val.properties.CONTS_NAME
	           if(name_trim.indexOf(courseName)!=-1){
		           displayLine(coordinates, name, color);
		           map.setDraggable(false);
		           map.setZoomable(false); 
	           	} 
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
			
		}
		
		/* 서울둘레길 선형정보 */
		if(courseCategoryNM=='서울둘레길'){
      $.getJSON(getContextPath()+"/assets/map/doolrea_line.geojson", function(geojson){
         
       var data = geojson.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = '';            //코스 이름
       
       $.each(data, function(index, val) {
    
           coordinates = val.geometry.coordinates;
           name_trim = (val.properties.CONTS_NAME).replace(" ","");
           name = val.properties.CONTS_NAME
           if(name_trim.indexOf(courseName)!=-1){
	           displayLine(coordinates, name, color);
	           map.setDraggable(false);
	           map.setZoomable(false); 
           	} 	 
          })
      })
      
		/* 서울둘레길 점형정보 */
      $.getJSON(getContextPath()+"/assets/map/doolrea_point.geojson", function(geojson){
         
       var data = geojson.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = '';            //코스 이름
       
       $.each(data, function(index, val) {
    
    	   coordinates_p = val.geometry.coordinates;
           name_p = val.properties.NAME;
           displayPoint(coordinates_p, name_p);
          })
      })
		}
		
		if(courseCategoryNM=='한양도성길'){
      /* 한양도성길 선형정보 */
      $.getJSON(getContextPath()+"/assets/map/hanyang_line.geojson", function(geojson){
         
       var data = geojson.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = '';            //코스 이름
       
       $.each(data, function(index, val) {
    
           coordinates = val.geometry.coordinates;
           name_trim = (val.properties.NAME).replace(" ","");
           name=val.properties.NAME;
	           if(name_trim.indexOf(courseName)!=-1){
	           displayLine(coordinates, name, color);
	           map.setDraggable(false);
	           map.setZoomable(false); 
           	} 
          })
      })
      
      /* 한양도성길 점형정보 */
      $.getJSON(getContextPath()+"/assets/map/hanyang_point.geojson", function(geojson){
         
       var data = geojson.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = '';            //코스 이름
       
       $.each(data, function(index, val) {
    
    	   coordinates_p = val.geometry.coordinates;
           name_p = val.properties.NAME;
           displayPoint(coordinates_p, name_p);
          })
      })
		}
		
      if(courseCategoryNM=='생태문화길'){
      /* 생태문화길 선형정보 */
      $.getJSON(getContextPath()+"/assets/map/moonhwa_line.geojson", function(geojson){
         
       var data = geojson.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = '';            //코스 이름

       $.each(data, function(index, val) {
    
           coordinates = val.geometry.coordinates;
           name_trim = (val.properties.NAME).replace(" ","").replace(" ","");
           name = val.properties.NAME;
	        folderpath_trim = (val.properties.FOLDERPATH).replace(" ","").replace(" ","");
	           if(name_trim==courseName||folderpath_trim.indexOf(courseName)!=-1){
	           displayLine(coordinates, name, color);
	           map.setDraggable(false);
	           map.setZoomable(false); 
           	} 
          })
      })
      
      /* 생태문화길 점형정보 */
     /*  $.getJSON(getContextPath()+"/assets/map/moonhwa_point.geojson", function(geojson){
         
       var data = geojson.features;
       var coordinates = [];    //좌표 저장할 배열
       var name = '';            //코스 이름
       
       $.each(data, function(index, val) {
    
           coordinates_p = val.geometry.coordinates;
           name_p = val.properties.NAME;
           displayPoint(coordinates_p, name_p);
          })
      }) */
      }
		
		function displayPoint(coordinates, name){
			var point=null;
				point=new kakao.maps.LatLng(coordinates[1], coordinates[0]);
				// 지도에 마커를 생성하고 표시한다
				var marker = new kakao.maps.Marker({
					opacity:1,
					position: point, // 마커의 좌표
					map: map, // 마커를 표시할 지도 객체
					zIndex:99
				});
				
			     var infowindow = new kakao.maps.InfoWindow({
				        content: '<div> 포인트명: '+name+'</div>'
				    }); 
			     
			    kakao.maps.event.addListener(marker, 'mouseover', function(mouseEvent) { 
			    	infowindow.open(map,marker);
				});
			    
			    kakao.maps.event.addListener(marker, 'mouseout', function(mouseEvent) {  
					     infowindow.close();
				    });  
		}
		
		var polylines=[];
		

		//인포윈도우
		var infowindow = new kakao.maps.InfoWindow({
		        map: map,
		        content:'',
		        removable:true,
		        disableAutoPan:true,
		        zIndex:100
		});

	
		function displayLine(coordinates, name, color){
			var path = []; 

		$.each(coordinates[0], function(index, coordinate){
			//라인 그려줄 path
			path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0]));
			bounds.extend(path[index]);
		})
			// 지도에 선을 표시한다 
			var polyline  = new kakao.maps.Polyline({
				map: map, // 선을 표시할 지도 객체 
				path: path,
				strokeWeight: 4, // 선의 두께
				strokeColor: color, // 선 색
				strokeOpacity: 0.9, // 선 투명도
			});
		
			//폴리라인 마우스 오버 이벤트
		    kakao.maps.event.addListener(polyline, 'mouseover', function(mouseEvent) {
			    polyline.setOptions({
			    strokeColor: color2
			    })
			});
			//폴리라인 마우스 아웃 이벤트
		    kakao.maps.event.addListener(polyline, 'mouseout', function(mouseEvent) {
			    polyline.setOptions({
				    strokeColor: color
				    })
			    });
			//폴리라인 클릭이벤트
		    kakao.maps.event.addListener(polyline, 'click', function(mouseEvent) {
				    polyline.setOptions({
				    strokeColor: color2
		        })
				    var loc = mouseEvent.latLng;
				    var length=Math.ceil(polyline.getLength());
				    var content='<div> 상세 코스명: '+name+'</div><div> 길이: '+length+'m</div>';
					infowindow.open(map);
				    infowindow.setPosition(loc);
				    infowindow.setContent(content);
		    })
		    map.setBounds(bounds);
		    
	}
		<!-- //geoJson 파일 불러와서 카카오 맵에 표시 -->
	</script>

	<script type="text/javascript">
	$(function(){
		$(".btn-default").click(function(){
			location.href="${pageContext.request.contextPath}/walkPage/walk_search.jsp";

							});

		});
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/Book-Mark.js">
	</script>
	<script>
	// 찜 추가
	function addBookMark(){
	var catid = '${output.COURSE_CATEGORY_NM}';
	var svcid = '${output.COURSE_NAME}';
	
	$.ajax({
		catch:false,
		url: getContextPath()+'/walkPage/BookMark',
		type: 'post',
		dataType : 'json',
		data : {catid, svcid},
		timeout : 10000,
		success: function(req){
			console.log("성공 : " + req);
			$(".heart").html(
                  '<i class="fa fa-heart" aria-hidden="true" style="padding-right:5px;"></i> 찜제거');
            $(".heart").addClass(
               "liked");
            swal(
               '성공',
               '찜목록에 추가되었습니다.',
               'success');
            setTimeout(function() {
            }, 1000);
         },
         error: function(error) {
            console.log("에러 >> " + error.status);
            swal('주의', '찜추가에 실패했습니다.', 'warning'), {
               closeOnClickOutside: false,
               closeOnEsc: false,
               buttons: {
                  confirm: {
                     text: '닫기',
                     value: true,
                     className: 'btn btn-outline-primary'
                  }
               }
            }
            $(".heart")
               .html(
                  '<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
            $(".heart")
               .removeClass("liked");
         }
      })
   }
	// 찜삭제
	function deleteBookMark() {
		var catid = '${output.COURSE_CATEGORY_NM}';
		var svcid = '${output.COURSE_NAME}';
// 		svcid = String(svcid);

		$.ajax({
			catch:false,
			url: getContextPath()+'/walkPage/BookMark',
			type: 'post',
			dataType : 'json',
			data : {catid, svcid},
			timeout : 10000,
			success: function(req){
				console.log("삭제 : " + req);
			$(".heart").html(
            '<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
      		$(".heart").removeClass("liked");
      		swal(
                    '성공',
                    '찜목록에서 제거되었습니다.',
                    'success'), {
                    buttons: {
                       confirm: {
                          text: '닫기',
                          value: true,
                          className: 'btn btn-outline-primary'
                       }
                    }
                 }
                 setTimeout(function() {
                 }, 1000);
              },
              error: function(error) {
                 console.log("에러 >> " + error.status);
                 swal('주의', '찜목록에 제거하기가 실패했습니다.', 'warning'), {
                    closeOnClickOutside: false,
                    closeOnEsc: false,
                    buttons: {
                       confirm: {
                          text: '닫기',
                          value: true,
                          className: 'btn btn-outline-primary'
                       }
                    }
                 }
                 $(".heart")
                    .html(
                       '<i class="fa fa-heart" aria-hidden="true" style="padding-right:5px;"></i> 찜제거');
                 $(".heart")
                    .removeClass(
                       "liked");
              }
           })
        }
	</script>
</body>
</html>