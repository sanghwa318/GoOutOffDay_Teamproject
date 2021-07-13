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

html, body {
	height: 100%;
	width: 100%;
}

.body a {
	text-decoration: none;
}

.body .row {
	padding-bottom: 20px;
	width: auto;
	margin: auto;
}

.body p {
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.body h4 {
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
.body .main_header {
	padding-bottom: 0;
}

.body .header {
	padding-bottom: 10px;
	padding-top: 20px;
}

.main_header h1 {
	position: relative;
	text-align: center;
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 5px;
}

.header  h2 {
	position: relative;
	color: #343a40;
}

.show_list .header h2:after {
	content: "";
	background-image:
		url("${pageContext.request.contextPath}/assets/icon_img/장소대여 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 1px;
}

.exp_list .header h2:after {
	content: "";
	background-image:
		url("${pageContext.request.contextPath}/assets/icon_img/창의 체험 아이콘.png");
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
	background-image:
		url("${pageContext.request.contextPath}/assets/icon_img/자기계발 아이콘.png");
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.sport_list .header h2:after {
	content: "";
	background-image:
		url("${pageContext.request.contextPath}/assets/icon_img/체육시설 아이콘.png");
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
	position: relative;
	transition: all 0.3s ease;
	transform: translateY(0);
	padding: 0;
	margin: auto;
}

.owl-theme .item img {
	height: 180px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}

.item .caption {
	border-top: 1px solid rgba(102, 109, 117, 0.32);
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

.sport_list .sport_item {
	padding-bottom: 50px;
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
.heart {
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

/** 색상설정 **/
.body .show_item .caption p, .body .exp_item .caption p, .body .adu_item .caption p,
	.body .sport_item .caption p {
	color: #848c94;
}

.body .show_item .caption h4, .body .exp_item .caption h4, .body .adu_item .caption h4,
	.body .sport_item .caption h4 {
	color: #495056;
}

/** 대분류 소분류 사이의 중간점 **/
.middel_dot {
	content: "";
	display: inline-block;
	width: 2px;
	height: 2px;
	border-radius: 50%;
	background-color: #848c94;
	vertical-align: middle;
	margin: 0 5px;
}
</style>
</head>

<body>
	<div class="wrapper">
		<!-- 상단영역 시작 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- // 상단영역 끝 -->
		<!-- 본문 컨테이터 -->
		<div class="container">
			<!-- 본문영역 시작 -->
			<div class="body">
				<div class="row main_header">
					<h1 class="page-header page-title" id="cas_header"
						style="color: #343a40;">
						<span class="test01">문화 체육<img
							src="${pageContext.request.contextPath}/assets/icon_img/문화체육 아이콘.png;" />
						</span>
					</h1>
				</div>
				<!-- 본문 창의 체험 영역 -->
				<div class="row exp_list">
					<div class="header clearfix">
						<h2 class="pull-left">문화 창의 체험</h2>
						<div class="pull-right">
							<a
								href="${pageContext.request.contextPath}/casPage/cas_themeList.do?cas=문화">더
								보기 &gt;</a>
						</div>
					</div>
					<!-- 문화 창의 체험 캐러셀 영역 -->
					<div class="row exp_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<c:forEach var="item_exp" items="${output_exp }">
								<div class="thumbnail item">
									<img src="${item_exp.IMGURL }" alt="테스트이미지1"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_exp.MAXCLASSNM }<span class="middel_dot"></span>${item_exp.MINCLASSNM}<span
												class="heart pull-right"><i class="fa fa-heart-o"
												aria-hidden="true" role="button"></i></span>
										</p>
										<h4 class="explan">${item_exp.SVCNM }</h4>
										<p class="pull-left" style="max-width: 110px;">${item_exp.PLACENM}</p>
										<p class="pull-right">${item_exp.SVCSTATNM}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- // 문화 창의 체험 영역 끝 -->
				<!-- 영역 구분선 모바일에서만 표시 -->
				<div class="visible-xs"></div>
				<!-- // 영역 영역 구분선 끝 -->
				<!-- 본문 교육 자기계발 영역 -->
				<div class="row adu_list">
					<div class="header clearfix">
						<h2 class="pull-left">교육 자기 계발</h2>
						<div class="pull-right">
							<a
								href="${pageContext.request.contextPath}/casPage/cas_themeList.do?cas=교육">더
								보기 &gt;</a>
						</div>
					</div>
					<!-- 교육 자기계발 캐러셀 영역 -->
					<div class="row adu_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<c:forEach var="item_imp" items="${output_imp }">
								<div class="thumbnail item">
									<img src="${item_imp.IMGURL }" alt="테스트이미지1"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_imp.MAXCLASSNM }<span class="middel_dot"></span>${item_imp.MINCLASSNM}<span
												class="heart pull-right"><i class="fa fa-heart-o"
												aria-hidden="true" role="button"></i></span>
										</p>
										<h4 class="explan">${item_imp.SVCNM }</h4>
										<p class="pull-left" style="max-width: 110px;">${item_imp.PLACENM}</p>
										<p class="pull-right">${item_imp.SVCSTATNM}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- // 교육 자기계발 영역 끝 -->
				<!-- 영역 구분선 모바일에서만 표시 -->
				<div class="visible-xs"></div>
				<!-- // 영역 영역 구분선 끝 -->
				<!-- 본문 장소대여 영역 -->
				<div class="row show_list">
					<div class="header clearfix">
						<h2 class="pull-left">장소대여</h2>
						<div class="pull-right">
							<a
								href="${pageContext.request.contextPath}/casPage/cas_themeList.do?cas=대관">더
								보기 &gt;</a>
						</div>
					</div>
					<!-- 장소대여 캐러셀 영역 -->
					<div class="row show_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<c:forEach var="item_borrow" items="${output_borrow }">
								<div class="thumbnail item">
									<img src="${item_borrow.IMGURL }" alt="이미지"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_borrow.MAXCLASSNM }<span class="middel_dot"></span>${item_borrow.MINCLASSNM}<span
												class="heart pull-right"><i class="fa fa-heart-o"
												aria-hidden="true" role="button"></i></span>
										</p>
										<h4 class="explan">${item_borrow.SVCNM }</h4>
										<p class="pull-left" style="max-width: 110px;">${item_borrow.PLACENM}</p>
										<p class="pull-right">${item_borrow.SVCSTATNM}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- // 장소대여 영역 끝 -->
				<!-- 영역 구분선 모바일에서만 표시 -->
				<div class="visible-xs"></div>
				<!-- // 영역 영역 구분선 끝 -->
				<!-- 본문 체육시설 영역 -->
				<div class="row sport_list">
					<div class="header clearfix">
						<h2 class="pull-left">체육시설</h2>
						<div class="pull-right">
							<a
								href="${pageContext.request.contextPath}/casPage/cas_themeList.do?cas=체육">더
								보기 &gt;</a>
						</div>
					</div>
					<!-- 체육시설 캐러셀 영역 -->
					<div class="row sport_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<c:forEach var="item_sprot" items="${output_sprot }">
								<div class="thumbnail item">
									<img src="${item_sprot.IMGURL }" alt="테스트이미지1"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_sprot.MAXCLASSNM }<span class="middel_dot"></span>${item_sprot.MINCLASSNM}<span
												class="heart pull-right"><i class="fa fa-heart-o"
												aria-hidden="true" role="button"></i></span>
										</p>
										<h4 class="explan">${item_sprot.SVCNM }</h4>
										<p class="pull-left" style="max-width: 110px;">${item_sprot.PLACENM}</p>
										<p class="pull-right">${item_sprot.SVCSTATNM}</p>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- // 체육시설 영역 끝 -->
			</div>
			<!-- // 본문영역 끝 -->
		</div>
	</div>
	<!-- 하단영역 시작 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- // 하단영역 끝 -->
	<%@ include file="../inc/plugin.jsp"%>
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
	<!-- 찜하기 버튼 -->
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
</body>
</html>