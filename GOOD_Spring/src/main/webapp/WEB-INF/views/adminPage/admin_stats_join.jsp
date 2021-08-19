<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
		<h2 class="text-primary">
		<em>Total : ${cnt}</em>
		</h2>
		<h3>조건별 가입 현황 그래프</h3>
		<canvas id="joinChart" width="10" height="3"></canvas>

</body>
<script type="text/javascript">
var joinDateHour = [];
var joinCnt = [];
<c:forEach var="joinLogItem" items="${output_Hour_Count_join}" >
	<c:choose>
		<c:when test="${joinLogItem.log_date!=null}">
			loginDateHour.push("${joinLogItem.log_date}");
		</c:when>
		<c:otherwise>
			loginDateHour.push("${joinLogItem.log_hour}");
		</c:otherwise>
	</c:choose>
		joinCnt.push(${joinLogItem.log_cnt});
</c:forEach>
console.log(joinHour)
console.log(joinCnt)
const ctx2 = $('#joinChart').getContext('2d');
const joinChart = new Chart(ctx2, {
	type : 'line',
	data : {
		labels : joinDateHour,
		datasets : [ {
			axis : 'x',
			label : '회원가입인원',
			data : joinCnt,
			backgroundColor : [ 
				'rgba(255, 99, 132, 0.2)' ],
		borderColor : [
			'rgba(255, 99, 132, 1)' ],
		borderWidth : 1
		} ]
	},
	options : {
		indexAxis : 'x',
	}
});

</script>