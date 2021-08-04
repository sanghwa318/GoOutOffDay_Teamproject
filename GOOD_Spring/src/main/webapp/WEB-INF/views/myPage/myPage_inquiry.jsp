<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<h1 class="page-header">1:1 문의</h1>
			<div class="col-md-10 col-md-offset-1">
				<h2>문의글 목록</h2>
				<table class="table table-bordered table-hover">
					<thead>
						<tr class="active">
							<th class="text-center">#</th>
							<th class="text-center">상태</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">제목</th>
						</tr>
					</thead>


					<tbody id="list">
						<c:choose>
							<%--조회결과가 없는 경우 --%>
							<c:when test="${output==null || fn:length(output) == 0} ">
								<tr>
									<td class="text-center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%--조회결과가 있는 경우  --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<%-- 출력을 위해 준비한 문의글제목 변수  --%>
									<c:set var="QnA_no" value="${item.getQnA_no()}" />
									<%-- 상세페이지로 이동하기위한 URL --%>
									<c:url value="/myPage/myPage_inquiryDetail.do" var="infoUrl">
										<c:param name="QnA_no" value="${item.getQnA_no()}" />
									</c:url>
									<tr onclick="location.href='${infoUrl}'" style="cursor:pointer;">
										<td class="text-center">${status.count}</td>
										<td class="text-center">
											<c:if test="${item.answer_yn}">답변 완료</c:if>
											<c:if test="${!item.answer_yn}">답변 미완료</c:if>
										</td>
										<td class="text-center">${item.getQnA_category()}</td>
										<td class="text-center">${item.getQnA_title()}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>

				</table>
				<a type="button" class="btn btn-primary pull-right"
					href="${pageContext.request.contextPath}/myPage/myPage_inquiryWrite.do">작성하기</a>
			</div>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>

</body>
</html>