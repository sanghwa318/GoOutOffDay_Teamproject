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
	width: auto;
	margin: auto;
	padding: 30px 10px;
}

.col-md-2 {
	display: inline-block;
	margin-left: 10px;
	folat: left;
}

.col-md-4 {
	margin-left: 20px;
}

.title-img>img {
	width: 100px;
	height: 100px;
}

.thumbnail {
	padding: 0;
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

		<!-- 상단 영역 -->
		<%@ include file="../inc/Header.jsp"%>
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
			<h1 class="page-header">
				크루<img src="../icon_img/크루 아이콘.png" alt="크루 아이콘">
			</h1>

			<!-- 크루 본문영역 상단 -->

			<form class="form-horizontal" name="crew_header" id="crew_header"
				role="form">
				<div class="form-group">
					<div class="col-md-3 pull-right">
						<button type='reset' class="btn btn-primary" id="btn"
							onClick="location.href='../commPage/comm_crew_est.jsp'">크루개설</button>
						<button type="reset" class="btn btn-primary" id="btn"
							onClick="location.href='../commPage/comm_crew_myCrew.jsp'">마이크루</button>
					</div>
					<div class="col-md-4" role="search">
						<div class="form-group input-group">
							<span class="input-group-btn">
								<button class="btn btn-blue" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span><input type="text" class="form-control" placeholder="크루, 게시글 검색">
						</div>
					</div>
					<div class="col-md-2 pull-right">
						<select class="form-control" id="crew_region" name="crew_region">
							<option value="">지역</option>
							<option value="all">전체</option>
							<option value="gangnam">강남구</option>
							<option value="gangdong">강동구</option>
							<option value="gangbug">강북구</option>
							<option value="gangseo">강서구</option>
							<option value="gwan-ag">관악구</option>
							<option value="gwangjin">광진구</option>
							<option value="gulo">구로구</option>
							<option value="geumcheon">금천구</option>
							<option value="nowon">노원구</option>
							<option value="dobong">도봉구</option>
							<option value="dongdaemun">동대문구</option>
							<option value="dongjag">동작구</option>
							<option value="mapo">마포구</option>
							<option value="seodaemun">서대문구</option>
							<option value="seocho">서초구</option>
							<option value="seongdong">성동구</option>
							<option value="seongbug">성북구</option>
							<option value="songpa">송파구</option>
							<option value="yangcheon">양천구</option>
							<option value="yeongdeungpo">영등포구</option>
							<option value="yongsan">용산구</option>
							<option value="eunpyeong">은평구</option>
							<option value="jonglo">종로구</option>
							<option value="jung-gu">중구</option>
							<option value="junglang">중랑구</option>
						</select>
					</div>
					<div class="col-md-2  pull-right">
						<select class="form-control" id="crew_condition"
							name="crew_condition">
							<option value="">조건</option>
							<option value="fast">최신순</option>
							<option value="low">오래된순</option>
							<option value="popular">인기순</option>
						</select>
					</div>
				</div>
			</form>
			<!-- 본문상단 끝 -->

			<!-- 크루 본문영역 중단 -->
			<div class="row cas_item">
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
				<div class="col-xs-6 col-sm-4 col-md-3">
					<div class="thumbnail item"
						onclick="location.href='../commPage/comm_crew_info.jsp'"
						style="cursor: pointer;">
						<img alt="테스트이미지 1번" src="../img/profile_default.png">
						<div class="caption clearfix">
							<p>ezen 크루</p>
							<h4>오후 8시 ~ 10시 함께 산책 하실 분~ ^^</h4>
							<p class="pull-left">지역: 강남구</p>
							<p class="pull-right">크루장 : 이젠</p>
						</div>

					</div>
				</div>
			</div>
		</div>

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
		<!-- 본문하단 끝 -->
	</div>
	</div>
	<!-- 하단 영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>

</body>
</html>