<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<style>
.wk_log {
	margin-bottom: 30px;
}

/** 캐러셀 영역 CSS **/
.item {
	transition: all 0.3s ease;
	transform: translateY(0);
	padding: 0;
}

.item:hover {
	transform: translate(0, -2px);
	box-shadow: 0 2px 4px rgba(102, 109, 117, 0.4);
}

.good_item, .walking_item, .show_item, .exp_item, .adu_item, .crew_item
	{
	padding-top: 6px;
	padding-left: 5px;
	padding-right: 5px;
	position: relative;
}

.owl-carousel .owl-nav {
	overflow: hidden;
	height: 0px;
}

.owl-stage-outer {
	padding-top: 5px;
}

.owl-srtage {
	width: 100%
}

.item .caption {
	border-top: 1px solid rgba(102, 109, 117, 0.32);
}

.owl-item {
	padding-right: 5px;
	padding-left: 5px;
}

/** 버튼 CSS 적용 **/
.owl-carousel .nav-button {
	height: 40px;
	width: 40px;
	cursor: pointer;
	position: absolute;
	top: 40% !important;
	border: 1px solid rgba(102, 109, 117, 0.32);
	box-shadow: 0 2px 2px rgba(102, 109, 117, 0.32);
	transition: all 0.3s ease;
	transform: translateY(0);
}

.owl-carousel .nav-button p {
	text-align: center;
	margin-top: 5px;
	font-size: 20px;
}

.owl-carousel .owl-prev p {
	margin-right: 3px;
}

.owl-carousel .owl-next p {
	margin-left: 3px;
}

.owl-carousel .owl-prev.disabled, .owl-carousel .owl-next.disabled {
	display: none;
}

.owl-carousel .owl-prev {
	left: -20px;
}

.owl-carousel .owl-next {
	right: -20px;
}

.owl-theme .owl-nav [class*=owl-] {
	background: #ffffff;
	border-radius: 180px;
}

.owl-carousel .nav-button:hover {
	transform: translate(0, -2px);
	box-shadow: 0 3px 10px rgba(102, 109, 117, 0.32);
}

/*찜하기 버튼*/
.wishlist {
	position: absolute;
	top: 2px;
	right: 3px;
	z-index: 1000;
	cursor: pointer;
	width: 30px;
	height: 30px;
}

.heart i {
	margin-top: 8px;
	margin-left: 8px;
}

.fa-heart-o {
	color: red;
	cursor: pointer;
}

.fa-heart {
	color: red;
	cursor: pointer;
}

.wk_row {
	margin-bottom: 30px;
}

.wk_header h1 {
	position: relative;
}

.carousel-title {
	margin-top: 70px;
}

carousel-title2 {
	margin-top: 50px;
}

.wk_log {
	margin-top: 20px;
	height: 10px;
}

/**Modal CSS */
.modal-header {
	text-align: center;
	padding-top: 10px;
}

.modal-footer {
	text-align: center;
}

.input-group-addon>a {
	text-decoration: none;
}

.modal-header>p {
	font-size: 20px;
}
</style>


</head>


