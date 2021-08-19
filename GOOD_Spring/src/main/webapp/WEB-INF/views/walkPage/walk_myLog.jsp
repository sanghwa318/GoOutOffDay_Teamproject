<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="jumbotron" style="background-color: #fefbfe">
	<div class="tab-content">
		<div class="tab-pane fade in active" id="my">
			<div class="parent clearfix">
			</div>


			<h2>내 기록</h2>
			<div style="width: 30%; display: inline-block;">
				<canvas id="myChart1" height="400"></canvas>
			</div>
			<div style="width: 30%; display: inline-block;">
				<canvas id="myChart2"  height="400"></canvas>
			</div>
			<div style="width: 30%; display: inline-block;">
				<canvas id="myChart3" height="400"></canvas>
			</div>

		</div>

	</div>
</div>


<script>
	var option1 = {
	        plugins: {
	            legend: {
	                display: true,
	                labels: {
	                    color: 'rgb(255, 99, 132)'
	                }
	            }
	        },
		  responsive: true,
		  scales: {
		    yAxes: [{
		      stacked: true,
		      gridLines: {
		        display: true,
		        color: "rgba(255,99,132,0.2)"
		      }
		    }],
		    xAxes: [{
		      gridLines: {
		        display: false
		      }
		    }]
		  }
		};
var option2 = {
        plugins: {
            legend: {
                display: true,
                labels: {color:'rgba(54, 162, 235)'}
            }
        },
	  responsive: true,
	  scales: {
	    yAxes: [{
	      stacked: true,
	      gridLines: {
	        display: true,
	        color: "rgba(54, 162, 235,0.2)"
	      }
	    }],
	    xAxes: [{
	      gridLines: {
	        display: false
	      }
	    }]
	  }
	};
var option3 = {
        plugins: {
            legend: {
                display: true,
                labels: {color: 'rgba(255, 206, 86)'}
            }
        },
	  responsive: true,
	  scales: {
	    yAxes: [{
	      stacked: true,
	      gridLines: {
	        display: true,
	        color: "rgba(255, 206, 86,0.2)"
	      }
	    }],
	    xAxes: [{
	      gridLines: {
	        display: false
	      }
	    }]
	  }
	};
	const ctx1 = document.getElementById('myChart1').getContext('2d');
	const myChart1 = new Chart(ctx1,
			{
				type : 'bar',
				data : {
					labels : [ '거리(m)' ],
					datasets : [ {
						label : '# 걸은거리',
						data : [ ${distance} ],
					    backgroundColor: "rgba(255,99,132,0.2)",
					    borderColor: "rgba(255,99,132,1)",
					    hoverBackgroundColor: "rgba(255,99,132,0.4)",
					    hoverBorderColor: "rgba(255,99,132,1)",
					    borderWidth : 2,
						barThickness:36
					} ]
				},
				options:option1

			});
	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const myChart2 = new Chart(ctx2,
			{
				type : 'bar',
				data : {
					labels : [ '시간(분)'],
					datasets : [ {
						label : '# 걸은 시간',
						data : [${time/60} ],
						backgroundColor : 'rgba(54, 162, 235, 0.2)',
						borderColor : 'rgba(54, 162, 235, 1)',
						hoverBackgroundColor: "rgba(54, 162, 235,0.4)",
					    hoverBorderColor: "rgba(54, 162, 235,1)",
						borderWidth : 2,
						barThickness:36
					} ]
				},
				options:option2

			});
	const ctx3 = document.getElementById('myChart3').getContext('2d');
	const myChart3 = new Chart(ctx3,
			{
				type : 'bar',
				data : {
					labels : ['평균 페이스(m/분)'  ],
					datasets : [ {
						label : '# 평균 페이스',
						data : [ ${distance/(time/60)} ],
						backgroundColor : 'rgba(255, 206, 86, 0.2)',
						borderColor : 'rgba(255, 206, 86, 1)',
						hoverBackgroundColor: "rgba(255, 206, 86,0.4)",
					    hoverBorderColor: "rgba(255, 206, 86,1)",
						borderWidth : 2,
						barThickness:36
					} ]
				},
				options:option3

			});
</script>
</body>

</html>