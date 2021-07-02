<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link rel="stylesheet" href="../plugins/sweetalert/sweetalert2.min.css" />

<style>
 #tag_input{
 font-size:15px;
 }

/* 인풋요소 ui*/
.id_pw_search {
	border: none;
	border-bottom: 2px solid #ced4da;
	border-radius: 0px;
	background-color: transparent;
	padding-left: 5px;
	box-shadow: none;
	/* required fields */
	/* active state */
	/* invalid state */
}

.id_pw_search:focus {
	border-bottom-color: #007bff;
	color: #000;
	box-shadow: none;
}

.id_pw_search:focus.invalid {
	border-bottom-color: #dc3545;
}

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


</style>

</head>

<body>
	<div class="wrapper">
		<%@ include file="../inc/Header.jsp"%>

		<div class="container">
			<form class="form-horizontal" role="form">
				<fieldset>
               <h1 class="page-header">PW 찾기</h1>
                <div class="col-xs-12 text-center" id="logo">
					<img src="../icon_img/logo.png" height="66px" width="330px">
				</div>

					<div class="form-group" style="margin-top: 200px;" id="tag_input">
						<label for="name_search"
							class="col-md-3 col-md-offset-1  control-label">이름 : </label>
						<div class=" col-md-4 ">
							<input type="text" id="name_search"
								class="form-control id_pw_search" placeholder="이름을 입력하세요." />
						</div>
					</div>
					<div class="form-group " style="margin-top: 30px;" id="tag_input">
						<label for="id_search"
							class="col-md-3 col-md-offset-1  control-label">아이디 : </label>
						<div class="col-md-4 ">
							<input type="text" id="id_search"
								class="form-control id_pw_search" placeholder="아이디를 입력하세요." />
						</div>
					</div>
					<div class="form-group "  style="margin-top: 30px;" id="tag_input">
						<label for="hp_search"
							class="col-md-3 col-md-offset-1 control-label">휴대폰 번호 : </label>
						<div class="col-md-4 ">
							<input type="text" id="hp_search"
								class="form-control id_pw_search" placeholder="휴대폰 번호를 입력하세요." />
						</div>
					</div>
					<div class="form-group">
						<div class="text-center ">
							<button type="button"
								class="btn btn-primary  search_pw" id="search_pw"
								style="width: 80px; height:40px; font-size:18px;">찾기</button>
						</div>
					</div>
					 <hr>
					<div class="text-center" id="tag_btn">
						<a href="login_findID.jsp">아이디 찾기</a> <span class="vertical-bar"></span>
						<a href="login_findPW.jsp">비밀번호 찾기</a><span class="vertical-bar"></span>
						<a href="join.jsp">회원가입</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<%@ include file="../inc/Footer.jsp"%>

	<%@ include file="../inc/plugin.jsp"%>

	<script>
$(function() {
	$('#search_pw').click(function(e) {

		var name_search_val = $("#name_search").val();

		if (!name_search_val) { // 입력되지 않았다면?
			swal({
				title : "에러",
				text : "이름을 입력해주세요.",
				type : "error"
			}).then(function(result) {
				// 창이 닫히는 애니메이션의 시간이 있으므로,
				// 0.1초의 딜레이 적용 후 포커스 이동
				setTimeout(function() {

				}, 100);
			}); // <-- 메시지 표시
			$("#name_search").focus(); // <-- 커서를 강제로 넣기
			return false; // <-- 실행 중단
		}
		
		var id_search_val = $("#id_search").val();

		if (!id_search_val) { // 입력되지 않았다면?
			swal({
				title : "에러",
				text : "아이디를 입력해주세요",
				type : "error"
			}).then(function(result) {
				// 창이 닫히는 애니메이션의 시간이 있으므로,
				// 0.1초의 딜레이 적용 후 포커스 이동
				setTimeout(function() {

				}, 100);
			}); // <-- 메시지 표시
			$("#id_search").focus(); // <-- 커서를 강제로 넣기
			return false; // <-- 실행 중단
		} 	
		var hp_search_val = $("#hp_search").val();

		if (!hp_search_val) { // 입력되지 않았다면?
			swal({
				title : "에러",
				text : "휴대폰 번호를 입력해주세요",
				type : "error"
			}).then(function(result) {
				// 창이 닫히는 애니메이션의 시간이 있으므로,
				// 0.1초의 딜레이 적용 후 포커스 이동
				setTimeout(function() {

				}, 100);
			}); // <-- 메시지 표시
			$("#hp_search").focus(); // <-- 커서를 강제로 넣기
			return false; // <-- 실행 중단
		} else {
			swal({
	              title: '확인',                // 제목
	              text: "임시 비밀번호를 문자로 보내드렸습니다..",  // 내용
	              type: 'success',              // 종류
	          }).then(function(result) {
					// 창이 닫히는 애니메이션의 시간이 있으므로,
					// 0.1초의 딜레이 적용 후 포커스 이동
					setTimeout(function() {
						location.href="<%=request.getContextPath()%>
		/mainPage/login.jsp";
																}, 1000);
													})
								}

							});

		});
	</script>

</body>
</html>