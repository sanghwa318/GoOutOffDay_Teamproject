<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- logCompaer -->
<div class="jumbotron">
		<div class="tab-content" >
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
	<hr />
	<div class="jumbotron">
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
	<div class="form-group pull-right">
		<select class="form-control">
			<option value="">--- 비교하고 싶은 크루원을 선택하세요 ---</option>
			<option value="1">돈다발</option>
			<option value="2">모카</option>
		</select>
	</div>
	</div>

	<h2>크루와의 비교</h2>

	<canvas id="myChart3" width="10" height="3"></canvas>
</div>

	<script>
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
   </script>
	<script>
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
	
 
