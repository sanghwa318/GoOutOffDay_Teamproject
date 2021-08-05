<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>

<div class="tab-content">
	<form class="form-inline" role="form" id="goalAdd">
		<fieldset style="margin-top: 30px; text-align: center;">
			<select id="setgoal_day" name="setgoal_day" class="form-control">
				<option value="">기간 선택
				<option value="1">1일</option>
				<option value="7">7일</option>
				<option value="30">30일</option>
			</select> &nbsp;동안&nbsp;<input type="text" style="width: 50px;"
				id="setgoal_distance" name="setgoal_distance" placeholder="거리"
				class="form-control">&nbsp; km,&nbsp;<input type="text"
				style="width: 50px;" id="setgoal_time" name="setgoal_time"
				placeholder="시간" class="form-control">&nbsp;시간을 걸을래 &nbsp;
			<button type="submit" class="btn btn-info" id="submitGoal"
				style="outline: none">설정하기</button>
		</fieldset>
	</form>

	<!-- 거리 -->
	<div class="jumbotron" style="background-color: #fefbfe">
		<h2>목표 거리</h2>
		<div class="progress progress-striped active" style="height: 35px">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="${distance}" aria-valuemin="0"
				aria-valuemax="${goalItem.setgoal_distance}"
				style="text-align:left; width: ${goalItem.distance_achieve}%; font-size: 35px; line-height: 35px;">
				<span class="sr-only">${goalItem.distance_achieve}% 완료</span>현재 목표치
				${goalItem.setgoal_distance} 미터 중 ${goalItem.distance_achieve}% 달성
			</div>
		</div>
		<h2>목표 시간</h2>
		<div class="progress progress-striped active" style="height: 35px">
			<div class="progress-bar progress-bar-danger" role="progressbar"
				aria-valuenow="${time}" aria-valuemin="0"
				aria-valuemax="${goalItem.setgoal_time}"
				style="text-align:left; width: ${goalItem.time_achieve}%; font-size: 35px; line-height: 35px;">
				<span class="sr-only">${goalItem.time_achieve}% 완료</span> 현재 목표치
				${goalItem.setgoal_time}분 중 ${goalItem.time_achieve}% 달성
			</div>
		</div>
		<br>
		<h2>목표 달성률</h2>
		<div style="width: 45%; display: inline-block">
			<canvas id="myChart1"></canvas>
		</div>
		<div style="width: 45%; display: inline-block">
			<canvas id="myChart2"></canvas>
		</div>
	</div>
</div>
<hr />

<!-- //컨테이너 -->


</body>
<script>
var confirm = function(setgoal_day, setgoal_distance, setgoal_time){
	swal({
		title: '확인',
		text: "목표를 설정할까요?",
		type: 'question',
		confirmButtonText: '네',
		showCancelButton: true,
		cancelButtonText: '아니요',
	}).then(function(result){
		if(result.value){
			var setgoal_day =$('#setgoal_day option:selected').val();
			var setgoal_distance = $('#setgoal_distance').val();
			var setgoal_time = $('#setgoal_time').val();
			
			console.log(setgoal_day, setgoal_distance, setgoal_time)
				$.ajax({
					url: getContextPath() + '/walkPage/walk_logSetGoalOk.do',
					type:'post',
					data: {setgoal_day, setgoal_distance, setgoal_time},
					success:function(){
					swal('성공', '목표가 설정되었습니다.', "success")	
					}
				})
		}else{
			swal('취소', '목표설정을 취소하였습니다.', 'error')	
				}
			}
		)
	}
	
	$('#submitGoal').click(function(e){
		e.preventDefault();

		

		
		if(setgoal_day==""){
			swal('경고', '목표 기간을 선택하세요', 'error')	
		}else if(setgoal_distance="" || setgoal_distance==null ||setgoal_distance.length<=0){
			swal('경고', '목표 거리를 입력하세요', 'error')	
		}else if(setgoal_time="" || setgoal_time==null||setgoal_time.length<=0){
			swal('경고', '목표 시간을 입력하세요', 'error')	
		}else{confirm()}
		
		
	})

	var successTime=[]
	var failTime=[]
	var successDist=[]
	var failDist=[]
	
	<c:forEach var="list" items="${goalList}" varStatus="status">
	
		<c:if test="${list.time_achieve>=100}">
			successTime.push(${list.time_achieve})
		</c:if>
		
		<c:if test="${list.time_achieve<100}">
			failTime.push(${list.time_achieve})
		</c:if>
		
		<c:if test="${list.distance_achieve>=100}">
			successDist.push(${list.distance_achieve})
		</c:if>
		
		<c:if test="${list.distance_achieve<100}">
			failDist.push(${list.distance_achieve})
		</c:if>
	</c:forEach>
	var timeSuccessCnt=successTime.length
	var timeFailCnt=failTime.length
	var timeSucRate=parseInt(timeSuccessCnt/(timeFailCnt+timeSuccessCnt)*100)
	var timeFailRate=100-timeSucRate
	
	var distSuccessCnt=successDist.length
	var distFailCnt=failDist.length
	var distSucRate=parseInt(distSuccessCnt/(distFailCnt+distSuccessCnt)*100)
	var distFailRate=100-distSucRate
	//그래프 옵션
	var option5 = {
	        plugins: {
	        	title:{
	        		display:true,
	        		text:'시간',
	        		font:{size:30}
	        		},
	            legend: {
	                display: true,
	                labels: {
	                }
	            }
	        },
		  responsive: true,
	        layout: {
	            padding: 20
	        }
		};
	
	var option6 = {
	        plugins: {
	        	title:{
	        		display:true,
	        		text:'거리',
	        		font:{size:30}
	        		},
	            legend: {
	                display: true,
	                labels: {
	                }
	            }
	        },
		  responsive: true,
	        layout: {
	            padding: 20
	        }
		};
	//차트 js그래프
	const ctx1 = document.getElementById('myChart1').getContext('2d');
	const myChart1 = new Chart(ctx1,
			{
				type : 'pie',
				data : {
					labels : [ '달성 성공률(%)', '달성 실패율(%)' ],
					datasets : [ {
						label : '시간',
						data : [timeSucRate, timeFailRate],
					    backgroundColor: ['rgba(54, 162, 235, 0.2)',"rgba(255,99,132,0.2)"],
					    borderColor: ['rgba(54, 162, 235, 1)',"rgba(255,99,132,1)"],
					    hoverBackgroundColor: ['rgba(54, 162, 235, 0.4)',"rgba(255,99,132,0.4)"],
					    hoverBorderColor: ['rgba(54, 162, 235, 1)',"rgba(255,99,132,1)"],
					    borderWidth : 2,
					    hoverOffset: 15,
					} ]
				},
				options:option5
			});
	
	const ctx2 = document.getElementById('myChart2').getContext('2d');
	const myChart2 = new Chart(ctx2,
			{
				type : 'pie',
				data : {
					labels : [ '달성 성공률(%)', '달성 실패율(%)' ],
					datasets : [ {
						label : '거리',
						data : [distSucRate, distFailRate],
					    backgroundColor: ['rgba(54, 162, 235, 0.2)',"rgba(255,99,132,0.2)"],
					    borderColor: ['rgba(54, 162, 235, 1)',"rgba(255,99,132,1)"],
					    hoverBackgroundColor: ['rgba(54, 162, 235, 0.4)',"rgba(255,99,132,0.4)"],
					    hoverBorderColor: ['rgba(54, 162, 235, 1)',"rgba(255,99,132,1)"],
					    borderWidth : 2,
					    hoverOffset: 15,
					} ]
				},
				options:option6
			});
	
</script>