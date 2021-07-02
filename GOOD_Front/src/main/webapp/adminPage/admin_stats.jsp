<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
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
					onclick="location.href='../adminPage/admin_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<div class="page-header">
				<h1>통계</h1>
			</div>
			<div class="jumbotron clearfix">
				<h2>기간별 접속 인원</h2>
				<div class="parent">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">일별</option>
							<option value="1">주간별</option>
							<option value="2">월별</option>
						</select>
					</div>
				</div>
				<h2 class="text-primary">
					<em>일일 접속 인원 : 300명</em>
				</h2>
				<h3>주간/월 접속 인원 그래프</h3>
				<canvas id="myChart1" width="10" height="3"></canvas>
			</div>
			<hr />

			<div class="jumbotron">
				<h2>조건별 가입 현황</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">연령</option>
							<option value="1">성별</option>
							<option value="2">혼인여부</option>
						</select>
					</div>
				</div>
				<h3>조건별 가입 현황 그래프</h3>
				<canvas id="myChart2" width="10" height="3"></canvas>
			</div>
			<hr />
			<div class="jumbotron">
				<h2>회원 찜 목록</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">문화체육</option>
							<option value="1">겯기</option>
						</select>
					</div>
				</div>
				<h3>조건별 컨텐츠 통계 분석</h3>
				<canvas id="myChart3" width="10" height="3"></canvas>
			</div>
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
<script>
	const ctx1 = document.getElementById('myChart1').getContext('2d');
	const myChart1 = new Chart(ctx1,
			{
				type : 'bar',
				data : {
					labels : [ '거리', '시간', '평균 페이스' ],
					datasets : [ {
						axis : 'y',
						label : '# 내 기록',
						data : [ 12, 19, 13 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)', ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)', ],
						borderWidth : 1
					} ]
				},
				options : {
					indexAxis : 'y',
				}
			});

	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const myChart2 = new Chart(ctx2,
			{
				type : 'bar',
				data : {
					labels : [ '거리', '시간', '평균 페이스' ],
					datasets : [ {
						axis : 'y',
						label : '# 내 기록',
						data : [ 12, 19, 13 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)', ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)', ],
						borderWidth : 1
					} ]
				},
				options : {
					indexAxis : 'y',
				}
			});

	const ctx3 = document.getElementById('myChart3').getContext('2d');
	const myChart3 = new Chart(ctx3,
			{
				type : 'bar',
				data : {
					labels : [ '거리', '시간', '평균 페이스' ],
					datasets : [ {
						axis : 'y',
						label : '# 내 기록',
						data : [ 12, 19, 13 ],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)', ],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)', ],
						borderWidth : 1
					} ]
				},
				options : {
					indexAxis : 'y',
				}
			});
</script>
</html>