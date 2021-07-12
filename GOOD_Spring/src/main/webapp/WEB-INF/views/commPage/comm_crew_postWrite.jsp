<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<link
	href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />

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
</style>
</head>

<body>
	<div class="wrapper">
	<!-- 공용 헤더 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">크루게시판</h1>
			<h2>게시글 작성</h2>
			<form action="comm_crew_post.jsp" method="post">
				<input type="text" id="title" placeholder="제목을 입력해주세요." />

				<div id="editable"></div>

				<div class="btn-group pull-right">
					<button type="button" class="btn btn-warning wr_cancel"
						id="wr_cancel">취소</button>
					<button type="button" class="btn btn-primary wr_ok" id="wr_ok">작성완료</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //컨테이너 -->
	<!-- 공용 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/froala-editor@latest/js/froala_editor.pkgd.min.js"></script>
	<!-- // js -->
	<script>
		new FroalaEditor('#editable');
	</script>
	<script>
		$(function() {
			$('#wr_ok').click(function(e) {

				var titleh_val = $("#title").val();

				if (!titleh_val) { // 입력되지 않았다면?
					swal({
						title : "에러",
						text : "제목을 입력해주세요.",
						type : "error"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					}); // <-- 메시지 표시
					$("#title").focus(); // <-- 커서를 강제로 넣기
					return false; // <-- 실행 중단
				}
				var editable_val = $("#editable").val();

				if (!editable_val) { // 입력되지 않았다면?
					swal({
						title : "에러",
						text : "내용을 입력해주세요.",
						type : "error"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					}); // <-- 메시지 표시
					$("#editable").focus(); // <-- 커서를 강제로 넣기
					return false; // <-- 실행 중단
				}
				 else {
					swal({
			              title: '확인',                // 제목
			              text: "게시글 작성이 완료되었습니다.",  // 내용
			              type: 'success',              // 종류
			          }).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {
								location.href="${pageContext.request.contextPath}
		/commPage/comm_crew_post.jsp";
																}, 1000);
													})
								}

							});
			$("#wr_cancel").click(function() {
				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '확인', // 제목
					text : "정말 취소를 하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제', '크루 개설이 취소되었습니다.', 'success');
						setTimeout(function() {
							location.href = '${pageContext.request.contextPath}/commPage/comm_crew.jsp';
						}, 1000);

					}

				});
			});

		});
	</script>
</body>
</html>