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
<style type="text/css">
/** 공통 영역 **/
* {
	margin: 0;
	padding: 0;
}

.wrapper {
	padding-bottom: 60px;
	min-height: auto;
}

html, body {
	height: 100%;
	width: 100%;
}

.body a {
	text-decoration: none;
}

.body p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.body .row {
	padding-bottom: 20px;
	width: auto;
	margin: auto;
}

.text-center {
	padding-top: 30px;
}

.bookItem {
	position: relative;
	margin-bottom: 20px;
	display: inline-block;
}

.bookItem .thumbnail img {
	max-height: 100%;
	min-height: 100%;
	height: 180px;
	width: 180px;
	vertical-align: middle;
	float: left;
	margin-bottom: 0;
	border: 1px solid #ddd;
	border-radius: 4px 0 0 4px;
}

.bookItem .thumbnail .map {
	max-height: 100%;
	min-height: 100%;
	height: 180px;
	width: 180px;
	vertical-align: middle;
	float: left;
	margin-bottom: 0;
	border: 1px solid #ddd;
	border-radius: 4px 0 0 4px;
}

.thumbnail {
	border: 0;
}

.bookItem .caption {
	height: 180px;
	padding: 15px 10px 15px 10px;
	vertical-align: middle;
	width: calc(100% - 180px);
	float: left;
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-radius: 0 4px 4px 0;
}

