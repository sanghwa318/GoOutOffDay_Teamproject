<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.fr-wrapper {
	min-height: 400px
}

#editable {
	margin-top: 30px;
}

input#title {
	width: 500px;
	height: 34px;
}

#editable, input#title, h2 {
	margin-left: 30px;
}

input#title {
	margin-top: 30px;
}

.btn-group {
	margin: 30px 0;
}

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
		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
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
			<div class="header">
				<h1 style="color: #343a40; padding-left:32px">코스 수정</h1>
			</div>
			<form action="${pageContext.request.contextPath}/commPage/comm_myCourseDetail.do" method="post">
				<input type="text" id="title" placeholder="코스명을 입력해주세요."
					value="나만의 코스명" style="font-size:1.4rem"/>

				<div id="editable"></div>

				<div class="btn-group pull-right">
					<a id="btn_cancel" type="button" href="${pageContext.request.contextPath}/commPage/comm_myCourse.do?pageNo=1"
						class="btn btn-default">취소</a>
					<button type="submit" class="btn btn-primary">수정완료</button>
				</div>
			</form>
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>
	<!-- // js -->
	<script>
		new FroalaEditor('#editable');
		$(function() {
			$("#btn_cancel")
					.click(
							function(e) {
								e.preventDefault();
								// 확인, 취소버튼에 따른 후속 처리 구현
								swal({
									title : '확인', // 제목
									text : "정말 수정을 취소 하시겠습니까?", // 내용
									type : 'warning', // 종류
									confirmButtonText : '네', // 확인버튼 표시 문구
									showCancelButton : true, // 취소버튼 표시 여부
									cancelButtonText : '아니오', // 취소버튼 표시 문구
								})
										.then(
												function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
													if (result.value) { // 확인 버튼이 눌러진 경우
														swal(
																'취소',
																'나만의 코스 수정이 취소되었습니다.',
																'success');
														setTimeout(
																function() {
																	location.href = '/WEB-INF/VIEWS/commPage/comm_myCourse.jsp?pageNo=1';
																}, 1000);

													}

												});
							});
		});
	</script>
</body>
</html>