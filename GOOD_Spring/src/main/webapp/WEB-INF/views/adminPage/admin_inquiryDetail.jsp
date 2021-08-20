<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>

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
		<%@ include file="/WEB-INF/views//inc/Header.jsp"%>
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
			<form class="col-md-12 col-md-offset-1" id="detailform" action="${pageContext.request.contextPath}/adminPage/admin_inquiryanswerOk.do"
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
					<label for='reason' class="col-md-12"><h3>관리자 답변</h3> <input type="hidden" name="QnA_no" value="${output.getQnA_no()}" /></label>
					<div class="col-md-12">
						<textarea class="form-control" id="Answer_detail" name="Answer_detail"
							style="min-height: 300px; resize: none" placeholder="내용을 입력해주세요."><c:if test="${output.answer_detail != null}">${output.answer_detail}</c:if></textarea>
					</div>
				</div>
			</div>
			<!-- 본문 중단2 영역 끝 -->
			<!-- 본문하단영역 -->
			<div class="form-group">
				<div class="btn text-center pull-left">
					<button type='button' id="list" class="btn btn-info"
						onClick="location.href='${pageContext.request.contextPath}/adminPage/admin_inquiry.do'">목록</button>
				</div>
				<div class="btn text-center pull-right">
					<button type='submit' id="add" class="btn btn-success">등록</button>
				</div>
			</div>
			<!-- 본문하단영역 끝 -->
			</form>
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<script>
	 function getContextPath() {
	      var hostIndex = location.href.indexOf(location.host)
	            + location.host.length;
	      var contextPath = location.href.substring(hostIndex, location.href
	            .indexOf('/', hostIndex + 1));
	      return contextPath;
	   }
		$("#add").click(function() {
			event.preventDefault();
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
					
					$("#detailform").submit();					
					 
					 
				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '등록이 취소되었습니다.', 'error');
					setTimeout(function() {
						$("#inq_content").focus();
					}, 1000);
				}

			});
		});

	</script>
	<!-- 공통 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
	<!-- // js -->
</body>
</html>