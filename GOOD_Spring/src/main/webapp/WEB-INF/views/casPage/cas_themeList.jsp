<%@page import="java.net.URLEncoder"%>
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

.body .text-center {
	padding-bottom: 20px;
}

.body .cas_list {
	padding-bottom: 0;
}

.body .main_header {
	padding-bottom: 0;
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

.header h1 {
	position: relative;
}

.cas_list .header h1:after {
	content: "";
	background-image: url(${iconurl});
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.item .caption {
	border-top: 1px solid rgba(102, 109, 117, 0.32);
}

/** 태그 정렬 **/
.orderBy_tag {
	padding-bottom: 15px;
}

.orderBy_tag .cas_category {
	padding: 0 10px;
	font-size: 15px;
	color: #343a40;
}

.cas_category.active {
	color: #0098ed;
}

/** 호버 CSS **/
.item {
	position: relative;
	transition: all 0.3s ease;
	transform: translateY(0);
	padding: 0;
}

.item:hover {
	transform: translate(0, -2px);
	box-shadow: 0 2px 4px rgba(102, 109, 117, 0.4);
}

/** item부분 영역 **/
.casItem {
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 30px;
}

.body .header {
	padding-bottom: 10px;
	padding-top: 20px;
}

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.main_header>h1:hover {
	transform: translate(0, -10px);
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 5px;
}

.cas_item .item img {
	height: 180px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	max-height: 100%;
	min-width: 100%;
}

.order_tag {
	padding-bottom: 10px;
	padding-left: 5px;
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
.body .cas_item .caption p {
	color: #848c94;
}

.body .cas_item .caption h4 {
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
	<!-- [페이지네이션] -->
	<c:set var="URL" value="/casPage/cas_themeList.do" />
	<!-- //[페이지네이션] -->
	<!-- 상단영역 시작 -->
	<%@ include file="../inc/Header.jsp"%>
	<!-- // 상단영역 끝 -->
	<!-- 본문영역 시작 -->
	<div class="container">
		<div class="body">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/casPage/cas_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">문화 체육<img
						src="${pageContext.request.contextPath }/assets/icon_img/문화체육 아이콘.png;" />
					</span>
				</h1>
			</div>
			<!-- 본문 게시판 시작 -->
			<div class="row cas_list">
				<!-- cas 최상단 제목 -->
				<div class="header">
					<h1 style="color: #343a40;">${result }</h1>
				</div>
				<!-- 문화체육 카테고리별 소분류 태그 -->
				<div class="orderBy_tag">
					<!-- 창의 체험 -->
					<c:if test="${cas eq '문화'}">
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
							class="cas_category <c:if test="${order eq ''}">active</c:if>"
							data-filter="전체">전체</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=교육체험"
							class="cas_category <c:if test="${order eq '교육체험'}">active</c:if>"
							data-filter="교육체험">교육체험</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=농장체험"
							class="cas_category <c:if test="${order eq '농장체험'}">active</c:if>"
							data-filter="농장체험">농장체험</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=문화행사"
							class="cas_category <c:if test="${order eq '문화행사'}">active</c:if>"
							data-filter="문화행사">문화행사</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=전시"
							class="cas_category <c:if test="${order eq '전시'}">active</c:if>"
							data-filter="전시/관람">전시/관람</a>
					</c:if>

					<!-- 장소대여 문화 -->
					<c:if test="${cas eq '대관'}">
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
							class="cas_category <c:if test="${order eq ''}">active</c:if>"
							data-filter="전체">전체</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=다목적실"
							class="cas_category <c:if test="${order eq '다목적실'}">active</c:if>"
							data-filter="다목적실">다목적실</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=캠핑장"
							class="cas_category <c:if test="${order eq '캠핑장'}">active</c:if>"
							data-filter="캠핑장">캠핑장</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=강당"
							class="cas_category <c:if test="${order eq '강당'}">active</c:if>"
							data-filter="강당">강당</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=강의실"
							class="cas_category <c:if test="${order eq '강의실'}">active</c:if>"
							data-filter="강의실">강의실</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
							class="cas_category <c:if test="${order eq '기타'}">active</c:if>"
							data-filter="기타">기타</a>
					</c:if>

					<!-- 자기 계발  -->
					<c:if test="${cas eq '교육'}">
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
							class="cas_category <c:if test="${order eq ''}">active</c:if>"
							data-filter="전체">전체</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=공예"
							class="cas_category <c:if test="${order eq '공예'}">active</c:if>"
							data-filter="공예/취미">공예/취미</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=자연과학"
							class="cas_category <c:if test="${order eq '자연과학'}">active</c:if>"
							data-filter="교양/어학">자연/과학</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=스포츠"
							class="cas_category <c:if test="${order eq '스포츠'}">active</c:if>"
							data-filter="스포츠">스포츠</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=어학"
							class="cas_category <c:if test="${order eq '어학'}">active</c:if>"
							data-filter="전문/자격증">교양/어학</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
							class="cas_category <c:if test="${order eq '기타'}">active</c:if>"
							data-filter="기타">기타</a>
					</c:if>

					<!-- 체육시설  -->
					<c:if test="${cas eq '체육'}">
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
							class="cas_category <c:if test="${order eq ''}">active</c:if>"
							data-filter="전체">전체</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=배드민턴"
							class="cas_category <c:if test="${order eq '배드민턴'}">active</c:if>"
							data-filter="체육관">배드민턴장</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=축구장"
							class="cas_category <c:if test="${order eq '축구장'}">active</c:if>"
							data-filter="축구장">축구장</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=풋살장"
							class="cas_category <c:if test="${order eq '풋살장'}">active</c:if>"
							data-filter="풋살장">풋살장</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=다목적경기장"
							class="cas_category <c:if test="${order eq '다목적경기장'}">active</c:if>"
							data-filter="다목적경기장">다목적경기장</a>
						<a
							href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
							class="cas_category <c:if test="${order eq '기타'}">active</c:if>"
							data-filter="기타">기타</a>
					</c:if>
				</div>
				<div class="row cas_item">
					<c:forEach var="item_theme" items="${output_theme }">
						<c:url value="/casPage/cas_detail.do" var="detailUrl">
							<c:param name="SVCID" value="${item_theme.SVCID }" />
						</c:url>
						<div class="col-xs-6 col-sm-4 col-md-3 casItem">
							<div class="thumbnail item">
								<img alt="테스트이미지 1번" src="${item_theme.IMGURL }"
									onclick="location.href='${detailUrl}'" style="cursor: pointer;">
								<div class="caption clearfix">
									<p>
										${item_theme.MAXCLASSNM }<span class="middel_dot"></span>${item_theme.MINCLASSNM}
										<span class="heart pull-right"><i class="fa fa-heart-o"
											aria-hidden="true" role="button"></i></span>
									</p>
									<h4 class="explan">${item_theme.SVCNM }</h4>
									<p class="pull-left" style="max-width: 110px;">${item_theme.PLACENM}</p>
									<p class="pull-right">${item_theme.SVCSTATNM}</p>
								</div>
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
								<c:param name="cas" value="${cas}" />
								<c:param name="order" value="${order}" />
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
							<c:param name="cas" value="${cas}" />
							<c:param name="order" value="${order}" />
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
							<c:url value="/casPage/cas_themeList.do" var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
								<c:param name="cas" value="${cas}" />
								<c:param name="order" value="${order}" />
							</c:url>
							<li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
		<!-- // 본문영역 끝 -->
	</div>
	<!-- 하단영역 시작 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- // 하단영역 끝 -->
	<%@ include file="../inc/plugin.jsp"%>
	<script>
		// 하트
		$(".heart")
				.on(
						"click",
						function() {
							if ($(this).hasClass("liked")) {
								swal({
									title : '확인',
									text : "찜목록에서 제거할까요?",
									type : 'question',
									confirmButtonText : '네',
									showCancelButton : true,
									cancelButtonText : '아니요',
								})
										.then(
												function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
													if (result.value) { // 확인 버튼이 눌러진 경우
														deleteBookMark();

													} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
														$(".heart")
																.html(
																		'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜제거');
														$(".heart")
																.removeClass(
																		"liked");
														swal('취소',
																'제거가 취소되었습니다.',
																'error');
													}
												});
							} else {
								swal({
									title : '확인',
									text : "찜목록에 추가할까요?",
									type : 'question',
									confirmButtonText : '네',
									showCancelButton : true,
									cancelButtonText : '아니요',
								})
										.then(
												function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
													if (result.value) { // 확인 버튼이 눌러진 경우
														addBookMark();

													} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
														$(".heart")
																.html(
																		'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
														$(".heart")
																.removeClass(
																		"liked");
														swal('취소', '취소되었습니다.',
																'error');
													}
												});
							}

						});
	</script>
</body>
</html>