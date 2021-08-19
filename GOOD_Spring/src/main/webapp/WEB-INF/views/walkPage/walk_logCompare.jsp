<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- logCompaer -->
<div class="jumbotron" style="background-color: #fefbfe">
	<div class="tab-content">
		<div class="parent clearfix">
		</div>
	</div>
	<h2>회원들과의 비교</h2>
	<div style="width: 100%; height: 300px; display: inline-block;">
		<canvas id="myChart1" width="1000" height="300"></canvas>
	</div>
	<div style="width: 100%; height: 300px; display: inline-block;">
		<canvas id="myChart2" width="1000" height="300"></canvas>
	</div>
	<div style="width: 100%; height: 300px; display: inline-block;">
		<canvas id="myChart3" width="1000" height="300"></canvas>
	</div>

</div>

<script>
var barThickness = 30;
var option1 = {
		indexAxis : 'y',
		
        plugins: {
        	title: {
                display: true,
                text:'거리(m)',
                font:{weight:'bold',size:20}
            },
            legend: {
                display: false,
           
                labels: {
                	font: {weight:'bold'}
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
	    }],
        
	  }
	};
var option2 = {
		indexAxis : 'y',
    plugins: {
    	title: {
            display: true,
            text:'시간(분)',
            font:{weight:'bold',size:20}
        },
    	subtitle: {
            display: true,
            font:{weight:'bold'}
        },
        legend: {
            display: false,
            labels: {
            	font: {weight:'bold'}
            }
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
		indexAxis : 'y',
    plugins: {
    	title: {
    		display: true,
    		text:'평균페이스(m/분)',
            font:{weight:'bold',size:20}
        },
    	subtitle: {
            display: true,
            font:{weight:'bold'}
        },
        legend: {
            display: false,
            labels: {
            	font: {weight:'bold'}
            }
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
					labels : [ '전체 회원', '내 기록'],
					datasets : [ 
					{axis : 'y',
						axis : 'y',
						label : '거리 (m)',
						data : [ ${dist_all}, ${distance}],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'],
						borderColor : [ 'rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
						borderWidth : 2,
						barThickness:barThickness,
					    hoverBackgroundColor: [ 'rgba(255, 99, 132, 0.4)','rgba(54, 162, 235, 0.4)'],
					    hoverBorderColor: [ 'rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
					}
					]
				},
				options : option1
			});
	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const myChart2 = new Chart(ctx2,
			{
				type : 'bar',
				data : {
					labels : [ '전체 회원', '내 기록'],
					datasets :[ 
						{
							label : '시간 (분)',
							data : [ ${time_all/60}, ${time/60}],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'],
							borderColor : [ 'rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
							borderWidth : 2,
							barThickness:barThickness,
						    hoverBackgroundColor: [ 'rgba(255, 99, 132, 0.4)','rgba(54, 162, 235, 0.4)'],
						    hoverBorderColor: [ 'rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
						}
						]
				},
				options:option2

			});
	
	const ctx3 = document.getElementById('myChart3').getContext('2d');
	const myChart3 = new Chart(ctx3,
			{
				type : 'bar',
				data : {
					labels : [ '전체 회원', '내 기록'],
					datasets :[ 
						{
							axis : 'y',
							label : '평균 페이스 (m/분)',
							data : [${dist_all/(time_all/60)}, ${distance/(time/60)}],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)'],
							borderColor : [ 'rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
							borderWidth : 2,
							barThickness:barThickness,
						    hoverBackgroundColor: [ 'rgba(255, 99, 132, 0.4)','rgba(54, 162, 235, 0.4)'],
						    hoverBorderColor: [ 'rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)'],
						}
						]
				},
				options:option3

			});
	
</script>



