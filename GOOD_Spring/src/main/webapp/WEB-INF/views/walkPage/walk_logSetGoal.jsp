<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>

<div class="tab-content">
	<form class="form-inline" role="form" id="goalAdd">
		<fieldset style="margin-top: 30px; text-align: center;">
			<select name="setgoal_day" class="form-control">
				<option value="">기간 선택
				<option value="1">1일</option>
				<option value="7">7일</option>
				<option value="30">30일</option>
			</select> &nbsp;동안&nbsp;<input type="text" style="width: 50px;"
				id="setgoal_distance" name="setgoal_distance" placeholder="거리"
				class="form-control">&nbsp; km,&nbsp;<input type="text"
				style="width: 50px;" id="setgoal_time" name="setgoal_time"
				placeholder="시간" class="form-control">&nbsp;시간을 걸을래 &nbsp;
			<button type="submit" class="btn btn-info" id="submitGoal" style="outline: none">설정하기</button>
		</fieldset>
	</form>

	<!-- 거리 -->
	<div class="jumbotron" style="background-color: #fefbfe">
		<h2>목표 거리</h2>
		<div class="progress progress-striped active" style="height: 35px">
			<div class="progress-bar progress-bar-success" role="progressbar"
				aria-valuenow="${distance}" aria-valuemin="0" aria-valuemax="${goalItem.setgoal_distance}"
				style="width: ${goalItem.distance_achieve}%; font-size: 35px; line-height: 35px;">
				<span class="sr-only">${goalItem.distance_achieve}% 완료</span>목표치 ${goalItem.setgoal_distance} 미터 중 ${goalItem.distance_achieve}% 완료
			</div>
		</div>
		<h2>목표 시간</h2>
		<div class="progress progress-striped active" style="height: 35px">
			<div class="progress-bar progress-bar-danger" role="progressbar"
				aria-valuenow="${time}" aria-valuemin="0" aria-valuemax="${goalItem.setgoal_time}"
				style="width: ${goalItem.time_achieve}%; font-size: 35px; line-height: 35px;">
				<span class="sr-only">${goalItem.time_achieve}% 완료</span> 목표치 ${goalItem.setgoal_time}분 중 ${goalItem.time_achieve}% 완료
			</div>
		</div>
	</div>
</div>
<hr />

<!-- //컨테이너 -->


</body>
<script>

	$('#submitGoal').click(function(e){
		e.preventDefault();
		var setgoal_day =$('#setgoal_day option:selected').val();
		var setgoal_distance = document.getElementById('setgoal_distance').value;
		var setgoal_time = document.getElementById('setgoal_time').value;
		swal({
			title: '확인',
			text: "목표를 설정할까요?",
			type: 'question',
			confirmButtonText: '네',
			showCancelButton: true,
			cancelButtonText: '아니요',
		}).then(function(result){
			$.ajax({
				url: getContextPath() + '/walkPage/walk_logSetGoalOk.do',
				type:'post',
				data: {setgoal_day, setgoal_distance, setgoal_time},
				success:function(){
				swal('목표가 설정되었습니다.')	
				}
			})
		})
		
		
	})
</script>