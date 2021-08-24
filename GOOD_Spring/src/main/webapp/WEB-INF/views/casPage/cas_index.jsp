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
	top: 43% !important;
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
	left: -18px;
}

.owl-carousel .owl-next {
	right: -18px;
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
	width: 20px;
	background-color: rgb(255, 255, 255);
	outline: none;
	border: 0;
}

.fa-heart-o {
	color: #FF685F;
	cursor: pointer;
}

.fa-heart {
	color: #FF685F;
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
								<c:url value="/casPage/cas_detail.do" var="detailUrl">
									<c:param name="SVCID" value="${item_exp.SVCID }"></c:param>
								</c:url>
								<div class="thumbnail item">
									<img src="${item_exp.IMGURL }" alt="창의체험 썸네일 이미지(없는이미지)"
										onclick="location.href='${detailUrl}'"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_exp.MAXCLASSNM }<span class="middel_dot"></span>${item_exp.MINCLASSNM}
											<c:set var="book_Unique" value="${outputUnique}" />
											<c:choose>
												<c:when test="${fn:contains(book_Unique, item_exp.SVCID)}">
													<button class="heart pull-right liked" type="button"
														value="${item_exp.DIV_COL}"
														data-value="${item_exp.SVCID}">
														<i class="fa fa-heart" aria-hidden="true" role="button"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button class="heart pull-right" type="button"
														value="${item_exp.DIV_COL}"
														data-value="${item_exp.SVCID}">
														<i class="fa fa-heart-o" aria-hidden="true" role="button"></i>
													</button>
												</c:otherwise>
											</c:choose>
										</p>
										<h4 class="explan">${item_exp.SVCNM }</h4>
										<p class="pull-left" style="max-width: 70%;">${item_exp.PLACENM}</p>
										<p class="pull-right" style="max-width: 30%;">${item_exp.SVCSTATNM}</p>
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
								<c:url value="/casPage/cas_detail.do" var="detailUrl">
									<c:param name="SVCID" value="${item_imp.SVCID }"></c:param>
								</c:url>
								<div class="thumbnail item">
									<img src="${item_imp.IMGURL }" alt="자기계발 썸네일 이미지(없는이미지)"
										onclick="location.href='${detailUrl}'"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_imp.MAXCLASSNM }<span class="middel_dot"></span>${item_imp.MINCLASSNM}
											<c:set var="book_Unique" value="${outputUnique}" />
											<c:choose>
												<c:when test="${fn:contains(book_Unique, item_imp.SVCID)}">
													<button class="heart pull-right liked" type="button"
														value="${item_imp.DIV_COL}"
														data-value="${item_imp.SVCID}">
														<i class="fa fa-heart" aria-hidden="true" role="button"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button class="heart pull-right" type="button"
														value="${item_imp.DIV_COL}"
														data-value="${item_imp.SVCID}">
														<i class="fa fa-heart-o" aria-hidden="true" role="button"></i>
													</button>
												</c:otherwise>
											</c:choose>
										</p>
										<h4 class="explan">${item_imp.SVCNM }</h4>
										<p class="pull-left" style="max-width: 70%;">${item_imp.PLACENM}</p>
										<p class="pull-right" style="max-width: 30%;">${item_imp.SVCSTATNM}</p>
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
								<c:url value="/casPage/cas_detail.do" var="detailUrl">
									<c:param name="SVCID" value="${item_borrow.SVCID }"></c:param>
								</c:url>
								<div class="thumbnail item">
									<img src="${item_borrow.IMGURL }" alt="장소대여 썸네일 이미지(없는이미지)"
										onclick="location.href='${detailUrl}'"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_borrow.MAXCLASSNM }<span class="middel_dot"></span>${item_borrow.MINCLASSNM}
											<c:set var="book_Unique" value="${outputUnique}" />
											<c:choose>
												<c:when test="${fn:contains(book_Unique, item_borrow.SVCID)}">
													<button class="heart pull-right liked" type="button"
														value="${item_borrow.DIV_COL}"
														data-value="${item_borrow.SVCID}">
														<i class="fa fa-heart" aria-hidden="true" role="button"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button class="heart pull-right" type="button"
														value="${item_borrow.DIV_COL}"
														data-value="${item_borrow.SVCID}">
														<i class="fa fa-heart-o" aria-hidden="true" role="button"></i>
													</button>
												</c:otherwise>
											</c:choose>
										</p>
										<h4 class="explan">${item_borrow.SVCNM }</h4>
										<p class="pull-left" style="max-width: 70%;">${item_borrow.PLACENM}</p>
										<p class="pull-right" style="max-width: 30%;">${item_borrow.SVCSTATNM}</p>
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
								<c:url value="/casPage/cas_detail.do" var="detailUrl">
									<c:param name="SVCID" value="${item_sprot.SVCID }"></c:param>
								</c:url>
								<div class="thumbnail item">
									<img src="${item_sprot.IMGURL }" alt="체육시설 썸네일 이미지(없는이미지)"
										onclick="location.href='${detailUrl}'"
										style="max-height: 100%; max-width: 100%; cursor: pointer;">
									<div class="caption clearfix">
										<p>
											${item_sprot.MAXCLASSNM }<span class="middel_dot"></span>${item_sprot.MINCLASSNM}
											<c:set var="book_Unique" value="${outputUnique}" />
											<c:choose>
												<c:when test="${fn:contains(book_Unique, item_sprot.SVCID)}">
													<button class="heart pull-right liked" type="button"
														value="${item_sprot.DIV_COL}"
														data-value="${item_sprot.SVCID}">
														<i class="fa fa-heart" aria-hidden="true" role="button"></i>
													</button>
												</c:when>
												<c:otherwise>
													<button class="heart pull-right" type="button"
														value="${item_sprot.DIV_COL}"
														data-value="${item_sprot.SVCID}">
														<i class="fa fa-heart-o" aria-hidden="true" role="button"></i>
													</button>
												</c:otherwise>
											</c:choose>
										</p>
										<h4 class="explan">${item_sprot.SVCNM }</h4>
										<p class="pull-left" style="max-width: 70%;">${item_sprot.PLACENM}</p>
										<p class="pull-right" style="max-width: 30%;">${item_sprot.SVCSTATNM}</p>
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
	<!-- 찜버튼 스크립트 -->
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
											heart
												.html(
														'<i class="fa fa-heart-o" aria-hidden="true"></i>');
											heart.removeClass("liked");
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
											heart
												.html(
														'<i class="fa fa-heart-o" aria-hidden="true"></i>');
											heart
												.removeClass(
													"liked");
										}
									})

								} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
									heart
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true"></i>');
									heart
										.removeClass(
											"liked");
									swal(
										'취소',
										'제거가 취소되었습니다.',
										'error');
								}
							});
				} else {
					var catid = $(this).attr('value');
					var svcid = $(this).data('value');
					var heart = $(this);
					var URL = window.location.href;
					swal({
						title: '확인',
						text: "찜목록에 추가할까요?",
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

											console.log("성공 >> " + req);
											heart
											.html(
													'<i class="fa fa-heart" aria-hidden="true"></i>');
											heart.addClass("liked");
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
											heart
											.html(
													'<i class="fa fa-heart-o" aria-hidden="true"></i>');
											heart.removeClass("liked");
										}
									})

								} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
									heart
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true"></i>');
									heart
										.removeClass(
											"liked");
									swal(
										'취소',
										'취소되었습니다.',
										'error');
								}
							});
				}

			});
	</script>
	<!-- 찜버튼 스크립트 끝 -->
</body>
</html>