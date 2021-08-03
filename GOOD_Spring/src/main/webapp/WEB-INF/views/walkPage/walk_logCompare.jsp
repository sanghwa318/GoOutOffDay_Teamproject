<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- logCompaer -->
<div class="jumbotron">
	<div class="tab-content">
		<div class="parent clearfix">
			<div class="form-group pull-right">
				<select class="form-control">
					<option value="">--- 기간을 선택하세요 ---</option>
					<option value="1">일별</option>
					<option value="2">주간별</option>
					<option value="3">월별</option>
					<option value="4">총합</option>
				</select>
			</div>
		</div>
	</div>
	<h2>회원들과의 비교</h2>
	<canvas id="myChart2" width="10" height="3"></canvas>
</div>

<script>
	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const myChart2 = new Chart(ctx2,
			{
				type : 'bar',
				data : {
					labels : [ '전체 회원 걸은 거리(m)', '나의 걸은 거리(m)', '전체 회원 걸은 시간(분)',
							'나의 걸은 시간(분)', '전체 회원 평균 페이스(m/분)', '나의 평균 페이스(m/분)' ],
					datasets : [ {
						axis : 'y',
						label : '# 내 기록',
						data : [ ${dist_all}, ${distance}, ${time_all/60}, ${time/60}, ${dist_all/(time_all/60)}, ${distance/(time/60)} ],
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



