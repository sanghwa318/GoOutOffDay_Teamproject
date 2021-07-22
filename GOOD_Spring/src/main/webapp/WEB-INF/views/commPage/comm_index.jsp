<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<style type="text/css">
/** 공통 영역 **/
html, body {
	height: 100%;
	width: 100%;
}

a {
	text-decoration: none;
}

#content .row {
	padding-bottom: 20px;
	width: auto;
	margin: auto;
}

p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

h4 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	min-height: 38px;
	margin-top: 0;
}

.header .pull-right {
	padding-top: 43px;
	padding-right: 10px;
}

/** 본문 영역 공통 **/
.header  h2 {
	position: relative;
}

.show_list .header h2:after {
	content: "";
	background-image: url("../icon_img/걷기 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.exp_list .header h2:after {
	content: "";
	background-image: url("../icon_img/크루 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 1px;
}

.visible-xs {
	border-bottom: 1px solid #ddd;
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

.show_item, .exp_item, .adu_item, .sport_item {
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
	font-size: 1.25rem;
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

.body .header {
	padding-top: 20px;
	padding-bottom: 10px;
}

.main_header h1 {
	position: relative;
	text-align: center;
	font-size: 2.75rem;
}

.main_header {
	border-bottom: 1px solid rgba(102, 109, 117, 0.32);
}
.page-header>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}
</style>
</head>

<body>
	<div class="wrapper">

		<!-- 상단영역 시작 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- // 상단영역 끝 -->
		<!-- 본문 컨테이터 -->
		<div class="container" id="content">
			<h1 class="page-header page-title text-center">
				커뮤니티<img src="<%=request.getContextPath()%>/assets/icon_img/커뮤니티 아이콘.png" />
			</h1>
			<!-- 본문영역 시작 -->
			<div class="comm_index_middle">

				<!-- 본문 나만의 코스 -->
				<div class="row show_list">
					<div class="header clearfix">
						<h2 class="pull-left">나만의 코스</h2>
						<div class="pull-right">
							<a href="${pageContext.request.contextPath}/commPage/comm_myCourse.do">더 보기 &gt;</a>
						</div>
					</div>
					<!-- 공연 전시 문화 캐러셀 영역 -->
					<div class="row show_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지1" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지2" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지3" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지4" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지5" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지6" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지7" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지8" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지9" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지10" height="166" width="250">
								<div class="caption clearfix">
									<p>한적한 도심길</p>
									<h4>거리가 조용하고 이쁘네요</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">테헤란로</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- // 나만킈코스 영역 끝 -->
				<!-- 영역 구분선 모바일에서만 표시 -->
				<div class="visible-xs"></div>
				<!-- // 영역 영역 구분선 끝 -->
				<!-- 본문 크루 영역 -->
				<div class="row exp_list">
					<div class="header clearfix">
						<h2 class="pull-left">크루</h2>
						<div class="pull-right">
							<a href="${pageContext.request.contextPath}/commPage/comm_crew.do">더 보기 &gt;</a>
						</div>
					</div>
					<!-- 창의 체험 캐러셀 영역 -->
					<div class="row exp_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지1" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지2" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지3" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지4" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지5" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지6" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지7" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지8" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지9" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
							<div class="thumbnail item" onclick="location.href='#'"
								style="cursor: pointer;">
								<img src="#" alt="테스트이미지10" height="166" width="250">
								<div class="caption clearfix">
									<p>걷기크루</p>
									<h4>20~30대 환영합니다~^^</h4>
									<p class="pull-left">강남</p>
									<p class="pull-right">강남대로</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- // 크루 영역 끝 -->

			</div>
			<!-- // 본문영역 끝 -->
		</div>
	</div>
	<!-- 하단영역 시작 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- // 하단영역 끝 -->
	<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
	<script>
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
</body>
</html>