<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<style type="text/css">
/** 공통 영역 **/
* {
	margin: 0;
	padding: 0;
}

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

/** 본문 영역 공통 **/
.good_list .header {
	margin-bottom: 10px;
}

.header  h2 {
	position: relative;
}

.weatherBox {
	padding-top: 20px;
	padding-bottom: 60px;
}

.walking_list  .header  h2:after {
	content: "";
	background-image: url("${pageContext.request.contextPath}/assets/icon_img/걷기 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.show_list .header h2:after {
	content: "";
	background-image: url("${pageContext.request.contextPath}/assets/icon_img/공연전시문화 아이콘.png");
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
	background-image: url("${pageContext.request.contextPath}/assets/icon_img/창의 체험 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 1px;
}

.adu_list .header h2:after {
	content: "";
	background-image: url("${pageContext.request.contextPath}/assets/icon_img/자기계발 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.crew_list .header h2:after {
	content: "";
	background-image: url("${pageContext.request.contextPath}/assets/icon_img/크루 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.visible-xs {
	border-bottom: 1px solid #ddd;
}

/** 캐러셀 영역 CSS **/
.walking_item .item, .show_item .item, .exp_item .item, .adu_item.item,
	.crew_item .item {
	transition: all 0.3s ease;
	transform: translateY(0);
	padding: 0;
}

.walking_item .item:hover, .show_item .item:hover, .exp_item .item:hover,
	.adu_item.item:hover, .crew_item .item:hover {
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

.container .row .caption p {
	color: #848c94;
}

/** GOOD 영역 CSS 코드 **/
.good_item .item {
	height: 333px;
	overflow: hidden;
	border-radius: 8px;
	position: relative;
	z-index: 0;
	cursor: pointer;
}

.good_item .item img {
	position: absolute;
	left: 0;
	object-fit: cover;
	height: 100%;
	width: 100%;
	border-radius: 8px;
	z-index: -1;
	transition: all 2s ease-out;
	object-fit: cover;
	height: 100%;
	width: 100%;
	border-radius: 8px;
	z-index: -1;
	transition: all 2s ease-out;
	transform: scale(1.01);
}

.good_item .item:hover img {
	transform: scale(1.2);
	transition: all 4s ease-out;
}

.owl-item {
	padding-right: 5px;
	padding-left: 5px;
}

.module_header {
	position: absolute;
	top: 20px;
	left: 24px;
	right: 24px;
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
}

.module_header .module_title {
	font-size: 2rem;
	line-height: 1.29;
	text-shadow: 0 1px 8px rgba(33, 37, 41, 0.6);
	margin-right: 8px;
	color: #ffffff;
	margin-bottom: 0;
	margin-top: 10px;
}

.module_header .module_text {
	font-size: 1rem;
	line-height: 1.29;
	text-shadow: 0 1px 8px rgba(33, 37, 41, 0.6);
	margin-right: 8px;
	color: #ffffff;
}

.item .gradientBackground {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-image: linear-gradient(142deg, rgba(0, 0, 0, 0.7),
		hsla(0, 0%, 100%, 0) 65%);
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 시작 -->
		<%@ include file="inc/Header.jsp"%>
		<!-- // 상단영역 끝 -->
		<!-- 본문 영역 시작 -->
		<div class="container clearfix" id="content">
			<!-- 본문 최상단 Go Out Off Day 영역 -->
			<div class="row good_list">
				<!-- 최상단 제목 -->
				<div class="header">
					<h1>Go Out Off Day</h1>
				</div>
				<!-- 캐러셀 영역 -->
				<div class="row good_item">
					<!--  캐러셀 시작 -->
					<div class="owl-carousel owl-theme" id="owl-GOOD">
						<div class="item" id="bicycle_GOOD">
							<img src="${pageContext.request.contextPath}/assets/img/GOOD_img/today_bicycle1.png" alt="오늘의 자전거 항목 추천"
								style="cursor: pointer;" />
							<div class="gradientBackground"></div>
							<div class="module_header">
								<h2 class="module_title">자전거</h2>
								<span class="module_text">따릉이 타러갈래?</span>
							</div>
						</div>
						<div class="item" id="walk_GOOD">
							<img src="${pageContext.request.contextPath}/assets/img/GOOD_img/today_walk2.png" alt="오늘의 걷기 항목 추천"
								style="cursor: pointer;" />
							<div class="gradientBackground"></div>
							<div class="module_header">
								<h2 class="module_title">걷기</h2>
								<span class="module_text">같이 걸으러갈래?</span>
							</div>
						</div>
						<div class="item" id="cas_GOOD">
							<img src="${pageContext.request.contextPath}/assets/img/GOOD_img/today_img1.png" alt="오늘의 문화체육 항목 추천"
								style="cursor: pointer;" />
							<div class="gradientBackground"></div>
							<div class="module_header">
								<h2 class="module_title">문화 체육</h2>
								<span class="module_text">오늘은 어떤걸 배워볼래?</span>
							</div>
						</div>
						<div class="item" id="comm_GOOD">
							<img src="${pageContext.request.contextPath}/assets/img/GOOD_img/today_crew1.png" alt="오늘의 커뮤니티 항목 추천"
								style="cursor: pointer;" />
							<div class="gradientBackground"></div>
							<div class="module_header">
								<h2 class="module_title">커뮤니티</h2>
								<span class="module_text">같이 뭐하러갈까?</span>
							</div>
						</div>
					</div>
				</div>
				<!-- // 캐러셀 영역 끝 -->
			</div>
			<!-- 본문 날씨 영역 -->
			<div class="row weatherBox">
				<a class="weatherwidget-io"
					href="https://forecast7.com/en/37d57126d98/seoul/"
					data-label_1="SEOUL" data-label_2="WEATHER" data-font="Helvetica"
					data-icons="Climacons Animated" data-days="5"
					data-theme="weather_one">SEOUL WEATHER</a>
			</div>
			<!-- 본문 중단 걷기코스 영역 -->
			<div class="row walking_list">
				<div class="header">
					<h2>걷기코스</h2>
				</div>
				<!-- 걷기 캐러셀 영역 -->
				<div class="row walking_item">
					<!--  캐러셀 시작 -->
					<div class="owl-carousel owl-theme" id="owl-walk">
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지1" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지2" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지3" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지4" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지5" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지6" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지7" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지8" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지9" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지10" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									걷기코스 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>걷기코스 제목 AND 경로 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // 걷기코드 영역 끝 -->
			<!-- 영역 구분선 모바일에서만 표시 -->
			<div class="visible-xs"></div>
			<!-- // 영역 영역 구분선 끝 -->
			<!-- 본문 공연 전시 문화 영역 -->
			<div class="row show_list">
				<div class="header">
					<h2>공연 전시</h2>
				</div>
				<!-- 공연 전시 문화 캐러셀 영역 -->
				<div class="row show_item">
					<!--  캐러셀 시작 -->
					<div class="owl-carousel owl-theme" id="owl-walk">
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지1" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지2" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지3" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지4" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지5" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지6" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지7" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지8" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지9" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지10" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									공연 전시 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>공연 전시 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // 공연 전시 문화 영역 끝 -->
			<!-- 영역 구분선 모바일에서만 표시 -->
			<div class="visible-xs"></div>
			<!-- // 영역 영역 구분선 끝 -->
			<!-- 본문 창의 체험 영역 -->
			<div class="row exp_list">
				<div class="header">
					<h2>문화 창의 체험</h2>
				</div>
				<!-- 창의 체험 캐러셀 영역 -->
				<div class="row exp_item">
					<!--  캐러셀 시작 -->
					<div class="owl-carousel owl-theme" id="owl-walk">
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지1" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지2" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지3" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지4" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지5" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지6" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지7" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지8" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지9" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지10" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									문화 창의 체험 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>창의 체험 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // 창의 체험 영역 끝 -->
			<!-- 영역 구분선 모바일에서만 표시 -->
			<div class="visible-xs"></div>
			<!-- // 영역 영역 구분선 끝 -->
			<!-- 본문 교육 자기계발 영역 -->
			<div class="row adu_list">
				<div class="header">
					<h2>교육 자기계발</h2>
				</div>
				<!-- 교육 자기계발 캐러셀 영역 -->
				<div class="row adu_item">
					<!--  캐러셀 시작 -->
					<div class="owl-carousel owl-theme" id="owl-walk">
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지1" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지2" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지3" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지4" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지5" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지6" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지7" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지8" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지9" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지10" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									교육 자기계발 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>교육 자기계발 제목 OR 간단설명</h4>
								<p>장소</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // 교육 자기계발 영역 끝 -->
			<!-- 영역 구분선 모바일에서만 표시 -->
			<div class="visible-xs"></div>
			<!-- // 영역 영역 구분선 끝 -->
			<!-- 본문 크루 영역 -->
			<div class="row crew_list">
				<div class="header">
					<h2>크루</h2>
				</div>
				<!-- 크루 캐러셀 영역 -->
				<div class="row crew_item">
					<!--  캐러셀 시작 -->
					<div class="owl-carousel owl-theme" id="owl-walk">
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지1" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지2" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지3" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지4" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지5" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지6" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지7" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지8" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
							<div class="wishlist">
								<span class=heart><i class="fa fa-heart-o"
									aria-hidden="true" role="button"></i> </span>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지9" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
							<div class="wishlist">
								<span class=heart><i class="fa fa-heart-o"
									aria-hidden="true" role="button"></i> </span>
							</div>
						</div>
						<div class="thumbnail item">
							<img src="#" alt="테스트이미지10" height="166" width="250"
								style="cursor: pointer;" onclick="location.href='#'">
							<div class="caption">
								<p>
									크루 태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4>크루 이름</h4>
								<p>크루 간단 소개</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- // 크루 영역 끝 -->
		</div>
		<!-- // 본문영역 끝 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 푸터 영역 시작 -->
	<%@ include file="inc/Footer.jsp"%>
	<!-- // 푸터 영역 끝  -->

	<%@ include file="inc/plugin.jsp"%>
	<!-- // 본문 JS시작 -->
	<script>
		!function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (!d.getElementById(id)) {
				js = d.createElement(s);
				js.id = id;
				js.src = 'https://weatherwidget.io/js/widget.min.js';
				fjs.parentNode.insertBefore(js, fjs);
			}
		}(document, 'script', 'weatherwidget-io-js');
	</script>
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
	<!-- 찜하기 버튼 기능 -->
	<script>
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
	<!-- // 본문 JS 끝 -->
	<!-- 이젠 팝업 -->
<%-- 	<%@ include file="/WEB-INF/views/mainPage/cookie.jsp"%> --%>

</body>
</html>