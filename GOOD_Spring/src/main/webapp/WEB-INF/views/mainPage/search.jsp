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

#btnMoreW,
#btnMoreM,
#btnMoreC,
#btnMoreCAS { margin-top: 20px;}

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
				<input type="search" name="keyword" id="keyword" class="form-control"
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
			<div style="height: 50px;"></div>
			<!-- (1) [걷기목록] 리스트 출력 부분 시작 -->
			<c:choose>
				<%-- 조회 결과가 있는 경우 --%>
				<c:when
					test="${keyword != null && keyword != '' && 
				output_w != null && fn:length(output_w) != 0 }">
					<h2 class="text-center"><strong> --- 걷기목록 검색결과 --- </strong></h2>
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
								<c:param name="COURSE_NAME" value="${item_w.COURSE_NAME }" />
							</c:url>

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != '' }">
								<c:set var="mark" value="<mark>${keyword }</mark>" />
								<c:set var="COURSE_CATEGORY_NM"
									value="${fn:replace(item_w.COURSE_CATEGORY_NM,keyword,mark) }" />
							</c:if>

							<!-- 검색결과 리스트 표시 -->
							<hr />
							
							<div onclick="location.href='${viewUrl }'"
								style="cursor: pointer;'">
								<h3>${COURSE_NAME}> ${CPI_NAME } [생성날짜:${REG_DATE }] 코스난이도
									- ${COURSE_LEVEL }</h3>
								<p>
									코스유형: ${COURSE_CATEGORY_NM } | 지역 : (${SOUTH_NORTH_DIV_NM })
									${AREA_GU } | 거리 : ${DISTANCE } - 소요시간 : ${LEAD_TIME } <br />
									세부코스경로 : ${DETAIL_COURSE } | 관련지하철 - ${RELATE_SUBWAY } <br />
									코스설명 : ${CONTENT } [포인트설명 : ${CPI_CONTENT }]
							</div>
						</c:forEach>
					</div>
					<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->
					<c:if test="${pageDataW.totalPage > 1 }">
						<button id="btnMoreW" class="btn btn-blue btn-block">걷기 더보기</button>
						<hr/>
					</c:if>
				</c:when>

				<%-- 조회 결과가 없는 경우 --%>
				<c:otherwise>
					<h3> 코스목록에서는 조회 결과가 없습니다.</h3>
					<hr/>
				</c:otherwise>
			</c:choose>
			<!-- // (1) [걷기목록] 리스트 출력 부분 끝 -->
			<div style="height: 50px;"></div>
			
			<!-- (2) [나만의코스] 리스트 출력 부분 시작 -->
			<c:choose>
				<%-- 조회 결과가 있는 경우 --%>
				<c:when
					test="${keyword != null && keyword != '' && 
				output_m != null && fn:length(output_m) != 0 }">
					<h2 class="text-center"><strong> --- 나만의 코스 목록 검색결과 --- </strong></h2>
					<div id="listM">
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item_m" items="${output_m }" varStatus="status">
							<%-- 출력을 위해 준비한 파라미터들 --%>
							<c:set var="mycourse_name" value="${item_m.mycourse_name }" />
							<c:set var="mycourse_area" value="${item_m.mycourse_area }" />

							<%-- 상세 페이지로 이동하기 위한 URL --%>
							<c:url value="/commPage/comm_myCourseDetail.do" var="viewUrl">
								<c:param name="mycourse_no" value="${item_m.mycourse_no }" />
							</c:url>

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != '' }">
								<c:set var="mark" value="<mark>${keyword }</mark>" />
							</c:if>

							<!-- 검색결과 리스트 표시 -->
							<hr />
							
							<div onclick="location.href='${viewUrl }'"
								style="cursor: pointer;'">
								<h3>나만의 코스 이름 : ${mycourse_name }</h3>
								<p> 지역 : ${mycourse_area }<p>
							</div>
						</c:forEach>
					</div>
					<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->
					<c:if test="${pageDataM.totalPage > 1 }">
						<button id="btnMoreM" class="btn btn-blue btn-block">나만의 코스 더보기</button>
						<hr/>
					</c:if>
				</c:when>

				<%-- 조회 결과가 없는 경우 --%>
				<c:otherwise>
					<h3>나만의 코스에서는 조회 결과가 없습니다.</h3>
					<hr>
				</c:otherwise>
			</c:choose>
			<!-- // (2) [나만의코스] 리스트 출력 부분 끝 -->
			<div style="height: 50px;"></div>
			
			<!-- (3) [크루] 리스트 출력 부분 시작 -->
			<c:choose>
				<%-- 조회 결과가 있는 경우 --%>
				<c:when
					test="${keyword != null && keyword != '' && 
				output_c != null && fn:length(output_c) != 0 }">
					<h2 class="text-center"><strong> --- 크루 목록 검색결과 --- </strong></h2>
					<div id="listC">
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item_c" items="${output_c }" varStatus="status">
							<%-- 출력을 위해 준비한 파라미터들 --%>
							<c:set var="crew_name" value="${item_c.crew_name }" />
							<c:set var="crew_area" value="${item_c.crew_area }" />
							<c:set var="crew_sinto" value="${item_c.crew_sinto }" />
							<c:set var="crew_category" value="${item_c.crew_category }" />

							<%-- 상세 페이지로 이동하기 위한 URL --%>
							<c:url value="/commPage/comm_crew_bbs.do" var="viewUrl">
								<c:param name="crew_no" value="${item_c.crew_no }" />
							</c:url>

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != '' }">
								<c:set var="mark" value="<mark>${keyword }</mark>" />
							</c:if>

							<!-- 검색결과 리스트 표시 -->
							<hr />
							
							<div onclick="location.href='${viewUrl }'"
								style="cursor: pointer;'">
								<h3>크루이름 : ${crew_name }</h3>
								<p> 지역 : ${crew_area } | 카테고리 : ${crew_category } 
								<br/> 크루간단소개 : ${crew_sinto } <p>
							</div>
						</c:forEach>
					</div>
					<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->
					<c:if test="${pageDataC.totalPage > 1 }">
						<button id="btnMoreC" class="btn btn-blue btn-block">크루 더보기</button>
						<hr/>
					</c:if>
				</c:when>

				<%-- 조회 결과가 없는 경우 --%>
				<c:otherwise>
					<h3>크루에서는 조회 결과가 없습니다.</h3>
					<hr>
				</c:otherwise>
			</c:choose>
			<!-- // (3) [크루] 리스트 출력 부분 끝 -->
			<div style="height: 50px;"></div>
			
			<!-- (4) [문화체육] 리스트 출력 부분 시작 -->
			<c:choose>
				<%-- 조회 결과가 있는 경우 --%>
				<c:when
					test="${keyword != null && keyword != '' && 
				output_cas != null && fn:length(output_cas) != 0 }">
					<h2 class="text-center"><strong> --- 문화체육 목록 검색결과 --- </strong></h2>
					<div id="listCAS">
						<%-- 조회 결과에 따른 반복 처리 --%>
						<c:forEach var="item_cas" items="${output_cas }" varStatus="status">
							<%-- 출력을 위해 준비한 파라미터들 --%>
							<c:set var="MAXCLASSNM" value="${item_cas.MAXCLASSNM }" />
							<c:set var="MINCLASSNM" value="${item_cas.MINCLASSNM }" />
							<c:set var="SVCSTATNM" value="${item_cas.SVCSTATNM }" />
							<c:set var="SVCNM" value="${item_cas.SVCNM }" />
							<c:set var="PLACENM" value="${item_cas.PLACENM }" />
							<c:set var="USETGTINFO" value="${item_cas.USETGTINFO }" />
							<c:set var="AREANM" value="${item_cas.AREANM }" />
							<c:set var="TELNO" value="${item_cas.TELNO }" />

							<%-- 상세 페이지로 이동하기 위한 URL --%>
							<c:url value="/casPage/cas_detail.do" var="viewUrl">
								<c:param name="SVCID" value="${item_cas.SVCID }" />
							</c:url>

							<%-- 검색어가 있다면? --%>
							<c:if test="${keyword != '' }">
								<c:set var="mark" value="<mark>${keyword }</mark>" />
							</c:if>

							<!-- 검색결과 리스트 표시 -->
							<hr />
							
							<div onclick="location.href='${viewUrl }'"
								style="cursor: pointer;'">
								<h3>카테고리 : ${MAXCLASSNM } > ${MINCLASSNM } / 서비스명 : ${SVCNM }</h3>
								<p> 장소 : [${AREANM }]  ${PLACENM } (연락처: ${TELNO })
								<br/> 서비스상태 : ${SVCSTATNM } | 대상연령 : ${USETGTINFO } <p>
							</div>
						</c:forEach>
					</div>
					<!-- 전체 페이지 수가 2페이지 이상인 경우 "더보기"버튼 노출 -->
					<c:if test="${pageDataCAS.totalPage > 1 }">
						<button id="btnMoreCAS" class="btn btn-blue btn-block">문화체육 더보기</button>
						<hr/>
					</c:if>
				</c:when>

				<%-- 조회 결과가 없는 경우 --%>
				<c:otherwise>
					<h3>문화체육에서는 조회 결과가 없습니다.</h3>
					<hr>
				</c:otherwise>
			</c:choose>
			<!-- // (4) [문화체육] 리스트 출력 부분 끝 -->
			
			<!-- //검색 목록 영역 -->
		</div>
	</div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- (1) 걷기 템플릿 -->
	<script id="listW-tmpl" type="text/x-handlebars-template">
	{{#each item_w}}
	<hr/>
	<div onclick="location.href='${pageContext.request.contextPath }/walkPage/walk_detailCourse.do?CPI_IDX={{CPI_IDX}}'" 
style="cursor: pointer;'">
		<h3>{{COURSE_NAME}} > {{CPI_NAME}} [생성날짜:{{REG_DATE}}] 코스난이도 - {{COURSE_LEVEL}}</h3>
		<p>
			코스유형: {{COURSE_CATEGORY_NM}} | 지역 : ({{SOUTH_NORTH_DIV_NM}})
			{{AREA_GU}} | 거리 : {{DISTANCE}} - 소요시간 : {{LEAD_TIME}} <br />
			세부코스경로 : {{DETAIL_COURSE}} | 관련지하철 - {{RELATE_SUBWAY}} <br />
			코스설명 : {{CONTENT}} [포인트설명 : {{CPI_CONTENT}}]
	</div>
	{{/each}}
	</script>
	<!-- (2) 나만의 코스 템플릿 -->
	<script id="listM-tmpl" type="text/x-handlebars-template">
	{{#each item_m}}
	<hr/>
	<div onclick="location.href='${pageContext.request.contextPath }/commPage/comm_myCourseDetail.do?mycourse_no={{mycourse_no}}'" 
style="cursor: pointer;'">
		<h3>나만의 코스 이름 : {{mycourse_name}}</h3>
		<p> 지역 : {{mycourse_area}}<p>
	</div>
	{{/each}}
	</script>
	<!-- (3) 크루 템플릿 -->
	<script id="listC-tmpl" type="text/x-handlebars-template">
	{{#each item_c}}
	<hr/>
	<div onclick="location.href='${pageContext.request.contextPath }/commPage/comm_crew_bbs.do?crew_no={{crew_no}}'" 
style="cursor: pointer;'">
		<h3>크루이름 : {{crew_name}}</h3>
		<p> 지역 : {{crew_area}} | 카테고리 : {{crew_category}} 
		<br/> 크루간단소개 : {{crew_sinto}} <p>
	</div>
	{{/each}}
	</script>
	<!-- (4) 문화체육 템플릿 -->
	<script id="listCAS-tmpl" type="text/x-handlebars-template">
	{{#each item_cas}}
	<hr/>
	<div onclick="location.href='${pageContext.request.contextPath }/casPage/cas_detail.do?SVCID={{SVCID}}'" 
style="cursor: pointer;'">
		<h3>카테고리 : {{MAXCLASSNM}} > {{MINCLASSNM}} / 서비스명 : {{SVCNM}}</h3>
		<p> 장소 : [{{AREANM}}]  {{PLACENM}} (연락처: {{TELNO}})
		<br/> 서비스상태 : {{SVCSTATNM}} | 대상연령 : {{USETGTINFO}} <p>
	</div>
	{{/each}}
	</script>

	<%@ include file="../inc/plugin.jsp"%>
	<script>
		let nowPageW = 1;
		let keyword = $('#keyword').val();
		
		$(function() {
			$("#btnMoreW").click(function() {
				nowPageW++;

				// GET 방식 요청
				$.ajax({
					url : '${pageContext.request.contextPath }/mainPage/searchW',
					method : 'get',
					data : {'keyword': keyword, 'page' : nowPageW},
					dataType : 'json',
					success : function(json) {
					var source = $("#listW-tmpl").html(); // 템플릿 코드가져오기
					var template = Handlebars.compile(source); // 템플릿 코드 컴파일
					var result = template(json); // 템플릿 컴파일 결과물에 req전달
					$("#listW").append(result); // 최종 결과물을 #listW 요소에 추가

						// 현재 페이지 번호가 전체 페이지 수에 도달했다면 더보기 버튼 숨김
						if (json.meta.totalPage <= nowPageW) {
							$("#btnMoreW").hide();
						}
					}
				});
			});
		});
		
		let nowPageM = 1;
		$(function() {
			$("#btnMoreM").click(function() {
				nowPageM++;

				// GET 방식 요청
				$.ajax({
					url : '${pageContext.request.contextPath }/mainPage/searchM',
					method : 'get',
					data : {'keyword': keyword, 'page' : nowPageM},
					dataType : 'json',
					success : function(json) {
					var source = $("#listM-tmpl").html(); // 템플릿 코드가져오기
					var template = Handlebars.compile(source); // 템플릿 코드 컴파일
					var result = template(json); // 템플릿 컴파일 결과물에 req전달
					$("#listM").append(result); // 최종 결과물을 #listW 요소에 추가

						// 현재 페이지 번호가 전체 페이지 수에 도달했다면 더보기 버튼 숨김
						if (json.meta.totalPage <= nowPageM) {
							$("#btnMoreM").hide();
						}
					}
				});
			});
		});
		
		let nowPageC = 1;
		$(function() {
			$("#btnMoreC").click(function() {
				nowPageC++;

				// GET 방식 요청
				$.ajax({
					url : '${pageContext.request.contextPath }/mainPage/searchC',
					method : 'get',
					data : {'keyword': keyword, 'page' : nowPageC},
					dataType : 'json',
					success : function(json) {
					var source = $("#listC-tmpl").html(); // 템플릿 코드가져오기
					var template = Handlebars.compile(source); // 템플릿 코드 컴파일
					var result = template(json); // 템플릿 컴파일 결과물에 req전달
					$("#listC").append(result); // 최종 결과물을 #listW 요소에 추가

						// 현재 페이지 번호가 전체 페이지 수에 도달했다면 더보기 버튼 숨김
						if (json.meta.totalPage <= nowPageC) {
							$("#btnMoreC").hide();
						}
					}
				});
			});
		});
		
		let nowPageCAS = 1;
		$(function() {
			$("#btnMoreCAS").click(function() {
				nowPageCAS++;

				// GET 방식 요청
				$.ajax({
					url : '${pageContext.request.contextPath }/mainPage/searchCAS',
					method : 'get',
					data : {'keyword': keyword, 'page' : nowPageCAS},
					dataType : 'json',
					success : function(json) {
					var source = $("#listCAS-tmpl").html(); // 템플릿 코드가져오기
					var template = Handlebars.compile(source); // 템플릿 코드 컴파일
					var result = template(json); // 템플릿 컴파일 결과물에 req전달
					$("#listCAS").append(result); // 최종 결과물을 #listW 요소에 추가

						// 현재 페이지 번호가 전체 페이지 수에 도달했다면 더보기 버튼 숨김
						if (json.meta.totalPage <= nowPageCAS) {
							$("#btnMoreCAS").hide();
						}
					}
				});
			});
		});
	</script>
</body>
</html>