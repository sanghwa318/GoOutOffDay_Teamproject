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
	bottom: 0px;
}

.body .main_header {
	padding-bottom: 0;
}

.thumbnail {
	padding: 0;
}

.title-img>img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>
	<!-- 상단영역 -->
	<%@ include file="../inc/Header.jsp"%>
	<!-- 본문영역 -->
	<div class="container">
		<!-- 제목영역 -->
		<!-- 대제목 -->
		<div class="row main_header">
			<h1 class="page-header page-title" id="cas_header"
				onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
				style="cursor: pointer; color: #343a40;">
				<span class="test01">커뮤니티<img
					src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
				</span>
			</h1>
		</div>
		<!-- 본문 게시판 시작 -->
		<div class="row cas_list">
			<!-- 커뮤니티 최상단 제목 -->
			<div class="header">
				<h1 style="color: #343a40;">나만의 코스</h1>
			</div>
			<!-- //제목영역 끝 -->
			<!-- 리스트영역-->
			<div class="row cas_item">
				<c:choose>
					<%--조회결과가 없는 경우 --%>
					<c:when test="${output==null || fn:length(output) == 0} ">
						<div class="null">
							<div align="center">조회결과가 없습니다.</div>
						</div>
					</c:when>
					<%--조회결과가 있는 경우  --%>
					<c:otherwise>
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item" items="${output}" varStatus="status">
							<%-- 출력을 위해 준비한 코스이름 변수  --%>
							<c:set var="mycourse_name" value="${item.mycourse_name}" />

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != '' }">
								<%-- 검색어에 <mark> 적용 --%>
								<c:set var="mark" value="<mark>${keyword}</mark>" />
								<%--출력을 위해 크루 이름에서 검색어와 일치하는 단어를 형광펜 효과 --%>
								<c:set var="mycourse_name"
									value="${fn:replace(mycourse_name,keyword,mark)}" />
								<c:set var="mycourse_area"
									value="${fn:replace(mycourse_area,keyword,mark)}" />
								<c:set var="mycourse_content"
									value="${fn:replace(mycourse_content,keyword,mark)}" />
							</c:if>

							<%-- 상세페이지로 이동하기위한 URL --%>
							<c:url value="/commPage/comm_myCourseDetail.do" var="infoUrl">
								<c:param name="mycourse_no" value="${item.mycourse_no}" />
							</c:url>

							<div class="col-xs-6 col-sm-4 col-md-3">
								<div class="thumbnail item"
									onclick="location.href='${infoUrl}'"
									style="cursor: pointer;">
									<img alt="나만의 코스 이미지"
										src="${pageContext.request.contextPath}/assets/img/profile_default.png">
									<div class="caption clearfix">
										<p>${item.user_info_user_no}</p>
										<h4>${item.mycourse_name }</h4>
										<p class="pull-left">${item.mycourse_area}</p>
										<p class="pull-right">${item.mycourse_content}</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- //리스트영역 끝-->
			<div style="height: 70px;">
				<form class="searchform col-md-4 col-md-offset-4 col-xs-9"
					role="search" style="padding-top: 15px;">
					<div class="form-group input-group">
						<input type="text" class="form-control" placeholder="검색">
						<span class="input-group-btn">
							<button class="btn btn-blue" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- 게시글 작성 버튼 -->
				<div class="pull-right postbtn"
					style="padding-top: 15px; padding-bottom: 15px;">
					<a
						href="${pageContext.request.contextPath}/commPage/comm_myCourseWrite.do"
						class="btn btn-info" id="postcourse">게시글 작성</a>
				</div>
			</div>

			<!-- 페이지네이션 include -->
			<%@ include file="/WEB-INF/views/inc/pagenation.jsp"%>
			<!-- //페이지네이션영역 끝-->
		</div>
	</div>
	<!-- //본문영역 끝 -->
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript">
		
	</script>
</body>
</html>