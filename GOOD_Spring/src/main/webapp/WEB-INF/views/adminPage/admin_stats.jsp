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
h3 {
	text-align: center;
}

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.canvas {
	width: 100%;
	height: 300px;
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
			<div class="page-header">
				<h1>통계</h1>
			</div>
			<div id="stats_login">
				<div class="jumbotron clearfix">
					<h2>기간별 로그인 현황</h2>
					<div class="parent">
						<div class="form-group pull-right">
							<select class="form-control" id="login-interval">
								<option value="day">당일</option>
								<option value="week">한주</option>
								<option value="month">한달</option>
							</select>
						</div>
					</div>
					<div id="canvas-container1">
						<h2 class="text-primary">
							<em id="loginCnt"></em>
						</h2>
						<h3>접속인원</h3>
						<div class="canvas">
							<canvas id="loginChart" width="10" height="3"></canvas>
						</div>
					</div>
				</div>
			</div>
			<hr />

			<div id="stats_join">
				<div class="jumbotron clearfix">
					<h2>기간별 회원가입 현황</h2>
					<div class="parent">
						<div class="form-group pull-right">
							<select class="form-control" id="join-interval">
								<option value="day">당일</option>
								<option value="week">한주</option>
								<option value="month">한달</option>
							</select>
						</div>
					</div>
					<div id="canvas-container2">
						<h2 class="text-primary">
							<em id="joinCnt"></em>
						</h2>
						<h3>가입인원</h3>
						<div class="canvas">
							<canvas id="joinChart" width="10" height="3"></canvas>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div id="stats_keyword">
				<div class="jumbotron clearfix">
					<h2>기간별 인기검색어</h2>
					<div class="parent">
						<div class="form-group pull-right">
							<select class="form-control" id="keyword-interval">
								<option value="day">당일</option>
								<option value="week">주간</option>
								<option value="month">한달</option>
							</select>
						</div>
					</div>
					<div id="canvas-container3">
						<h2 class="text-primary">
							<em id="TOP_Keyword"></em> <br /> <em id="keywordCnt"></em>
						</h2>
						<h3>인기검색어</h3>
						<div class="canvas">
							<canvas id="keywordChart" width="10" height="3"></canvas>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div id="stats_BMEL">
				<div class="jumbotron clearfix">
					<h2>기간별 찜추가현황과 외부링크전환률</h2>
					<div class="parent">
						<div class="form-group pull-right">
							<select class="form-control" id="bmel-interval">
								<option value="day">당일</option>
								<option value="week">주간</option>
								<option value="month">한달</option>
							</select>
						</div>
					</div>
					<div id="canvas-container4">
						<h2 class="text-primary">
							<em id="bmCnt"></em> <br /> <em id="elCnt"></em>
						</h2>
						<div style="width: 49%; display: inline-block;">
							<h3>찜 추가 현황</h3>
							<div class="canvas" id="bmChart_canvas">
								<canvas id="bmChart" width="10" height="3"></canvas>
							</div>
						</div>
						<div style="width: 49%; display: inline-block;">
							<h3>외부링크 전환률</h3>
							<div class="canvas" id="elChart_canvas">
								<canvas id="elChart" width="10" height="3"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div id="stats_WRMM">
				<div class="jumbotron clearfix">
					<h2>기간별 걷기기록 이용현황과 나만의 코스 생성 전환율</h2>
					<div class="parent">
						<div class="form-group pull-right">
							<select class="form-control" id="wrmm-interval">
								<option value="day">당일</option>
								<option value="week">주간</option>
								<option value="month">한달</option>
							</select>
						</div>
					</div>
					<div id="canvas-container5">
						<h2 class="text-primary">
							<em id="wrCnt"></em> <br /> <em id="mmCnt"></em>
						</h2>
						<div style="width: 49%; display: inline-block;">
							<h3>걷기기록 이용현황</h3>
							<div class="canvas" id="wrChart_canvas">
								<canvas id="wrChart" width="10" height="3"></canvas>
							</div>
						</div>
						<div style="width: 49%; display: inline-block;">
							<h3>나만의 코스 생성 전환율</h3>
							<div class="canvas" id="mmChart_canvas">
								<canvas id="mmChart" width="10" height="3"></canvas>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div id="stats_crew">
				<div class="jumbotron clearfix">
					<h2>기간별 크루생성현황과 생성된 크루의 종류</h2>
					<div class="parent">
						<div class="form-group pull-right"  id="crew-interval">
							<select class="form-control">
								<option value="day">당일</option>
								<option value="week">주간</option>
								<option value="month">한달</option>
							</select>
						</div>
					</div>
					<div id="canvas-container6">
						<h2 class="text-primary">
							<em id="crewCnt">Create Total : ${output_count_MakeCrew }</em> <br />
						</h2>
						<div style="width: 49%; display: inline-block;">
							<h3>크루 생성 현황</h3>
							<div class="canvas" id="crChart_canvas">
								<canvas id="crChart" width="10" height="3"></canvas>
							</div>
						</div>
						<div style="width: 49%; display: inline-block;">
							<h3>크루 종류</h3>
							<div class="canvas" id="caChart_canvas">
								<canvas id="caChart" width="10" height="3"></canvas>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/admin-stats-js.js"></script>
</body>
</html>