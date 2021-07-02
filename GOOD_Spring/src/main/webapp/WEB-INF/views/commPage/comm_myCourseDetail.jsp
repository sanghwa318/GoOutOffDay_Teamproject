<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
</head>
<style>
hr {
	margin: 10px 0;
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

.vertical-bar {
	content: "";
	display: inline-block;
	width: 1px;
	height: 11px;
	background-color: #e4e8eb;
	vertical-align: -1px;
	margin: 0 8px;
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
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<div class="header">
				<h1 style="color: #343a40;">나만의 코스</h1>
			</div>
			<div class="row">
				<div class="courseimg col-md-4">
					<img alt="코스사진" src="${pageContext.request.contextPath}/assets/img/profile_default.png" width="300">
				</div>
				<div class="courseInfo col-md-8">
					<h3>코스 이름</h3>
					<p>
						내용 <br>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하<br>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하<br>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하<br>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하<br>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하<br>가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하가나다라마바사아자차카타파하
					</p>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-2 col-lg-1 col-xs-2 text-center"
					style="font-size: 20px">댓글</div>
				<div class="pull-right" style="margin-right: 15px">
					<span class="heart"><i class="fa fa-heart-o"
						aria-hidden="true" role="button"></i> </span> 좋아요 4 <span class="comment"><i
						class="fa fa-comment-o"></i></span> 댓글 28
				</div>
			</div>
			<hr>
			<!-- 댓글 영역 -->
			<div class="row" style="margin: 15px 0px 0 15px;">
				<div class="pull-left writer_profile">
					<a href="#"><img style="border-radius: 25px"
						onerror="this.src='${pageContext.request.contextPath}/assets/img/profile_default.png'"
						src="${sessionScope.principal.userProfile}" width="50px"
						height="50px"></img></a>
				</div>
				<div class="pull-left writer_info" style="margin-left: 15px;">
					<h4>작성자</h4>
					<p>2021 5월 6일 오후 12:14</p>

				</div>
				<div class="pull-right">
					<button type="button" class="btn btn-link"
						style="padding: 0; margin-right: 0">댓글 수정</button>
					<span class="vertical-bar"></span>
					<button type="button" class="btn btn-link"
						style="padding: 0; margin-right: 0">댓글 삭제</button>
				</div>
			</div>
			<div class="row">

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
				href="${pageContext.request.contextPath}/commPage/comm_myCourse.jsp?pageNo=1">목록</a> <a
				class="btn btn-default pull-right" href="${pageContext.request.contextPath}/commPage/comm_myCourseEdit.jsp">코스
				수정</a>
			<button class="btn btn-default pull-right">코스 삭제</button>
			<br> <br> <br>
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
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
</body>
</html>