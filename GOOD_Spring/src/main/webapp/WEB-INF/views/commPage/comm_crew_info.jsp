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

<style type="text/css">
.title-img>img {
	width: 200px;
	height: 100px;
}

#crew_middle {
	padding-left: 40px;
}

.col-md-8 {
	margin-left: 40px;
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
</style>
</head>
<body>
	<div class="wrapper">

		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
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
			<h1 class="page-header">크루를 소개합니다</h1>
			<!-- 본문 상단 영역 -->
			<div class="crew_info_header col-md-12 "></div>
			<!-- //본문 상단 영역 -->
			<!-- 본문 중단 영역 -->
			<div class="crew_info_middle">
				<div class="col-md-3" id="crew_middle">
					<div class="form-group">
						<span class="title-img"><img
							src="../img/profile_default.png"> <span class='sr-only'>이미지</span>
						</span>
						<h5>가입된 회원 수 : 6명</h5>
						<h3 class="title-name">ezen 크루</h3>
						<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
						<P>매주 토요일 6~8시 걷기 진행</P>
					</div>
				</div>
				<!-- 크루 상세 정보  -->
				<div class="col-md-8">
					<h2>ezen크루 정보</h2>
					<p>
						우리 ezen크루는 과도한 업무 스트레스 및 학업, 일상에서 오는 스트레스를 줄이고자 크루를 개설하였습니다.<br />
						지친 일상에서 벗어나 깨끗한 공기와 가벼운 마음으로 걷기를 통한 체력 증진 및 소통을 통한 서로에 대한 소속감을 형성!
						<br /> 저희와 함께 스트레스를 이겨내실 분들을 기다립니다! 동해물과 백두사니 마르고 닳도록 하느님이 보우하사
						우리 나라 만세<br /> 무궁화 삼천리 화려강산 대한사람 대한으로 길이 보전하세~ <br /> ezen크루~~!
					</p>
				</div>
				<!-- 크루 상세 정보 끝 -->

			</div>
			<!--// 본문 중단 영역 -->
			<!-- 본문 하단 영역 -->
			<div class="crew_info_footer">
				<div class="col-md-12">
					<div class="text-center">
						<button type='submit' id="join" class="btn btn-primary">가입하기</button>
						<button type="submit" class="btn btn-info"
							onClick="location.href='../commPage/comm_crew.jsp'">목록</button>
					</div>
					<hr />
				</div>

				<script>
					$("#join")
							.click(
									function() {
										// 확인, 취소버튼에 따른 후속 처리 구현
										swal({
											title : '확인', // 제목
											text : "해당 크루에 가입을 하시겠습니까?", // 내용
											type : 'question', // 종류
											confirmButtonText : '네', // 확인버튼 표시 문구
											showCancelButton : true, // 취소버튼 표시 여부
											cancelButtonText : '아니오', // 취소버튼 표시 문구
										})
												.then(
														function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
															if (result.value) { // 확인 버튼이 눌러진 경우
																swal(
																		'성공',
																		'해당크루에 가입되었습니다.',
																		'success');
																setTimeout(
																		function() {
																			location.href = '../commPage/comm_crew_bbs.jsp';
																		}, 1000);

															} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
																swal(
																		'취소',
																		'가입이 취소되었습니다.',
																		'error');
															}

														});
									});
				</script>
			</div>
			<!--// 본문 하단 영역 -->
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>



</body>
</html>