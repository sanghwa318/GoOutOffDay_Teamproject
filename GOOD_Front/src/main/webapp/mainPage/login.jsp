<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link rel="stylesheet"
	href="../plugins/bootstrap-4-floating-labels-material-inputs/input-material.css">
<style type="text/css">
.vertical-bar {
	content: "";
	display: inline-block;
	width: 1px;
	height: 11px;
	background-color: #e4e8eb;
	vertical-align: -1px;
	margin: 0 8px;
}

#logo {
	padding-top: 50px;
}

body>div.container {
	min-height: 700px;
}

#login-form {
	min-height: 300px;
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

			<h1 class="page-header">로그인</h1>
			<div class="row" style="height: 166px;">
				<div class="col-xs-12 text-center" id="logo">
					<img src="../icon_img/logo.png" height="66px" width="330px">
				</div>
			</div>
			<form id="login-form" method="post" action="login_ok.jsp">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-group input-material">
						<input type="text" class="form-control" name="user_id"
							id="user_id" required> <label for="user_id">아이디</label>
					</div>
					<div class="col-sm-6 col-sm-offset-3 form-group input-material">
						<input type="password" class="form-control" name="user_pw"
							id="user_pw" required> <label for="user_pw">비밀번호</label>
					</div>
				</div>
				<div class="text-center">
					<button type="submit" class="btn btn-info">로그인</button>
				</div>

			</form>
			<hr>
			<div class="text-center">
				<a href="login_findID.jsp">아이디 찾기</a> <span class="vertical-bar"></span>
				<a href="login_findPW.jsp">비밀번호 찾기</a><span class="vertical-bar"></span>
				<a href="join.jsp">회원가입</a>
			</div>

		</div>
	</div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>

	<script
		src="../plugins/bootstrap-4-floating-labels-material-inputs/materialize-inputs.jquery.js"></script>
	<script src="../plugins/ajax-form/jquery.form.min.js"></script>

	<script type="text/javascript">
		$('document').ready(function() {
			// 입력요소 안에 글자가 있으면, label이 위에 떠있게 함.
			$('body').materializeInputs();
		});
	</script>
</body>
</html>