<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style type="text/css">
.pagination {
	justify-content: center;
}

body>div.container {
	min-height: 700px;
}

#list {
	min-height: 600px;
}

.media-body>.lead {
	margin-bottom: 0;
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>

		<!-- 본문 영역 -->
		<div class="container">
			<h1 class="page-header">통합검색</h1>

			<!-- 검색영역 -->
			<form method="get"
				action="${pageContext.request.contextPath }/mainPage/search.do"
				class="form-group input-group">
				<input type="search" name="keyword" id="search" class="form-control"
					placeholder="검색하기" value="${keyword }" /> <span
					class="input-group-btn">
					<button class="btn btn-blue" type="submit">
						<span style="color: #0069a6;">검색 </span><i
							class="glyphicon glyphicon-search" style="color: #0069a6;"></i>
					</button>
				</span>
			</form>
			<!-- //검색영역 -->
			<!-- 검색 목록 영역 -->
			<hr />
			<c:choose>
				<%-- 걷기 목록에서 조회 결과가 경우 --%>
				<c:when
					test="${keyword != null && keyword != '' && 
				output_w != null && fn:length(output_w) != 0 }">
					<h1>걷기목록</h1>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output_w }" varStatus="status">
						<%-- 출력을 위해 준비한 파라미터들 --%>
<%-- 						<c:set var="COURSE_CATEGORY_NM" --%>
<%-- 							value="${item.COURSE_CATEGORY_NM }" /> --%>
						<c:set var="SOUTH_NORTH_DIV_NM"
							value="${item.SOUTH_NORTH_DIV_NM }" />
						<c:set var="AREA_GU" value="${item.AREA_GU }" />
						<c:set var="DISTANCE" value="${item.DISTANCE }" />
						<c:set var="LEAD_TIME" value="${item.LEAD_TIME }" />

						<c:set var="COURSE_LEVEL" value="${item.COURSE_LEVEL }" />
						<c:set var="RELATE_SUBWAY" value="${item.RELATE_SUBWAY }" />
						<c:set var="TRAFFIC_INFO" value="${item.TRAFFIC_INFO }" />
						<c:set var="CONTENT" value="${item.CONTENT }" />
						<c:set var="COURSE_NAME" value="${item.COURSE_NAME }" />
						<c:set var="REG_DATE" value="${item.REG_DATE }" />
						<c:set var="DETAIL_COURSE" value="${item.DETAIL_COURSE }" />
						<c:set var="CPI_NAME" value="${item.CPI_NAME }" />
						<c:set var="CPI_CONTENT" value="${item.CPI_CONTENT }" />

						<%-- 상세 페이지로 이동하기 위한 URL --%>
						<c:url value="/walkPage/walk_detailCourse.do" var="viewUrl">
							<c:param name="CPI_IDX" value="${item.CPI_IDX }" />
						</c:url>
						
						<%-- 검색어가 있다면? --%>
						<c:if test="${keyword != '' }">
						<c:set var="mark" value="<mark>${keyword }</mark>" />
						<c:set var="COURSE_CATEGORY_NM" value="${fn:replace(item.COURSE_CATEGORY_NM,keyword,mark) }"/>
						</c:if>

						<!-- 검색결과 리스트 표시 -->
						<div onclick="location.href='${viewUrl }'"
							style="cursor: pointer;'">
							<h3>${COURSE_NAME}
								> ${CPI_NAME } [생성날짜:${REG_DATE }] 코스난이도 -
								<c:if test="${COURSE_LEVEL==1 }">초급</c:if>
								<c:if test="${COURSE_LEVEL==2 }">중급</c:if>
								<c:if test="${COURSE_LEVEL==3 }">고급</c:if>
							</h3>
							<p>
								코스유형: ${COURSE_CATEGORY_NM } | 지역 : (${SOUTH_NORTH_DIV_NM }) ${AREA_GU } | 거리 : ${DISTANCE } -
								소요시간 : ${LEAD_TIME } <br /> 세부코스경로 : ${DETAIL_COURSE } 
								<c:if test="${RELATE_SUBWAY != null && RELATE_SUBWAY != ''}"><br /> 관련지하철 - ${RELATE_SUBWAY } 
							</c:if>
								<br /> 코스설명 : ${CONTENT } [포인트설명 : ${CPI_CONTENT }]
						</div>

						<hr />
					</c:forEach>
				</c:when>

				<%-- 조회 결과가 없는 경우 --%>
				<c:otherwise>
					<h1>조회 결과가 없습니다.</h1>
				</c:otherwise>
			</c:choose>
			<!-- //검색 목록 영역 -->
		</div>
	</div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<!-- 	<script type="text/x-handlebars-template" id="list-item-tmpl"> -->
	<!-- 	{{#arr.data}} -->
	<!--         <div class="media"> -->
	<!-- 			<!-- 내용영역 -->
	-->
	<!-- 			<div class="media-body"> -->
	<!-- 				내용의 제목 -->
	<!-- 				<h2 class="media-heading"><a href="#">{{title}}</a></h2> -->
	<!-- 				내용 -->
	<!-- 				<p class="lead">{{content}}</p> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- <hr> -->
	<!-- 	{{/arr.data}} -->
	<!--     </script> -->

	<!-- 	<script src="data.js"></script> -->
	<!-- 	<script type="text/javascript"> -->
	// function get_list() { // // 미리 준비한 HTML틀을 읽어온다. // var template =
	Handlebars.compile($("#list-item-tmpl").html()); // var html =
	template(content); // // #list에 읽어온 내용을 추가한다. //
	$("#list").append(html); // if ('#list' == null) { //
	$("#list").append(html); // } // }; // $(function() { // get_list(); //
	});
	<!-- 	</script> -->
</body>
</html>