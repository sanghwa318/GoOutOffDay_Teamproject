<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style>
div.media-body a {
	color: #000000;
	text-decoration: none;
}

div#category_acco .accordian-toggle {
	color: #000;
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
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../walkPage/walk_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">걷기<img src="../icon_img/걷기 아이콘.png;"
						style="width: 3rem; height: 3rem; position:relative; bottom: 3px; left: 5px;"></img>
					</span>
				</h1>
			</div>
			<!-- 코스검색 영역 -->
			<div>
				<div class="page_header">
					<h1>코스 목록</h1>
				</div>
				<!-- 코스 검색 창 -->
				<div class="panel-group" id="category_acco">
					<div>
						<h3>
							<a class="accordian-toggle" data-toggle="collapse"
								data-parent="#category_acco" href="#category_list"> 카테고리별 검색<i
								class="glyphicon glyphicon-chevron-down"
								style="color: #bcbcbc; font-size: 17px; left: 6px;"></i>
							</a>
						</h3>
						<div id="category_list" class="panel-collapse collapse">
							<div class="panel-body">
								<!-- 검색 하기 창 -->
								<div class="form-group input-group">
									<input type="text" id="course_search" class="form-control"
										placeholder="검색하기" /> <span class="input-group-btn">
										<button class="btn btn-blue" type="submit">
											<span style="color: #0069a6;">검색 </span><i
												class="glyphicon glyphicon-search" style="color: #0069a6;"></i>
										</button>
									</span>
								</div>
								<!-- //검색 하기 창 -->
								<!-- 카테고리영역 -->
								<form class="form-horizontal" role="form">
									<fieldset>
										<div class="form-group">
											<div class="col-xs-3">
												<select class="form-control">
													<option value="">유형별</option>
													<option value="1">한양도성길</option>
													<option value="2">근교산자락길</option>
													<option value="3">생태문화길</option>
													<option value="4">한양/지천길</option>
													<option value="5">서울둘레길</option>
												</select>
											</div>
											<div class="col-xs-3">
												<select class="form-control">
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
											<div class="col-sm-2 col-xs-3 pull-right">
												<select class="form-control">
													<option value="">거리별</option>
													<option value="time">시간별</option>
													<option value="level">난이도별</option>
												</select>
											</div>
										</div>
									</fieldset>
								</form>
								<!-- //카테고리영역 -->
							</div>
						</div>
					</div>
				</div>
				<!-- 본문상단 끝 -->
			</div>
			<!-- //코스검색 영역 -->
			<!-- 코스검색 목록 영역 -->
			<div>
				<!-- 코스 검색 리스트 -->
				<div>
					<hr />
					<!-- 미디어 아이템 영역 -->
					<div class="media">
						<!-- 이미지 왼쪽 배치 -->
						<a class="pull-left" href="#"><img class="media-object"
							src="../img/profile_default.png" height="170" width="170"
							alt="도심의 야경"></a>
						<!-- 미디어 내용 영역 -->
						<div class="media-body" style="padding-left: 20px;">
							<!-- 내용의 제목 -->
							<h2 class="media-heading">
								<a
									href="<%=request.getContextPath()%>/walkPage/walk_detailCourse.jsp">코스이름</a>
							</h2>
							<div style="padding: 5px 20px;">
								<h4 class="media-heading">
									<a href="#">지역 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">유형 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">거리 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">시간 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">난이도 : </a>
								</h4>
							</div>
						</div>
					</div>
					<hr />
					<!-- //미디어 아이템 영역-->
					<!-- 미디어 아이템 영역 -->
					<div class="media">
						<!-- 이미지 왼쪽 배치 -->
						<a class="pull-left" href="#"><img class="media-object"
							src="../img/profile_default.png" height="170" width="170"
							alt="도심의 야경"></a>
						<!-- 미디어 내용 영역 -->
						<div class="media-body" style="padding-left: 20px;">
							<!-- 내용의 제목 -->
							<h2 class="media-heading">
								<a
									href="<%=request.getContextPath()%>/walkPage/walk_detailCourse.jsp">코스이름</a>
							</h2>
							<div style="padding: 5px 20px;">
								<h4 class="media-heading">
									<a href="#">지역 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">유형 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">거리 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">시간 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">난이도 : </a>
								</h4>
							</div>
						</div>
					</div>
					<hr />
					<!-- //미디어 아이템 영역-->
					<!-- 미디어 아이템 영역 -->
					<div class="media">
						<!-- 이미지 왼쪽 배치 -->
						<a class="pull-left" href="#"><img class="media-object"
							src="../img/profile_default.png" height="170" width="170"
							alt="도심의 야경"></a>
						<!-- 미디어 내용 영역 -->
						<div class="media-body" style="padding-left: 20px;">
							<!-- 내용의 제목 -->
							<h2 class="media-heading">
								<a
									href="<%=request.getContextPath()%>/walkPage/walk_detailCourse.jsp">코스이름</a>
							</h2>
							<div style="padding: 5px 20px;">
								<h4 class="media-heading">
									<a href="#">지역 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">유형 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">거리 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">시간 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">난이도 : </a>
								</h4>
							</div>
						</div>
					</div>
					<hr />
					<!-- //미디어 아이템 영역-->



				</div>
				<!-- //코스 검색 리스트 -->
				<!-- 페이지네이션 -->
				<div class="text-center">
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
				<!-- //페이지네이션 -->
			</div>
			<!-- //코스검색 목록 영역 -->
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
</body>
</html>