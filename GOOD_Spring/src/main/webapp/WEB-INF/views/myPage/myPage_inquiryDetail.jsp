<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">
#inq>.jumbotron {
	min-height: 500px;
	box-shadow: none;
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
			<h1 class="page-header">1:1 문의</h1>
			<div id="inq">
				<h2>${output.getQnA_title()}</h2>
				<div class="jumbotron">
					<p>${output.getQnA_text()}</p>
				</div>
			</div>
			<div id="ans">
				<h2>관리자 답변</h2>
				<div class="jumbotron">
					<p>
					<c:if test="${!output.answer_yn}">아직 답변이 없습니다. 조금만 기다려주세요. </c:if> 
					<c:if test="${output.answer_yn}">${output.getAnswer_detail()}</c:if>
					</p>
				</div>
			</div>
			<a type="button" class="pull-left btn btn-default"
				href="${pageContext.request.contextPath}/myPage/myPage_inquiry.do"
				style="width: 75px; margin-bottom: 50px;">목록으로</a>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>
</body>
</html>