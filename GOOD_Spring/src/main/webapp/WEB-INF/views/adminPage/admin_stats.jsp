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
				<h2>기간별 로그인 현황</h2>
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
					<em>일일 접속 총 인원 : ${output_count }</em>
					<c:forEach var="LoginLogItem" items="${output_Hour_Count}" >
						<em>일일 접속 시간 : ${LoginLogItem.log_hour }</em>
						<em>일일 접속 시간별 인원 : ${LoginLogItem.log_cnt }</em>
					</c:forEach>
				</h2>

				<h3>주간/월 접속 인원 그래프</h3>
				<canvas id="myChart1" width="10" height="3"></canvas>
			</div>
			<hr />

			<div class="jumbotron">
				<h2>기간별 회원가입 현황</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">일별</option>
							<option value="1">주간별</option>
							<option value="2">월별</option>
						</select> <select class="form-control">
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
				<h2>기간별 인기검색어</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">일별</option>
							<option value="1">주간별</option>
							<option value="2">월별</option>
						</select>
					</div>
				</div>
				<h3>조건별 컨텐츠 통계 분석</h3>
				<canvas id="myChart3" width="10" height="3"></canvas>
			</div>
			<hr />
			<div class="jumbotron">
				<h2>기간별 찜목록현황</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">일별</option>
							<option value="1">주간별</option>
							<option value="2">월별</option>
						</select>
					</div>
				</div>
				<h3>조건별 컨텐츠 통계 분석</h3>
				<canvas id="myChart4" width="10" height="3"></canvas>
			</div>
			<hr />
			<div class="jumbotron">
				<h2>기간별 걷기기록이용내역과 나만의코스생성률</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">일별</option>
							<option value="1">주간별</option>
							<option value="2">월별</option>
						</select>
					</div>
				</div>
				<h3>조건별 컨텐츠 통계 분석</h3>
				<canvas id="myChart5" width="10" height="3"></canvas>
			</div>
			<hr />
			<div class="jumbotron">
				<h2>기간별 크루생성현황과 생성된 크루의 종류</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="">일별</option>
							<option value="1">주간별</option>
							<option value="2">월별</option>
						</select>
					</div>
				</div>
				<h3>조건별 컨텐츠 통계 분석</h3>
				<canvas id="myChart6" width="10" height="3"></canvas>
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
	<script>
		var loginHour = [];
		var loginCnt = [];
		
		<c:forEach var="LoginLogItem" items="${output_Hour_Count}" >
			loginHour.push(${LoginLogItem.log_hour});
			loginCnt.push(${LoginLogItem.log_cnt});
		</c:forEach>
		
		const ctx1 = document.getElementById('myChart1').getContext('2d');
		const myChart1 = new Chart(ctx1, {
			type : 'bar',
			data : {
				labels : loginHour,
				datasets : [ {
					axis : 'x',
					label : '시간',
					data : loginCnt,
					backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
							'rgba(54, 162, 235, 0.2)' ],
					borderColor : [ 'rgba(255, 99, 132, 1)',
							'rgba(54, 162, 235, 1)' ],
					borderWidth : 1
				} ]
			},
			options : {
				indexAxis : 'x',
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
		const ctx4 = document.getElementById('myChart4').getContext('2d');
		const myChart4 = new Chart(ctx4,
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
		const ctx5 = document.getElementById('myChart5').getContext('2d');
		const myChart5 = new Chart(ctx5,
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
		const ctx6 = document.getElementById('myChart6').getContext('2d');
		const myChart6 = new Chart(ctx6,
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
</body>
</html>