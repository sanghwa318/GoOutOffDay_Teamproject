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
						<em id="TOP_Keyword">TOP Keyword : ${output_Top_keyword.search_keyword }</em> <br />
						<em id="keywordCnt">Total : ${output_Top_keyword.log_cnt} 번</em>
					</h2>
					<h3>인기검색어</h3>
						<div class="canvas">
							<canvas id="keywordChart" width="10" height="3"></canvas>
						</div>
					</div>
				</div>
			</div>
			<hr />
			<div class="jumbotron">
				<h2>기간별 찜추가현황과 외부링크전환률</h2>
				<div class="parent clearfix">
					<div class="form-group pull-right">
						<select class="form-control">
							<option value="today">당일</option>
							<option value="week">주간</option>
							<option value="month">한달</option>
						</select>
					</div>
				</div>
				<h2 class="text-primary">
					<em>BookMark Total : ${output_count_bookmark }</em> <br /> <em>ExLink
						Total : ${output_count_ExLink }</em>
				</h2>
				<div class="canvas" style="width: 49%; display: inline-block;">
					<canvas id="myChart4" width="10" height="3"></canvas>
				</div>
				<div class="canvas" style="width: 49%; display: inline-block;">
					<canvas id="myChart44" width="10" height="3"></canvas>
				</div>
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
				<div class="canvas">
					<canvas id="myChart5" width="10" height="3"></canvas>
				</div>
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
				<div class="canvas">
					<canvas id="myChart6" width="10" height="3"></canvas>
				</div>
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
		
		$(function(){
			/** 로그인 현황 **/
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_login',
				method:'get',
				data:{},
				dataType:'json',
				success:function(data){
					var loginDateHour = [];
					var loginCnt = [];
					var loginOutput=data.loginOutput
					
						for(var i=0;i<loginOutput.length; i++){
							if(data.loginOutput[i].log_hour!=null){
								loginDateHour.push(data.loginOutput[i].log_hour)
							}else{
								loginDateHour.push(data.loginOutput[i].log_date)
							}
							loginCnt.push(data.loginOutput[i].log_cnt)
						}
					
					const ctx1 = document.getElementById('loginChart').getContext('2d');
					const loginChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : loginDateHour,
							datasets : [ {
								axis : 'x',
								label : '접속인원',
								data : loginCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.2)' ],
							borderColor : [
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					
					$("#loginCnt").html("Total : "+data.loginCnt)
				}
			})
			$('#login-interval').on('change', function(){
				$('#loginChart').remove();
				$('#canvas-container1>.canvas').append('<canvas id="loginChart" width="10" height="3"><canvas>')
				var interval=$('#login-interval option:selected').val()
				$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_login',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
					var loginDateHour = [];
					var loginCnt = [];
					var loginOutput=data.loginOutput
					console.log(loginOutput)
					
						for(var i=0;i<loginOutput.length; i++){
							if(data.loginOutput[i].log_date!=null){
								loginDateHour.push(data.loginOutput[i].log_date)
							}else{
								loginDateHour.push(data.loginOutput[i].log_hour)
							}
							loginCnt.push(data.loginOutput[i].log_cnt)
						}
					const ctx1 = document.getElementById('loginChart').getContext('2d');
					const loginChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : loginDateHour,
							datasets : [ {
								axis : 'x',
								label : '접속인원',
								data : loginCnt,
								backgroundColor : [ 
									'rgba(54, 162, 235, 0.3)' ],
							borderColor : [
									'rgba(54, 162, 235, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					$("#loginCnt").html("Total : "+data.loginCnt)
				}
			})
			})
			/**로그인 현황 끝 **/
		
			/** 회원가입 현황 **/		
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_join',
				method:'get',
				data:{},
				dataType:'json',
				success:function(data){
					var joinDateHour = [];
					var joinCnt = [];
					var joinOutput=data.joinOutput
					
						for(var i=0;i<joinOutput.length; i++){
							if(data.joinOutput[i].log_hour!=null){
								joinDateHour.push(data.joinOutput[i].log_hour)
							}else{
								joinDateHour.push(data.joinOutput[i].log_date)
							}
							joinCnt.push(data.joinOutput[i].log_cnt)
						}
					
					const ctx1 = document.getElementById('joinChart').getContext('2d');
					const joinChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : joinDateHour,
							datasets : [ {
								axis : 'x',
								label : '접속인원',
								data : joinCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.3)' ],
									borderColor : [
										'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					
					$("#joinCnt").html("Total : "+data.joinCnt)
				}
			})
			$('#join-interval').on('change', function(){
				$('#joinChart').remove();
				$('#canvas-container2>.canvas').append('<canvas id="joinChart" width="10" height="3"><canvas>')
				var interval=$('#join-interval option:selected').val()
				$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_join',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
					var joinDateHour = [];
					var joinCnt = [];
					var joinOutput=data.joinOutput
					console.log(joinOutput)
					
						for(var i=0;i<joinOutput.length; i++){
							if(data.joinOutput[i].log_date!=null){
								joinDateHour.push(data.joinOutput[i].log_date)
							}else{
								joinDateHour.push(data.joinOutput[i].log_hour)
							}
							joinCnt.push(data.joinOutput[i].log_cnt)
						}
					const ctx1 = document.getElementById('joinChart').getContext('2d');
					const joinChart = new Chart(ctx1, {
						type : 'line',
						data : {
							labels : joinDateHour,
							datasets : [ {
								axis : 'x',
								label : '신규 회원 수',
								data : joinCnt,
								backgroundColor : [ 
									'rgba(255, 99, 132, 0.3)' ],
									borderColor : [
										'rgba(255, 99, 132, 1)' ],
							borderWidth : 1
							} ]
						},
						options : {
							indexAxis : 'x',
						}
					});
					$("#joinCnt").html("Total : "+data.joinCnt)
				}
			})
			})
		})
		/** 회원가입 현황 끝 **/

		/** 인기검색어 **/
		
		
		$.ajax({
			url:getContextPath()+'/adminPage/admin_stats_kw',
			method:'get',
			data:{},
			dataType:'json',
			success:function(data){
						console.log(data)
						var keyword = [];
						var keywordCnt = [];
						for(var i=0; i<data.output_Top10_keyword.length; i++){
							keyword.push(data.output_Top10_keyword[i].search_keyword)
							keywordCnt.push(data.output_Top10_keyword[i].log_cnt);
						}
						const ctx3 = document.getElementById('keywordChart').getContext('2d');
						const keywordChart = new Chart(ctx3, {
							type : 'pie',
							data : {
								labels : keyword,
								datasets : [ {
									axis : 'x',
									label : '인기검색어',
									data : keywordCnt,
									backgroundColor : [ 
										'rgba(246, 229, 141, 0.5)',
										'rgba(255, 190, 118, 0.5)',
										'rgba(255, 121, 121, 0.5)',
										'rgba(186, 220, 88, 0.5)',
										'rgba(56, 173, 169, 0.5)',
										'rgba(126, 214, 223, 0.5)',
										'rgba(224, 86, 253, 0.5)',
										'rgba(104, 109, 224, 0.5)',
										'rgba(48, 51, 107, 0.5)',
										'rgba(149, 175, 192, 0.5)'
										],
										borderColor : [
											'rgba(246, 229, 141,1.0)',
											'rgba(255, 190, 118,1.0)',
											'rgba(255, 121, 121,1.0)',
											'rgba(186, 220, 88,1.0)',
											'rgba(56, 173, 169, 1.0)',
											'rgba(126, 214, 223,1.0)',
											'rgba(224, 86, 253,1.0)',
											'rgba(104, 109, 224,1.0)',
											'rgba(48, 51, 107,1.0)',
											'rgba(149, 175, 192,1.0)' ],
										borderWidth : 1
										} ]
									},
									options : {
										indexAxis : 'x',
										maintainAspectRatio: false,
									}
								});
				$("#TOP_Keyword").html("TOP Keyword: "+data.output_Top_keyword.search_keyword)
				$("#keywordCnt").html("Total : "+data.output_Top_keyword.log_cnt+"번")
			}
		})
		$('#keyword-interval').on('change', function(){
			$('#keywordChart').remove();
			$('#canvas-container3>.canvas').append('<canvas id="keywordChart" width="10" height="3"><canvas>')
			var interval=$('#keyword-interval option:selected').val()
			$.ajax({
				url:getContextPath()+'/adminPage/admin_stats_kw',
				method:'get',
				data:{interval},
				dataType:'json',
				success:function(data){
							console.log(data)
							var keyword = [];
							var keywordCnt = [];
							for(var i=0; i<data.output_Top10_keyword.length; i++){
								keyword.push(data.output_Top10_keyword[i].search_keyword)
								keywordCnt.push(data.output_Top10_keyword[i].log_cnt);
							}
							const ctx3 = document.getElementById('keywordChart').getContext('2d');
							const keywordChart = new Chart(ctx3, {
								type : 'pie',
								data : {
									labels : keyword,
									datasets : [ {
										axis : 'x',
										label : '인기검색어',
										data : keywordCnt,
										backgroundColor : [ 
											'rgba(246, 229, 141, 0.5)',
											'rgba(255, 190, 118, 0.5)',
											'rgba(255, 121, 121, 0.5)',
											'rgba(186, 220, 88, 0.5)',
											'rgba(56, 173, 169, 0.5)',
											'rgba(126, 214, 223, 0.5)',
											'rgba(224, 86, 253, 0.5)',
											'rgba(104, 109, 224, 0.5)',
											'rgba(48, 51, 107, 0.5)',
											'rgba(149, 175, 192, 0.5)'
											],
											borderColor : [
												'rgba(246, 229, 141,1.0)',
												'rgba(255, 190, 118,1.0)',
												'rgba(255, 121, 121,1.0)',
												'rgba(186, 220, 88,1.0)',
												'rgba(56, 173, 169, 1.0)',
												'rgba(126, 214, 223,1.0)',
												'rgba(224, 86, 253,1.0)',
												'rgba(104, 109, 224,1.0)',
												'rgba(48, 51, 107,1.0)',
												'rgba(149, 175, 192,1.0)' ],
											borderWidth : 1
											} ]
										},
										options : {
											indexAxis : 'x',
											maintainAspectRatio: false,
										}
									});
					$("#TOP_Keyword").html("TOP Keyword: "+data.output_Top_keyword.search_keyword)
					$("#keywordCnt").html("Total : "+data.output_Top_keyword.log_cnt+"번")
				}
			})
		})
		/** 인기검색어 끝 **/
		
		
		
		
		
		/** 당일 찜추가를 한 시간별 인원과 그중 외부사이트로 이동한사람의 시간별인원 **/
		var AddHour = [];
		var AddCnt = [];
		
		<c:forEach var="AddBookMarkLogItem" items="${output_Hour_Count_bookmark}">
			AddHour.push(${AddBookMarkLogItem.log_hour});
			AddCnt.push(${AddBookMarkLogItem.log_cnt});
		</c:forEach>
		
		var ExLInkHour = [];
		var ExLinkCnt = [];
		
		<c:forEach var="ExLinkLogItem" items="${output_Hour_Count_ExLink}">
			ExLInkHour.push(${ExLinkLogItem.log_hour});
			ExLinkCnt.push(${ExLinkLogItem.log_cnt});
		</c:forEach>
		
		const ctx4 = document.getElementById('myChart4').getContext('2d');
		const myChart4 = new Chart(ctx4,{
			data : {
				labels : AddHour,
				datasets : [ {
						axis : 'x',
						type : 'bar',
						label : '찜추가 인원',
						data : AddCnt,
						backgroundColor : [ 
							'rgba(255, 99, 132, 0.5)' ],
					borderColor : [
						'rgba(255, 99, 132, 1)' ],
					borderWidth : 1
					
				}]
			},
			options : {
				indexAxis : 'x',
				maintainAspectRatio: false,
			}
		});
		const ctx44 = document.getElementById('myChart44').getContext('2d');
		const myChart44 = new Chart(ctx44,{
			data : {
				labels : ExLInkHour,
				datasets : [ {
						axis : 'x',
						type : 'bar',
						label : '바로가기이용 인원',
						data : ExLinkCnt,
						backgroundColor : [ 
							'rgba(54, 162, 235, 0.5)' ],
							borderColor : [ 
							'rgba(54, 162, 235, 1)' ],
					borderWidth : 1
					
				}]
			},
			options : {
				indexAxis : 'x',
				maintainAspectRatio: false,
				scales: {
				    xAxes: [{ stacked: true }],
				    yAxes: [{ stacked: true }]
				  }
			}
		});
		/** 당일 찜추가를 한 시간별 인원과 그중 외부사이트로 이동한사람의 시간별인원 **/
		
		
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