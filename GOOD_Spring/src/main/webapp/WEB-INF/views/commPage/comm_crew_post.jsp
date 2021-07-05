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

.coursewriter {
	margin-left: 15px;
}

.heart i, .comment i {
	margin-top: 8px;
	margin-left: 8px;
}

.fa-heart-o {
	color: red;
	cursor: pointer;
}

.fa-heart {
	color: red;
	cursor: pointer;
}

.sidebar {
	float: left;
	width: 150px;
}

.title-img>img {
	width: 150px;
}

.crew_container {
	position: relative;
}

.row_a {
	margin-left: 25%;
}

form {
	margin-left: 25%;
}
</style>
</head>
<body>
	<div class="wrapper">
	<!-- 공용 헤더 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->



		<div class="container crew_container">
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
			<h1 class="page-header">크루게시판</h1>

			<!-- 본문 사이드 영역 -->
			<div class="sidebar">
				<div class="form-group">
					<span class="title-img"><img
						src="../img/profile_default.png"> <span class='sr-only'>이미지</span>
					</span>
					<h4>가입된 회원 수 : 6명</h4>
					<h3 class="title-name">ezen 크루</h3>
					<p>서울 서초구(걷기 모임), 20~30대 환영합니다.^^</p>
					<P>매주 토요일 6~8시 걷기 진행</P>
				</div>
			</div>
			<!-- //사이드 영역 -->



			<div class="row row_a">
				<div class="pull-left writer_profile">
					<a href="#"><img style="border-radius: 25px"
						onerror="this.src='../img/profile_default.png'"
						src="${sessionScope.principal.userProfile}" width="50px"
						height="50px"></img></a>
				</div>
				<div class="pull-left writer_info" style="margin-left: 15px;">
					<h4>작성자</h4>
					<p class="pull-left">2021 5월 6일 오후 12:14</p>
					<p class="pull-left" style="margin-left: 15px;">조회수 : 185</p>

				</div>
			</div>

			<div class="row row_a">

				<div class="col-md-11" style="margin-top: -230px;">댓글내용
					ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*qweqwewqeqwwqeweweqasdasasddsdasadsdasd
					sassdasddsdsdasdsa()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()
					ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()
					ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()
				</div>
			</div>

			<div class="row row_a">
				<div class="col-md-2 col-lg-1 col-xs-2 text-center"
					style="font-size: 20px"></div>
				<div class="pull-right" style="margin-right: 15px">
					<span class="heart"><i class="fa fa-heart-o"
						aria-hidden="true" role="button"></i> </span> 좋아요 4 <span class="comment"><i
						class="fa fa-comment-o"></i></span> 댓글 28
				</div>
			</div>




			<hr />


			<div class="row row_a">
				<div class="pull-left writer_profile">
					<a href="#"><img style="border-radius: 25px"
						onerror="this.src='../img/profile_default.png'"
						src="${sessionScope.principal.userProfile}" width="50px"
						height="50px"></img></a>
				</div>
				<div class="pull-left writer_info" style="margin-left: 15px;">
					<h4>작성자</h4>
					<p>2021 5월 6일 오후 12:14</p>

				</div>
				<button type="button" class="btn btn-default pull-right"
					id="d_delete" style="margin-right: 15px">댓글 삭제</button>
			</div>
			<div class="row row_a">

				<div class="col-md-offset-1 col-md-11" style="margin-left: 10px;">
					댓글내용
					ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*qweqwewqeqwwqeweweqasdasasddsdasadsdasd
					sassdasddsdsdasdsa()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()
					ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()
					ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^*()
				</div>
			</div>

			<hr>

			<form>
				<div class="form-group input-group">
					<textarea class="form-control" style="height: 60px; resize: none;"
						placeholder="내용을 입력해주세요."></textarea>
					<span class="input-group-btn"><button type="button"
							class="btn btn-default" style="height: 60px;">댓글 등록</button></span>
				</div>
			</form>
			<hr>
			<a class="btn btn-default pull-left"
				href="<%=request.getContextPath()%>/commPage/comm_crew_bbs.jsp">목록</a>
			<div class="btn-group pull-right">
				<button type="button" class="btn btn-warning wr_delete"
					id="wr_delete">삭제</button>
				<button type="button" class="btn btn-primary wr_edit" id="wr_edit">수정</button>
			</div>

		</div>

	</div>
	<!-- //컨테이너 -->
	<!-- 공용 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script>
		$(".heart")
				.on(
						"click",
						function() {
							if ($(this).hasClass("liked")) {
								$(this)
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true"></i>');
								$(this).removeClass("liked");
							} else {
								$(this)
										.html(
												'<i class="fa fa-heart" aria-hidden="true"></i>');
								$(this).addClass("liked");
							}
						});
	</script>
	<!-- //js -->

	<!--버튼  -->
	<script>
		$(function() {
			$('#wr_edit')
					.click(
							function(e) {

								swal({
									title : '확인', // 제목
									text : "게시글을 수정하시겠습니까?", // 내용
									type : 'warning', // 종류
									confirmButtonText : '네', // 확인버튼 표시 문구
									showCancelButton : true, // 취소버튼 표시 여부
									cancelButtonText : '아니오', // 취소버튼 표시 문구
								})
										.then(
												function(result) {
													// 창이 닫히는 애니메이션의 시간이 있으므로,
													// 0.1초의 딜레이 적용 후 포커스 이동
													if (result.value) { // 확인 버튼이 눌러진 경우
														setTimeout(
																function() {
																	location.href = '../commPage/comm_crew_postEdit.jsp';
																}, 1000);

													}
												}); // <-- 메시지 표시

							});

			$('#wr_delete').click(function(e) {

				swal({
					title : '확인', // 제목
					text : "정말 게시글을 삭제하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(function(result) {
					// 창이 닫히는 애니메이션의 시간이 있으므로,
					// 0.1초의 딜레이 적용 후 포커스 이동
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제', '게시글이 삭제되었습니다..', 'success');
						setTimeout(function() {
							location.href = '../commPage/comm_crew_bbs.jsp';
						}, 1000);

					}
				});
			});

			$('#d_delete').click(function(e) {

				swal({
					title : '확인', // 제목
					text : "정말 게시글을 삭제하시겠습니까?", // 내용
					type : 'warning', // 종류
					confirmButtonText : '네', // 확인버튼 표시 문구
					showCancelButton : true, // 취소버튼 표시 여부
					cancelButtonText : '아니오', // 취소버튼 표시 문구
				}).then(function(result) {
					// 창이 닫히는 애니메이션의 시간이 있으므로,
					// 0.1초의 딜레이 적용 후 포커스 이동
					if (result.value) { // 확인 버튼이 눌러진 경우
						swal('삭제', '댓글이 삭제되었습니다.', 'success');
						setTimeout(function() {
							location.href = '../commPage/comm_crew_post.jsp';
						}, 1000);

					}
				});
			});

		});
	</script>

</body>
</html>