.caption p {
	color: #495056;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.caption h4 {
	color: #495056;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

/*찜하기 버튼*/
.heart {
	z-index: 1000;
	cursor: pointer;
	background-color: rgb(255, 255, 255);
	outline: none;
	border: 0;
}

.fa-heart {
	color: #FF685F;
	cursor: pointer;
}

/** 호버 CSS **/
.item {
	position: relative;
	transition: all 0.3s ease;
	transform: translateY(0);
	padding: 0;
	overflow: auto;
}

.item:hover {
	transform: translate(0, -2px);
	box-shadow: 0 2px 4px rgba(102, 109, 117, 0.4);
}
</style>

</head>

<body>
	<div class="wrapper">
		<!-- 상단영역 시작 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 상단영역 끝 -->
		<div class="container">
			<div class="header header_p text-center" style="margin-bottom: 50px;">
				<h2>나의 찜한 목록</h2>
			</div>
			<div class="row bookmark" id="item-box"
				data-length="${fn:length(output) }">
								<c:if test="${fn:length(output)==0}">
				<h2 class="nooutput" style="text-align: center;">
				현재 찜한 페이지가 없습니다
				</h2>
				</c:if>
				<c:forEach var="item" items="${output}" varStatus="status">
					<c:url value="/casPage/cas_detail.do" var="CasDetailUrl">
						<c:param name="SVCID" value="${item.SVCID }" />
					</c:url>
					<c:url value="/walkPage/walk_detailCourse.do" var="WalkDetailUrl">
						<c:param name="COURSE_NAME" value="${item.COURSE_NAME }" />
					</c:url>
					<div class="col-xs-12 col-md-12 col-lg-6 bookItem">
						<div class="thumbnail item">
							<c:choose>
								<c:when test="${fn:contains(item.category_id, '길') }">
									<div class="map" id="map${status.index }"
										onclick="location.href='${WalkDetailUrl}'"
										data-dept1="${item.category_id}"
										data-dept2="${item.service_id }"></div>
									<div class="caption clearfix">
										<p>
											카테고리 : ${item.category_id}
											<button class="heart liked pull-right" type="button"
												value="${item.category_id}" data-value="${item.service_id}">
												<i class="fa fa-heart" aria-hidden="true" role="button"></i>
											</button>
										</p>
										<h4>코스이름 : ${item.COURSE_NAME }</h4>
										<p>장소 : ${item.AREA_GU}</p>
										<p>코스거리 : ${item.DISTANCE }</p>
										<p class="pull-left" style="max-width: 60%;">소요시간 :
											${item.LEAD_TIME }</p>
										<p class="pull-right" style="max-width: 40%;">코스레벨 :
											${item.COURSE_LEVEL }</p>
									</div>
								</c:when>
								<c:otherwise>
									<img alt="썸네일 이미지" src="${item.IMGURL}"
										onclick="location.href='${CasDetailUrl}'"
										style="cursor: pointer;">
									<div class="caption clearfix">
										<p>
											카테고리 : ${item.category_id}
											<button class="heart liked pull-right" type="button"
												value="${item.category_id}" data-value="${item.service_id}">
												<i class="fa fa-heart" aria-hidden="true" role="button"></i>
											</button>
										</p>
										<h4>서비스이름 : ${item.SVCNM }</h4>
										<p>장소 : ${item.AREANM}</p>
										<p>이용시간 : ${item.VMIN } ~ ${item.VMAX }</p>
										<p class="pull-left" style="max-width: 60%;">대상연령 :
											${item.USETGTINFO }</p>
										<p class="pull-right" style="max-width: 40%;">이용요금 :
											${item.PAYATNM }</p>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 페이지 번호 구현 -->
		<div class="text-center">
			<%-- 이전 그룹에 대한 링크 --%>
			<ul class="pagination">
				<c:choose>
					<%-- 이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="${getList }" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}" />
						</c:url>
						<li class="page-item"><a href="${prevPageUrl}">&laquo;</a></li>
					</c:when>
				</c:choose>

				<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
				<c:forEach var="i" begin="${pageData.startPage}"
					end="${pageData.endPage}" varStatus="status">
					<%-- 이동할 URL 생성 --%>
					<c:url value="${getList }" var="pageUrl">
						<c:param name="page" value="${i}" />
					</c:url>

					<%-- 페이지 번호 출력 --%>
					<c:choose>
						<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
						<c:when test="${pageData.nowPage == i}">
							<li class="page-item active"><span style="color: #fff;">${i}<span
									class="sr-only">(current)</span></span></li>
						</c:when>
						<%-- 나머지 페이지의 경우 링크 적용함 --%>
						<c:otherwise>
							<li class="page-item"><a href="${pageUrl}">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<%-- 다음 그룹에 대한 링크 --%>
				<c:choose>
					<%-- 다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.nextPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/myPage/myPage_bookmark.do" var="nextPageUrl">
							<c:param name="page" value="${pageData.nextPage}" />
						</c:url>
						<li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
					</c:when>
				</c:choose>
			</ul>
		</div>
	</div>
	
	<%@ include file="../inc/plugin.jsp"%>
	<%@ include file="../inc/Footer.jsp"%>
	<script type="text/javascript">
	/**
	 * 찜목록 추가제거 (김도운)
	 */
	// 하트
	$(".heart")
		.on(
			"click",
			function() {
				if ($(this).hasClass("liked")) {
					var catid = $(this).attr('value');
					var svcid = $(this).data('value');
					var heart = $(this);
					var URL = window.location.href;
					swal({
						title: '확인',
						text: "찜목록에서 제거할까요?",
						type: 'question',
						confirmButtonText: '네',
						showCancelButton: true,
						cancelButtonText: '아니요',
					})
						.then(
							function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
								if (result.value) { // 확인 버튼이 눌러진 경우
									$.ajax({
										cache: false,
										url: getContextPath() + '/casPage/BookMark',
										type: 'POST',
										dataType: 'json',
										data: { catid, svcid, URL},
										timeout: 10000,
										success: function(req) {

											console.log("삭제 성공 >> " + req);
											swal(
												'성공',
												'찜목록에서 제거되었습니다.',
												'success').then(function (result) {
												location.reload();
												}), {
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
										}
									})

								} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
									swal(
										'취소',
										'제거가 취소되었습니다.',
										'error');
							}
					});
				} 
			});
	</script>
	<script type="text/javascript">
		//화면에 표시되는 리스트의 개수를 저장하는 변수
	    var length = $('#item-box').data('length');

		//지도에서 사용될 변수들의 초기 선언.
	    
	    var container = [];


		//리스트 하나당 반복문 한번.
	    for (var j = 0; j < length; j++) {
		//반복문이 한번 실행될때마다 지도와 선, 마커 등의 객체를 초기화해준다.
			var polyline=null;
			var marker=null;
	        let courseCategoryNM = $('#map' + j).data('dept1');
	        let courseName = $('#map' + j).data('dept2');
	        

	        console.log(courseCategoryNM + '/' + courseName + ' map = ' + j);
	        
	        if(courseName != null && courseName != 'undefined') {
	        	courseName=courseName.replace(" ","")
	        	 // 카카오 지도
		        container = document.getElementById('map'+ j); //지도를 담을 영역의 DOM 레퍼런스
		        var options = { 
		           //지도를 생성할 때 필요한 기본 옵션
		           center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표 
		           level : 5,  // 지도의 확대 레벨 
		           scrollwheel : false,
		           draggable : false,
		           tileAnimation : false
		        };
		        let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		        let bounds = new kakao.maps.LatLngBounds();  
		        
		        courseName=courseName.replace(" ","").replace(" ","").replace("ㆍ","").replace(" ","")
		        if(courseName.indexOf("(")>-1){
		        courseName=courseName.substring(0, courseName.indexOf("(")-1)
		        }
		        if(courseName=='1코스-수락·불암산코스'){courseName='수락·불암산 코스';}
		        if(courseName=='2코스-용마·아차산코스'){courseName='용마·아차산 코스';}
		        if(courseName=='3코스-고덕·일자산코스'){courseName='고덕·일자산 코스';}
		        if(courseName=='4코스-대모·우면산코스'){courseName='대모·우면산 코스';}
		        if(courseName=='5코스-관악산코스'){courseName='관악산 코스';}
		        if(courseName=='6코스-안양천코스'){courseName='안양천 코스';}
		        if(courseName=='7코스-봉산·앵봉산코스'){courseName='봉산·앵봉산 코스';}
		        if(courseName=='8코스-북한산코스'){courseName='북한산 코스';}
		        if(courseName=="인왕산구간"){courseName="인왕구간";}
		        if(courseName=="불광천길"){courseName="불광천긴";}
		        if(courseName=="성동광진구한강길"){courseName="성동광진한강길";}
		        

		        
		         

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
		                	   console.log("displayLine함수 map?"+ map)
			                      displayLine(coordinates, data[index], map);
		                      }            
		               })
		           })
		           
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
		                	   console.log("displayLine함수 map?"+ map)
		                      displayLine(coordinates, data[index], map);
		                      } 
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
		                	 console.log("displayLine함수 map?"+ map)
		                      displayLine(coordinates, data[index], map);
		                   }     
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
		                	   console.log("displayLine함수 map?"+ map)
			                      displayLine(coordinates, data[index], map);
		                   } 
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
			                      displayLine(coordinates, data[index], map);
		                   } 
		               })
		           })
		           
		         }
		        
		           var polylines=[];
		           
			        
		           function displayLine(coordinates, data, map){
		             var name = data.properties.CONTS_NAME;
		             if(data.properties.CONTS_NAME == null || data.properties.CONTS_NAME == ''){
		                name = data.properties.NAME;
		             }
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
		                 strokeWeight: 3, // 선의 두께
		                 strokeColor: '#FF685F', // 선 색
		                 strokeOpacity: 0.9, // 선 투명도
		              });
		              var length=Math.ceil(polyline.getLength());
		             length = (length / 1000).toFixed(1);
		             if(length < 2){
		                polyline.setOptions({
		                   strokeOpacity: 0.9
		                });
		             }
		           
		               map.setBounds(bounds);   
		        }
		      }
	       }
	</script>
</body>
</html>