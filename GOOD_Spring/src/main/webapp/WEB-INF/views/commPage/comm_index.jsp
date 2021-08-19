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

/** 영역 조정 **/
.owl-theme .item .map {
	height: 180px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}

.owl-theme .item img {
	height: 180px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
}
.thumbnail img {
	max-hieght: 100%;
	min-width: 100%;
	height: 180px;
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
				커뮤니티<img
					src="<%=request.getContextPath()%>/assets/icon_img/커뮤니티 아이콘.png" />
			</h1>
			<!-- 본문영역 시작 -->
			<div class="comm_index_middle" >

				<!-- 본문 나만의 코스 -->
				<div class="row show_list">
					<div class="header clearfix">
						<h2 class="pull-left">나만의 코스</h2>
						<div class="pull-right">
							<a
								href="${pageContext.request.contextPath}/commPage/comm_myCourse.do">더
								보기 &gt;</a>
						</div>
					</div>
					<!-- 나만의 코스 캐러셀 영역 -->
					<div class="row exp_item" id="item-box"
						data-length="${fn:length(mycourses)}">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<c:forEach var="item" items="${mycourses}" varStatus="status">
								<c:url value="/commPage/comm_myCourseDetail.do" var="detailUrl">
									<c:param name="mycourse_no" value="${item.mycourse_no}"></c:param>
								</c:url>
								<div class="thumbnail item" id="item${status.index}"
									data-mycourseno='${item.mycourse_no}'
									onclick="location.href='${detailUrl}'">
									<div class="map" id="map${status.index}"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									</div>
									<div class="caption clearfix">
										<p>나만의 코스</p>
										<h4 class="explan">${item.mycourse_name}</h4>
										<p class="pull-left" style="max-width: 70%;">${item.mycourse_area}</p>
										<p class="pull-right" style="max-width: 30%;">좋아요
											${item.like}</p>
									</div>
								</div>
							</c:forEach>
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
							<a
								href="${pageContext.request.contextPath}/commPage/comm_crew.do">더
								보기 &gt;</a>
						</div>
					</div>
					<!-- 크루 캐러셀 영역 -->
					<div class="row exp_item">
						<!--  캐러셀 시작 -->
						<div class="owl-carousel owl-theme" id="owl-walk">
							<c:forEach var="item" items="${crew}" varStatus="status">
								<c:url value="/commPage/comm_crew_info.do" var="detailUrl">
									<c:param name="crew_no" value="${item.crew_no}"></c:param>
								</c:url>
								<div class="thumbnail item">
									<img src="${item.crew_photo.fileUrl}" alt="크루 이미지"
										onclick="location.href='${detailUrl}'"
										style="cursor: pointer;">
									<div class="caption clearfix">
										<p>${item.crew_name}크루</p>
										<h4 class="explan">${item.crew_sinto}</h4>
										<p class="pull-left" style="max-width: 70%;">${item.crew_area}</p>
										<p class="pull-right" style="max-width: 30%;">회원수
											${item.crew_member}명</p>
									</div>
								</div>
							</c:forEach>
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
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/myCourseList-js.js">
		
	</script>
</body>
</html>