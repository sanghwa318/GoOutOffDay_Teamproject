<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>

</head>
<body>
<div class="wrapper">
	<!-- 상단영역 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
	<!-- 본문영역 -->
	<div class="container">
		<h1 class="page-header">회원탈퇴</h1>
		<h1>회원정보</h1>
		<p>아이디: ${login_info.getUser_id()}</p>
		<p>이름: ${login_info.getUser_name()}</p>
		<p>닉네임: ${login_info.getUser_nick()}</p>
		<p>연락처: ${login_info.getTel()}</p>
		<p>이메일: ${login_info.getEmail()}</p>
		<p>우편번호: ${login_info.getPost()}</p>
		<p>도로명주소: ${login_info.getAddress1()}</p>
		<p>상세주소: ${login_info.getAddress2()}</p>
		<button><a href="${pageContext.request.contextPath}/myPage/myPage_accountOut_delete_ok.do?user_id=${login_info.getUser_id()}">탈퇴하기</a></button>
	</div>
	
	</div>
</body>


<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>


<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
</body>
</html>