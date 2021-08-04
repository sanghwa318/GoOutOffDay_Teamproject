<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style>
.btn {
	margin-top: 5px;
	margin-bottom: 5px;
}

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}
</style>
</head>

<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<!-- 본문영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/adminPage/admin_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<form class="col-md-10 col-md-offset-1" action="${pageContext.request.contextPath}/adminPage/admin_inquiryanswerOk.do"
				method="post">
			<!-- 본문 상단 영역 -->
			<div class="admin_inquiryDetail-header">
				<h1 class="page-header">1:1 문의 관리</h1>
			</div>
			<!-- 본문 상단 영역 끝 -->
			<!-- 본문 중단1 영역 -->
			<div class="admin_inquiryDetail_middle1">
				<div class="form-group">
					<label for='reason' class="col-md-12"><h3>회원 문의</h3> </label>
					<div class="col-md-12">
					<div id="inq">
						<h2>${output.getQnA_title()}</h2>
						<div class="jumbotron">
							<p>${output.getQnA_text()}</p>
						</div>
					</div>
					</div>
				</div>
			</div>
			<!-- 본문 중단1 영역 끝 -->
			<!-- 본문 중단 영역 -->
			<div class="admin_inquiryDeta.conteil_middle2">
				<div class="form-group">
					<label for='reason' class="col-md-12"><h3>관리자 답변</h3> </label>
					<div class="col-md-12">
						<textarea class="form-control" id="inq_content" name="inq_content"
							style="min-height: 300px; resize: none" placeholder="내용을 입력해주세요."></textarea>
					</div>
				</div>
			</div>
			<!-- 본문 중단2 영역 끝 -->
			<!-- 본문하단영역 -->
			<div class="form-group">
				<div class="btn text-center pull-left">
					<button type='submit' id="list" class="btn btn-info"
						onClick="location.href='${pageContext.request.contextPath}/adminPage/admin_inquiry.do'">목록</button>
				</div>
				<div class="btn text-center pull-right">
					<button type='submit' id="add" class="btn btn-success">등록</button>
					<button type='submit' id="upd" class="btn btn-primary">수정</button>
					<button type='reset' id="del" class="btn btn-danger">삭제</button>
				</div>
			</div>
			<!-- 본문하단영역 끝 -->
			</form>
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<script>
		$("#add").click(function() {
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "정말 등록 하시겠습니까?", // 내용
				type : 'warning', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					swal('등록', '성공적으로 등록되었습니다.', 'success');
					setTimeout(function() {
						$("#inq_content").prop("disabled", true);

					}, 1000);
				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '등록이 취소되었습니다.', 'error');
					setTimeout(function() {
						$("#inq_content").focus();
					}, 1000);
				}

			});
		});

		$("#upd").click(function() {
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "정말 수정 하시겠습니까?", // 내용
				type : 'warning', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					swal('수정', '수정 후 등록 버튼을 눌러주세요.', 'success');
					setTimeout(function() {
						$('#inq_content').removeAttr("disabled");

					}, 1000);
				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '수정이 취소되었습니다.', 'error');
					setTimeout(function() {
						$("#inq_content").focus();
					}, 1000);
				}

			});
		});

		$("#del").click(function() {
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "정말 삭제 하시겠습니까?", // 내용
				type : 'warning', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					swal('삭제', '성공적으로 삭제되었습니다.', 'success');
					setTimeout(function() {
						$("#inq_content").val("");
						$("#inq_content").focus();
						$('#inq_content').removeAttr("disabled");
					}, 1000);
				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '삭제가 취소되었습니다.', 'error');
				}

			});
		});
	</script>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
</body>
</html>