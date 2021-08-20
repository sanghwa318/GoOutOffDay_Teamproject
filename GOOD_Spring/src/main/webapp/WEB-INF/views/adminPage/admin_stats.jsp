<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views//inc/head.jsp"%>
<style>
h3, h2 {
	text-align: center;
}

.item p {
	text-align: center;
}

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.canvas {
	width: 99%;
	height: 230px;
	min-height: 99%;
	margin: 10px;
}

.chart {
	height: 250px;
	min-height: 100%
}

.item {
	padding: 20px;
}

.thumbnail {
	margin-bottom: 10px;
	margin-top: 10px;
}

em {
	text-decoration: none;
	color: #343a40;
	font-style: normal;
	font-size: 1rem;
	margin-left: 10px;
}

.text-primary {
	text-align: left;
	height: 30px;
	min-height: 100%;
	margin-top: 20px;
	margin-bottom: 20px;
}

.form-group {
	margin-right: 20px;
}

.visible-xs {
	border-bottom: 1px solid #ddd;
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

#stats_login, #stats_join {
	padding-top: 10px;
}
#caChart{
	margin-right: 10px;
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
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/adminPage/admin_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<div class="header">
				<h1>통계</h1>
			</div>
			<div id="stats_login" class="col-sm-12 col-md-6 item">
				<div class="loginstats clearfix thumbnail">
					<h2>로그인 현황</h2>
					<div id="canvas-container1">
						<div class="parent">
							<div class="form-group pull-right">
								<select class="form-control" id="login-interval">
									<option value="day">당일</option>
									<option value="week">한주</option>
									<option value="month">한달</option>
								</select>
							</div>
						</div>
						<h3 class="text-primary">
							<em id="loginCnt"></em>
						</h3>
						<div class="chart">
							<div class="canvas">
								<canvas id="loginChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="visible-xs"></div>
			<div id="stats_join" class="col-sm-12 col-md-6 item">
				<div class="joinstats clearfix thumbnail">
					<h2>회원가입 현황</h2>
					<div id="canvas-container2">
						<div class="parent">
							<div class="form-group pull-right">
								<select class="form-control" id="join-interval">
									<option value="day">당일</option>
									<option value="week">한주</option>
									<option value="month">한달</option>
								</select>
							</div>
						</div>
						<h3 class="text-primary">
							<em id="joinCnt"></em>
						</h3>
						<div class="chart">
							<div class="canvas">
								<canvas id="joinChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="visible-xs"></div>
			<div id="stats_keyword" class="col-sm-12 col-md-6 item">
				<div class="keywordstats clearfix thumbnail">
					<h2>인기검색어</h2>
					<div id="canvas-container3">
						<div class="parent">
							<div class="form-group pull-right">
								<select class="form-control" id="keyword-interval">
									<option value="day">당일</option>
									<option value="week">주간</option>
									<option value="month">한달</option>
								</select>
							</div>
						</div>
						<h3 class="text-primary">
							<em id="TOP_Keyword"></em> <br /> <em id="keywordCnt"></em>
						</h3>
						<div class="chart">
							<div class="canvas">
								<canvas id="keywordChart"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="visible-xs"></div>
			<div id="stats_BMEL" class="col-sm-12 col-md-6 item">
				<div class="bookmarkstats clearfix thumbnail">
					<h2>찜추가현황 &amp; 바로가기이용현황</h2>
					<div id="canvas-container4">
						<div class="parent">
							<div class="form-group pull-right">
								<select class="form-control" id="bmel-interval">
									<option value="day">당일</option>
									<option value="week">주간</option>
									<option value="month">한달</option>
								</select>
							</div>
						</div>
						<h3 class="text-primary">
							<em id="bmCnt"></em> <br /> <em id="elCnt"></em>
						</h3>
						<div class="chart">
							<div style="width: 49%; display: inline-block;">
								<div class="canvas" id="bmChart_canvas">
									<canvas id="bmChart"></canvas>
								</div>
							</div>
							<div style="width: 49%; display: inline-block;">
								<div class="canvas" id="elChart_canvas">
									<canvas id="elChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="visible-xs"></div>
			<div id="stats_WRMM" class="col-sm-12 col-md-6 item">
				<div class="walkstats clearfix thumbnail">
					<h2>걷기기록이용자수 &amp; 코스생성자수</h2>
					<div id="canvas-container5">
						<div class="parent">
							<div class="form-group pull-right">
								<select class="form-control" id="wrmm-interval">
									<option value="day">당일</option>
									<option value="week">주간</option>
									<option value="month">한달</option>
								</select>
							</div>
						</div>
						<h3 class="text-primary">
							<em id="wrCnt"></em> <br /> <em id="mmCnt"></em>
						</h3>
						<div class="chart">
							<div style="width: 49%; display: inline-block;">
								<div class="canvas" id="wrChart_canvas">
									<canvas id="wrChart"></canvas>
								</div>
							</div>
							<div style="width: 49%; display: inline-block;">
								<div class="canvas" id="mmChart_canvas">
									<canvas id="mmChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="visible-xs"></div>
			<div id="stats_crew" class="col-sm-12 col-md-6 item">
				<div class="crewstats clearfix thumbnail">
					<h2>크루생성현황 &amp; 종류</h2>
					<div id="canvas-container6">
						<div class="parent">
							<div class="form-group pull-right" id="crew-interval">
								<select class="form-control">
									<option value="day">당일</option>
									<option value="week">주간</option>
									<option value="month">한달</option>
								</select>
							</div>
						</div>
						<h3 class="text-primary">
							<em id="crewCnt"></em>
						</h3>
						<div class="chart clearfix">
							<div style="width: 48%; display: inline-block;" class="pull-left">
								<div class="canvas" id="crChart_canvas">
									<canvas id="crChart"></canvas>
								</div>
							</div>
							<div style="width: 48%; display: inline-block;"
								class="pull-right">
								<div class="canvas" id="caChart_canvas">
									<canvas id="caChart"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 공통 푸터 -->
	<%@ include file="/WEB-INF/views//inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="/WEB-INF/views//inc/plugin.jsp"%>
	<!-- // js -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/admin-stats-js.js"></script>
</body>
</html>