<body>
	<!-- 공용 헤더 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
	<!-- 걷기 메인 페이지 -->
	<div class="container wk_log_container">
		<div class="header wk_header text-center">
			<h1 class="page-header page-title" id="wk_header">
				걷기<img
					src="${pageContext.request.contextPath}/assets/icon_img/걷기 아이콘.png;"
					style="width: 3rem; height: 3rem; position: relative; bottom: 3px; left: 5px;"></img>
			</h1>

		</div>

		<div class="pull-right">
			<div class="wk_log" id="wk_log">
				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#myModal">걷기 기록 하기</button>

			</div>
		</div>

		<div class="pull-right" style="margin-right: 20px;">
			<div class="wk_log" id="wk_log">
				<a href="${pageContext.request.contextPath}/walkPage/walk_log.do"
					class="btn btn-info">걷기 Log</a>
			</div>
		</div>


		<div class="map" id="map" style="width: 100%; height: 400px;"></div>

		<!-- 캐러셀 영역 명예의 전당-->

		<div class="header text-center carousel-title clearfix">
			<h2>
				<strong>명예의 전당 코스<img
					src="${pageContext.request.contextPath}/assets/icon_img/명예의 전당_아이콘.png"
					style="width: 44px; height: 44px; position: relative; bottom: 5px;"></img></strong>
			</h2>
			<div class="pull-right">
				<a
					href="${pageContext.request.contextPath}/walkPage/walk_hallOfFame.do"
					style="text-decoration: none;">더 보기 &gt;</a>
			</div>
		</div>

		<!-- 캐러셀 영역 -->

		<div class="row good_item wk_row">
			<!--  캐러셀 시작 -->
			<div class="owl-carousel owl-theme" id="owl-GOOD">
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지1" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당1</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지2" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당2</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지3" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당3</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지4" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당4</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지5" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당5</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지6" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당6</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지7" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당7</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지8" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당8</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지9" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당9</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지10" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당10</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
			</div>

		</div>
		<!-- 케러셀 영역 끝 -->

		<!-- 캐러셀 영역 코스 목록-->

		<div class="header text-center carousel-title2 clearfix">
			<h2>
				<strong>코스 목록<img
					src="${pageContext.request.contextPath}/assets/icon_img/코스 목록_아이콘.png;"
					style="width: 44px; height: 44px; position: relative; bottom: 5px; margin-left: 5px"></img></strong>
			</h2>
			<div class="pull-right">
				<a href="${pageContext.request.contextPath}/walkPage/walk_search.do"
					style="text-decoration: none;">더 보기 &gt;</a>
			</div>

		</div>

		<!-- 캐러셀 영역 -->
		<div class="row good_item wk_row">
			<!--  캐러셀 시작 -->
			<div class="owl-carousel owl-theme" id="owl-GOOD">
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지1" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당1</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지2" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당2</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지3" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당3</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지4" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당4</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지5" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당5</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지6" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당6</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지7" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당7</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지8" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당8</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지9" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당9</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
				<div class="thumbnail item" onclick="location.href='#'"
					style="cursor: pointer;">
					<img src="#" alt="테스트이미지10" height="200" width="250">
					<div class="caption">
						<h4>명예의 전당10</h4>
						<p>여기 가봐라</p>
					</div>
					<div class="wishlist">
						<span class=heart><i class="fa fa-heart-o"
							aria-hidden="true" role="button"></i> </span>
					</div>
				</div>
			</div>

		</div>
		<!-- 케러셀 영역 끝 -->

	</div>


	<!-- Modal -->
	<div class="modal fade" id="myModal" style="z-index: 100000000;">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<!-- content -->
				
					<div class="modal-header">
						<h3>
							<strong>걷기 기록</strong>
						</h3>
						<p>기록하고 싶은 해당 코스를 입력해주세요.</p>
					</div>

					<div class="modal-body">

						<div>
						<h3>
							<a class="accordian-toggle" data-toggle="collapse"
								data-parent="#category_acco" href="#category_list"> 카테고리별 검색<i
								class="glyphicon glyphicon-chevron-down"
								style="color: #bcbcbc; font-size: 17px; left: 6px;"></i>
							</a>
						</h3>
						<div id="category_list" class="panel-collapse collapse">
							<div class="panel-body">
								<!-- 검색 하기 창 -->
								<div class="form-group input-group">
									<input type="text" id="course_search" class="form-control"
										placeholder="검색하기" /> <span class="input-group-btn">
										<button class="btn btn-blue" type="submit">
											<span style="color: #0069a6;">검색 </span><i
												class="glyphicon glyphicon-search" style="color: #0069a6;"></i>
										</button>
									</span>
								</div>
								<!-- //검색 하기 창 -->
								<!-- 카테고리영역 -->
								<form class="form-horizontal" role="form">
									<fieldset>
										<div class="form-group">
											<div class="col-xs-3">
												<select class="form-control">
													<option value="">유형별</option>
													<option value="1">한양도성길</option>
													<option value="2">근교산자락길</option>
													<option value="3">생태문화길</option>
													<option value="4">한양/지천길</option>
													<option value="5">서울둘레길</option>
												</select>
											</div>
											<div class="col-xs-3">
												<select class="form-control">
													<option value="">지역</option>
													<option value="all">전체</option>
													<option value="gangnam">강남구</option>
													<option value="gangdong">강동구</option>
													<option value="gangbug">강북구</option>
													<option value="gangseo">강서구</option>
													<option value="gwan-ag">관악구</option>
													<option value="gwangjin">광진구</option>
													<option value="gulo">구로구</option>
													<option value="geumcheon">금천구</option>
													<option value="nowon">노원구</option>
													<option value="dobong">도봉구</option>
													<option value="dongdaemun">동대문구</option>
													<option value="dongjag">동작구</option>
													<option value="mapo">마포구</option>
													<option value="seodaemun">서대문구</option>
													<option value="seocho">서초구</option>
													<option value="seongdong">성동구</option>
													<option value="seongbug">성북구</option>
													<option value="songpa">송파구</option>
													<option value="yangcheon">양천구</option>
													<option value="yeongdeungpo">영등포구</option>
													<option value="yongsan">용산구</option>
													<option value="eunpyeong">은평구</option>
													<option value="jonglo">종로구</option>
													<option value="jung-gu">중구</option>
													<option value="junglang">중랑구</option>
												</select>
											</div>
											<div class="col-sm-2 col-xs-3 pull-right">
												<select class="form-control">
													<option value="">거리별</option>
													<option value="time">시간별</option>
													<option value="level">난이도별</option>
												</select>
											</div>
										</div>
									</fieldset>
								</form>
								<!-- //카테고리영역 -->
							</div>
						</div>
					</div>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-warning" data-dismiss="modal"
							style="width: 150px;">닫기</button>
						<button type="submit" class="btn btn-primary" data-dismiss="modal"
							style="width: 150px;">시작</button>

					</div>
				


			</div>
		</div>
	</div>



	<!-- 공용 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	b6b1199a25d6406101fb441c0afa0e00&libraries=services,clusterer,drawing"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		function relayout() {

			// 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
			// 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다
			// window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
			map.relayout();
		}

		//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
	</script>

	<script>
		//캐러셀 JS
		$('.owl-carousel')
				.owlCarousel(
						{
							loop : false,
							margin : 10,
							nav : true,
							navText : [
									"<div class='nav-button owl-prev'><p>&lt;</p></div>",
									"<div class='nav-button owl-next'><p>&gt;</p></div>" ],
							dots : false,
							slideBy : 3,
							responsiveClass : true,
							responsive : {
								0 : {
									items : 2,
									nav : false
								},
								600 : {
									items : 3,
									nav : false
								},
								1000 : {
									items : 4,
									nav : true
								}
							}
						});
	</script>
	<!-- //캐러셀 -->
	<script>
		// 하트
		$(".heart")
				.on(
						"click",
						function() {
							if ($(this).hasClass("liked")) {
								$(this)
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true"></i>');
								$(this).removeClass("liked");
							} else {
								$(this)
										.html(
												'<i class="fa fa-heart" aria-hidden="true"></i>');
								$(this).addClass("liked");
							}
						});
	</script>
	<!-- //하트 -->



</body>
</html>