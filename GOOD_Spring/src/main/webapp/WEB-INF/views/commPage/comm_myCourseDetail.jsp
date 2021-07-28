<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.title-img>img {
	width: 100px;
	height: 100px;
}

ul, li {
	list-style: none;
}

.body .detail_info .info {
	box-shadow: 0 2px 7px rgba(102, 109, 117, 0.32);
}

.detail_info .info li {
	padding: 17px 20px 20px 10px;
	border-bottom: 1px solid #ddd;
}

.body .header {
	padding-bottom: 10px;
	padding-top: 20px;
}

.main_header h1 {
	position: relative;
	text-align: center;
}

.main_header>h1 {
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
	bottom: 5px;
}

.detail_info {
	padding-top: 10px;
}

.detail_info .detail_item {
	padding-left: 10px;
}

.detail_info .info p {
	font-size: 15px;
	display: inline;
}

.detail_info .info strong {
	font-size: 20px;
}

.detail_info .detail_img img {
	border: 1px solid #ddd;
	box-shadow: 0 2px 7px rgba(102, 109, 117, 0.32);
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	max-height: 100%;
	min-width: 100%;
	max-width: 100%;
	height: 300px;
}

.detail_info .itemHeader {
	padding-left: 5px;
	margin-bottom: 10px;
}

.detail_info .detail_item {
	padding-top: 10px;
}

.main_info .info strong {
	color: #343a40;
}

.main_info .info p {
	color: #495056;
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
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
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
				<div class="map col-md-4" id="map"
					style="height: 250px; width: 250px"></div>
				<div class="col-md-7 col-sm-6 col-xs-12 main_info" id="mycourse">
					<ul class="info">
						<li class="infoItem"><strong class="infoLabel">코스 이름
								: </strong>
							<p class="infoText" id="mycourse_name"
								data-mycoursename='${output.mycourse_name}' data-mycourseno='${output.mycourse_no}'>${output.mycourse_name}</p></li>
						<li class="infoItem"><strong class="infoLabel">코스 지역
								: </strong>
							<p class="infoText">${output.mycourse_area }</p></li>
						<li class="infoItem"><strong class="infoLabel">코스 설명
								: </strong>
							<p class="infoText">${output.mycourse_content}</p></li>
						<li class="infoItem"><strong class="infoLabel">작성일시
								: </strong>
							<p class="infoText">${output.mycourse_createdate }</p></li>
						<li class="infoItem"><strong class="infoLabel">수정일시
								: </strong>
							<p class="infoText">${output.mycourse_editdate }</p></li>
					</ul>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-2 col-lg-1 col-xs-2 text-center"
					style="font-size: 20px">???</div>
				<div class="pull-right" style="margin-right: 15px">
					조회수 ${output.mycourse_hits } 작성자 ${output.like } <span
						class="heart"><i class="fa fa-heart-o" aria-hidden="true"
						role="button"></i> </span> 좋아요 ${output.like } <span class="comment"><i
						class="fa fa-comment-o"></i></span> 댓글 28
				</div>
			</div>
			<hr>

			<!-- 댓글 영역 -->
			<div id="cmt-list">

			</div>
			<hr>
			<form>
				<div class="form-group input-group">
					<textarea class="form-control" id="comment_text"
						style="height: 60px; resize: none;" placeholder="내용을 입력해주세요."></textarea>
					<span class="input-group-btn"><button type="button"
							class="btn btn-default" style="height: 60px;" onclick="cmt_add()">댓글
							등록</button></span>
				</div>
			</form>
			<hr>
			<a class="btn btn-default pull-left"
				href="${pageContext.request.contextPath}/commPage/comm_myCourse.do?pageNo=1">목록</a>
			<c:if test="${output.user_info_user_no==login_info.user_no}">
				<a class="btn btn-default pull-right"
					href="${pageContext.request.contextPath}/commPage/comm_myCourseEdit.do?mycourse_no=${output.mycourse_no}">코스
					수정</a>
				<button class="btn btn-default pull-right" id='delete-btn'
					>코스 삭제</button>
			</c:if>
			<br> <br> <br>
		</div>

		<!-- //컨테이너 -->
	</div>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b6b1199a25d6406101fb441c0afa0e00&libraries=services,clusterer,drawing"></script>
	<!-- Handlebar 템플릿 코드 -->
	<script id="cmt-list-tmpl" type="text/x-handlebars-template">
		{{#each item}}
			<div class="row" style="margin: 15px 0px 0 15px;">
				<div class="pull-left writer_profile">
					<a href="#"><img style="border-radius: 25px"
						onerror="this.src='${pageContext.request.contextPath}/assets/img/profile_default.png'"
						src="${sessionScope.principal.userProfile}" width="50px"
						height="50px"></img></a>
				</div>
				<div class="pull-left writer_info" style="margin-left: 15px;">
					<h4>{{comment_user_nick}}</h4>
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
					{{comment_text}}
				</div>
			</div>

		{{/each}}
</script>
	<!-- Handlebar CDN 참조 -->
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/myCourseDetail-js.js"></script>
</body>
</html>