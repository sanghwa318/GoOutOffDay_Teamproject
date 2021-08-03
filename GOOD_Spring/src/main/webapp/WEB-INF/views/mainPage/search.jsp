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
			<!-- 리스트 출력 부분 시작 -->
			<c:choose>
				<%-- 걷기 목록에서 조회 결과가 경우 --%>
				<c:when
					test="${keyword != null && keyword != '' && 
				output_w != null && fn:length(output_w) != 0 }">
					<h1>걷기목록</h1>
					<div id="listW">
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item_w" items="${output_w }" varStatus="status">
							<%-- 출력을 위해 준비한 파라미터들 --%>
							<%-- 						<c:set var="COURSE_CATEGORY_NM" --%>
							<%-- 							value="${item.COURSE_CATEGORY_NM }" /> --%>
							<c:set var="SOUTH_NORTH_DIV_NM"
								value="${item_w.SOUTH_NORTH_DIV_NM }" />
							<c:set var="AREA_GU" value="${item_w.AREA_GU }" />
							<c:set var="DISTANCE" value="${item_w.DISTANCE }" />
							<c:set var="LEAD_TIME" value="${item_w.LEAD_TIME }" />

							<c:set var="COURSE_LEVEL" value="${item_w.COURSE_LEVEL }" />
							<c:set var="RELATE_SUBWAY" value="${item_w.RELATE_SUBWAY }" />
							<c:set var="TRAFFIC_INFO" value="${item_w.TRAFFIC_INFO }" />
							<c:set var="CONTENT" value="${item_w.CONTENT }" />
							<c:set var="COURSE_NAME" value="${item_w.COURSE_NAME }" />
							<c:set var="REG_DATE" value="${item_w.REG_DATE }" />
							<c:set var="DETAIL_COURSE" value="${item_w.DETAIL_COURSE }" />
							<c:set var="CPI_NAME" value="${item_w.CPI_NAME }" />
							<c:set var="CPI_CONTENT" value="${item_w.CPI_CONTENT }" />

							<%-- 상세 페이지로 이동하기 위한 URL --%>
							<c:url value="/walkPage/walk_detailCourse.do" var="viewUrl">
								<c:param name="CPI_IDX" value="${item_w.CPI_IDX }" />
							</c:url>

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != '' }">
								<c:set var="mark" value="<mark>${keyword }</mark>" />
								<c:set var="COURSE_CATEGORY_NM"
									value="${fn:replace(item_w.COURSE_CATEGORY_NM,keyword,mark) }" />
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
<!-- 								<p> -->
<%-- 									코스유형: ${COURSE_CATEGORY_NM } | 지역 : (${SOUTH_NORTH_DIV_NM }) --%>
<%-- 									${AREA_GU } | 거리 : ${DISTANCE } - 소요시간 : ${LEAD_TIME } <br /> --%>
<%-- 									세부코스경로 : ${DETAIL_COURSE } --%>
<%-- 									<c:if test="${RELATE_SUBWAY != null && RELATE_SUBWAY != ''}"> --%>
<%-- 										<br /> 관련지하철 - ${RELATE_SUBWAY }  --%>
<%-- 							</c:if> --%>
<%-- 									<br /> 코스설명 : ${CONTENT } [포인트설명 : ${CPI_CONTENT }] --%>
							</div>

							<hr />
						</c:forEach>
					</div>
					<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->
					<c:if test="${pageData.totalPage > 1 }">
						<button id="btnMore">[더보기]</button>
					</c:if>
				</c:when>

				<%-- 조회 결과가 없는 경우 --%>
				<c:otherwise>
					<h1>조회 결과가 없습니다.</h1>
				</c:otherwise>
			</c:choose>
			<!-- // 리스트 출력 부분 끝 -->
			<!-- //검색 목록 영역 -->
		</div>
	</div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<script id="listW-tmpl" type="text/x-handlebars-template">
	{{#each item_w}}
	<div>
		<h3>{{COURSE_NAME}} > {{CPI_NAME}} [생성날짜:{{REG_DATE}}] </h3>
	</div>
	<hr/>
	{{/each}}
	</script>

	<%@ include file="../inc/plugin.jsp"%>
	<script>
		let nowPage = 1;

		$(function() {
			$("#btnMore")
					.click(
							function() {
								nowPage++;

								// GET 방식 요청
								$
										.ajax({
											url : '${pageContext.request.contextPath }/mainPage/searchW',
											method : 'get',
											data : {
												'page' : nowPage
											},
											dataType : 'json',
											success : function(json) {
												var source = $("#listW-tmpl")
														.html(); // 템플릿 코드가져오기
												var template = Handlebars
														.compile(source); // 템플릿 코드 컴파일
												var result = template(json); // 템플릿 컴파일 결과물에 req전달
												$("#listW").append(result); // 최종 결과물을 #listW 요소에 추가

												// 현재 페이지 번호가 전체 페이지 수에 도달했다면 더보기 버튼 숨김
												if (json.meta.totalPage <= nowPage) {
													$("#btnMore").hide();
												}
											}
										});
							});
		});
	</script>
</body>
</html>