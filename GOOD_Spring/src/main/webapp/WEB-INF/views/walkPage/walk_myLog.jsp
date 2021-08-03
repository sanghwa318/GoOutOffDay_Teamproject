<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="jumbotron">
<div class="tab-content">
	<div class="tab-pane fade in active" id="my">
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


		<h2>내 기록</h2>
		<canvas id="myChart1" width="10" height="3"></canvas>
	</div>

</div>
</div>


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
						data : [ ${distance}, ${time/60}, ${distance/(time/60)} ],
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