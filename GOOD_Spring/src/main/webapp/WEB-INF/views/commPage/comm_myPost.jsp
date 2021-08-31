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
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/comm_icon.png;" />
					</span>
				</h1>
			</div>
			<div class="header">
				<h1 style="color: #343a40; padding-left: 15px">내가 쓴 글</h1>
			</div>

			<!-- 리스트영역-->
			<div class=" " style="">
				<table class="table table-hover col-xs-12" style="table-layout: fixed; border: 0 0 1px 0 solid #ddd;">
					<thead>
						<tr class="active">
							<th class="text-center col-sm-1 col-xs-1">#</th>
							<th class="text-center col-sm-4 col-xs-1">제목</th>
							<th class="text-center col-sm-2 col-xs-1">카테고리</th>
							<th class="text-center col-sm-3 col-xs-1">작성일</th>
							<th class="text-center col-sm-1 col-xs-1">조회수</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<%--조회결과가 없는 경우 --%>
							<c:when test="${(list==null||fn:length(list)==0)}">
								<tr>
									<td class="text-center" colspan="5" style="font-size:20px">조회결과가 없습니다</td>
								</tr>
							</c:when>
							<%--조회결과가 있는 경우 --%>
							<c:otherwise>
								<%--조회결과에 따른 반복 처리 --%>
								<c:forEach var="list" items="${list}" varStatus="status">
									<c:if test="${list.dtype=='mycourse'}">
										<tr style="cursor: pointer;"
											onclick="location.href='${pageContext.request.contextPath}/commPage/comm_myCourseDetail.do?mycourse_no=${list.mycourse_no}'">
											<td class="text-center col-sm-1 col-xs-1">${status.index+1}</td>
											<td class="text-center col-sm-4 col-xs-1" style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;">${list.mycourse_name }</td>
											<td class="text-center col-sm-2 col-xs-1">나만의 코스</td>
											<td class="text-center col-sm-3 col-xs-1">${list.mycourse_createdate }</td>
											<td class="text-center col-sm-1 col-xs-1">${list.mycourse_hits }</td>
										</tr>
									</c:if>
									<c:if test="${list.dtype=='crewpost'}">
										<tr style="cursor: pointer;"
											onclick="location.href='${pageContext.request.contextPath}/commPage/comm_crew_post.do?post_no=${list.post_no}'">
											<td class="text-center col-sm-1 col-xs-1">${status.index+1}</td>
											<td class="text-center col-sm-4 col-xs-1" style="text-overflow:ellipsis;overflow: hidden;white-space: nowrap;">${list.post_title}</td>
											<td class="text-center col-sm-2 col-xs-1">크루</td>
											<td class="text-center col-sm-3 col-xs-1">${list.post_createdate }</td>
											<td class="text-center col-sm-1 col-xs-1">${list.post_hits}</td>
										</tr>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- //리스트영역 끝-->
		</div>
		<!-- //본문영역 끝 -->
	</div>

	
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
</body>
</html>