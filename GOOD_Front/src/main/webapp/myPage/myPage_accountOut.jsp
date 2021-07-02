<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style>

/* 폼 전체 박스 */
.form-horizontal {
	border: 1px solid #87ceed;
	width: auto;
	margin: auto;
	padding: 30px 10px;
}
/* 입력요소 단위 박스 */
.form-group {
	padding-top: 15px;
}
/* <label>에 대한 박스 처리 */
.col-md-2 {
	width: 20%;
	display: block;
	float: left;
	font-size: 1.25rem;
	padding-top: 7px;
	text-indent: 5px;
	text-align: right;
}

/* <input>태그가 배치되는 박스의 처리 */
.col-md-10 {
	width: 65%;
	display: block;
	float: left;
	
}

.col-md-10 #reason {
height: 500px;
padding-top: 20px;
}


</style>
</head>
<body>
<div class="wrapper">
	<!-- 상단영역 -->
	<%@ include file="../inc/Header.jsp"%>
	<!-- 본문영역 -->
	<div class="container">
		<h1 class="page-header">회원탈퇴</h1>
		<form class="form-horizontal" name="accountOut_form"
			id="accountOut_form" role="form">
			<div class="form-group">
					<label for='reason' class="col-md-2">사유: </label>
					<div class="col-md-10" >
						<textarea class="form-control" id="inq_content"
						name="inq_content" style=" min-height: 500px; resize:none"></textarea>
					</div>
			</div>
			<div class="form-group">
				<div class="text-center">
					<button type='reset' id="del" class="btn btn-danger">탈퇴하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
	  $("#del").click(function() {
          // 확인, 취소버튼에 따른 후속 처리 구현
          swal({
              title: '확인',                // 제목
              text: "정말 탈퇴를 하시겠습니까?",  // 내용
              type: 'warning',              // 종류
              confirmButtonText: '네',     // 확인버튼 표시 문구
              showCancelButton: true,       // 취소버튼 표시 여부
              cancelButtonText: '아니오',       // 취소버튼 표시 문구
          }).then(function(result) {        // 버튼이 눌러졌을 경우의 콜백 연결
              if (result.value) {           // 확인 버튼이 눌러진 경우
                  swal('삭제', '성공적으로 탈퇴되었습니다.', 'success');
                  setTimeout(function() {
                	  location.href='../mainPage/index.jsp';
					}, 1000);
                  
              } else if (result.dismiss === 'cancel') {   // 취소버튼이 눌러진 경우
                  swal('취소', '탈퇴가 취소되었습니다.', 'error');
              }
       
          });
      });
	</script>
	</div>
</body>


<%@ include file="../inc/Footer.jsp"%>


<%@ include file="../inc/plugin.jsp"%>
</body>
</html>