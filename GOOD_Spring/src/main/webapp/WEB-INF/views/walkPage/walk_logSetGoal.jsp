<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>

<div class="tab-content">
	<form class="form-inline" role="form" id="goalAdd">
		<fieldset style="margin-top: 30px; text-align: center;">
			<select class="form-control">
				<option value="">기간 선택
				<option value="1">1일</option>
				<option value="2">7일</option>
				<option value="3">30일</option>
			</select>
			&nbsp;동안&nbsp;<input type="text" style="width:50px;" id="setgoal_distance" name="setgoal_distance" value="거리" class="form-control">&nbsp;	km,&nbsp;<input type="text" style="width:50px;" id="setgoal_time" name="setgoal_time" value="시간" class="form-control">&nbsp;시간을 걸을래
		 &nbsp;	<button type="submit" class="btn btn-info" style=" outline:none">설정하기</button>
		</fieldset>
	</form>

	<!-- 거리 -->
	<div class="jumbotron">
		<h2>목표설정 : 거리(KM)</h2>
		<canvas id="myChart4" width="10" height="3"></canvas>
	</div>
</div>
<hr />

<!-- 시간 -->
<div class="jumbotron">
	<!-- 시간 -->
	<h2>목표설정 : 시간(Min)</h2>
	<canvas id="myChart5" width="10" height="3"></canvas>
</div>

<!-- //컨테이너 -->


</body>
<script>
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
</script>