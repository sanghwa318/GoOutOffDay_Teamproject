<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link
	href="../plugins/drag-drop-image-uploader/dist/image-uploader.min.css"
	rel="stylesheet">

<style>
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

.title-img>img {
	width: 100px;
	height: 100px;
}

.product-item {
	padding-top: 0;
}

.out {
	padding-bottom: 30px;
}
</style>
</head>

<body>
	<div class="wrapper">

		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 본문 영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="../icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">마이크루</h1>


			<!-- 마이크루 본문영역 중단 -->
			<div class="crew_middle">
				<div class="best">

					<div class="row multi-columns-row product-list">
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="../commPage/comm_crew_bbs.jsp">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>

							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
						<div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
							<a href="#">
								<div class="title-img">
									<img src="../img/profile_default.png"> <span
										class='sr-only'>이미지</span>
								</div>
								<h3>걷기 크루</h3>
								<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
							</a> <input type='checkbox' class='del'>
							<hr />
						</div>
					</div>
				</div>
			</div>

			<!-- 본문중단 끝 -->


			<!-- 크루 본문영역 하단 -->

			<div class="text-center" id="paging">
				<ul class="pagination">
					<li class="page-item disabled"><a href="#">&laquo;</a></li>
					<li class="page-item active"><span>1<span
							class="sr-only">(current)</span></span></li>
					<li class="page-item"><a href="#">2</a></li>
					<li class="page-item"><a href="#">3</a></li>
					<li class="page-item"><a href="#">4</a></li>
					<li class="page-item"><a href="#">5</a></li>
					<li class="page-item"><a href="#">&raquo;</a></li>
				</ul>
			</div>
			<div class="out text-right">
				<button type='submit' id="out" class="btn btn-danger">탈퇴하기</button>
			</div>
			<!-- 본문하단 끝 -->
		</div>
		<script>
			$("#out").click(function() {
				const delcrew = [];
				const obj = $(".del:checked");

				if (obj.length < 1) {
					swal('알림', '선택된 크루가 없습니다.');
					return false;
				}
				// 확인, 취소버튼에 따른 후속 처리 구현
				swal({
					title : '확인', // 제목
					text : "해당 크루에서 탈퇴 하시겠습니까?", // 내용
					type : 'question', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('성공', '탈퇴되었습니다.', 'success');
						setTimeout(function() {
							location.href = '../commPage/comm_crew_myCrew.jsp';
						}, 1000);

					} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
						swal('취소', '탈퇴가 취소되었습니다.', 'error');
					}

				});
			});
		</script>
	</div>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
</body>
</html>