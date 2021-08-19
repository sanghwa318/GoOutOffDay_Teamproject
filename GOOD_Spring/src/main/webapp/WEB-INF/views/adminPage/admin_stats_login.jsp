<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
		<h2 class="text-primary">
		<em>Total : ${cnt}</em>
		</h2>
		<h3>접속인원</h3>
		<canvas id="myChart1" width="10" height="3"></canvas>


<script type="text/javascript">
var loginDateHour = [];
var loginCnt = [];
<c:forEach var="output" items="${output}" >
	<c:choose>
		<c:when test="${output.log_date!=null}">
			loginDateHour.push("${output.log_date}");
		</c:when>
		<c:otherwise>
			loginDateHour.push("${output.log_hour}");
		</c:otherwise>
	</c:choose>
	loginCnt.push(${output.log_cnt});
</c:forEach>

const ctx1 = document.getElementById('myChart1').getContext('2d');
const myChart1 = new Chart(ctx1, {
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
</script>