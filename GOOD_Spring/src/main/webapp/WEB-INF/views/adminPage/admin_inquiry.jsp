<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style type="text/css">


.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.main_header>h1:hover {
	transform: translate(0, -10px);
}
</style>
</head>

<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/adminPage/admin_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<h1>1:1 문의 관리</h1>
			<hr />
			<!-- 카테고리 검색 -->
			<div class="container">
				<form class="form-horizontal" role="form">
					<fieldset>
						<div class="row">
							<div class="form-group col-sm-5">
								<label for="answer" class="col-sm-4 col-xs-3 control-label">답변상태
									: </label>
								<div class="col-sm-8 col-xs-9">
									<select class="form-control" name="answer" id="answer">
										<option value="">-- 상태 --</option>
										<option value="N">답변 중</option>
										<option value="Y">답변 완료</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-5">
								<label for="category" class="col-sm-4 col-xs-3 control-label">카테고리
									: </label>
								<div class="col-sm-8 col-xs-9">
									<select class="form-control" name="category" id="category">
										<option value="">-- 선택 --</option>
										<option value="자전거">자전거</option>
										<option value="걷기">걷기</option>
										<option value="문화체육">문화체육</option>
										<option value="커뮤니티">커뮤니티</option>
									</select>
								</div>
							</div>
							<div class="col-sm-2">
								<button
									class="btn btn-primary col-sm-offset-4 col-sm-8 col-xs-12"
									type="submit">검색</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<!-- //카테고리 검색 -->
			<!-- 문의글 목록 -->
			<div style="margin: 20px 0; border: 1px solid #eee;">
				<h2 class="text-center">-문의글목록-</h2>
				<table class="table table-bordered"
					style="width: 94% !important; margin: auto;">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">답변상태</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">제목</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<%--조회결과가 없는 경우 --%>
							<c:when test="${output==null || fn:length(output) == 0} ">
								<tr>
									<td class="text-center">조회결과가 없습니다.</td>
								</tr>
							</c:when>
							<%--조회결과가 있는 경우  --%>
							<c:otherwise>
								<%-- 조회 결과에 따른 반복 처리 --%>
								<c:forEach var="item" items="${output}" varStatus="status">
									<%-- 출력을 위해 준비한 문의글제목 변수  --%>
									<c:set var="QnA_no" value="${item.getQnA_no()}" />
									<%-- 상세페이지로 이동하기위한 URL --%>
									<c:url value="/adminPage/admin_inquiryDetail.do" var="infoUrl">
										<c:param name="QnA_no" value="${item.getQnA_no()}" />
									</c:url>
									<tr onclick="location.href='${infoUrl}'"
										style="cursor: pointer;">
										<td class="text-center">${status.count}</td>
										<td class="text-center">
										<c:if test="${item.answer_yn}">답변 완료</c:if>
										<c:if test="${!item.answer_yn}">답변 중</c:if></td>
										<td class="text-center">${item.getQnA_category()}</td>
										<td class="text-center">${item.getQnA_title()}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<!-- 페이지네이션 -->
				<div class="text-center">
					<!-- 페이지 번호 구현 -->
					<ul class="pagination">
						<%-- 이전 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 이전 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.prevPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="${getList }" var="prevPageUrl">
									<c:param name="page" value="${pageData.prevPage}" />
									<c:param name="keyword" value="${keyword}" />
									<c:param name="category" value="${category}" />
									<c:param name="area" value="${area}" />
									<c:param name="order" value="${order}" />
								</c:url>
								<li class="page-item"><a href="${prevPageUrl}">&laquo;</a></li>
							</c:when>
						</c:choose>

						<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
						<c:forEach var="i" begin="${pageData.startPage}"
							end="${pageData.endPage}" varStatus="status">
							<%-- 이동할 URL 생성 --%>
							<c:url value="${getList }" var="pageUrl">
								<c:param name="page" value="${i}" />
								<c:param name="keyword" value="${keyword}" />
								<c:param name="category" value="${category}" />
								<c:param name="area" value="${area}" />
								<c:param name="order" value="${order}" />
							</c:url>

							<%-- 페이지 번호 출력 --%>
							<c:choose>
								<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
								<c:when test="${pageData.nowPage == i}">
									<li class="page-item active"><span style="color: #fff;">${i}<span
											class="sr-only">(current)</span></span></li>
								</c:when>
								<%-- 나머지 페이지의 경우 링크 적용함 --%>
								<c:otherwise>
									<li class="page-item"><a href="${pageUrl}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<%-- 다음 그룹에 대한 링크 --%>
						<c:choose>
							<%-- 다음 그룹으로 이동 가능하다면? --%>
							<c:when test="${pageData.nextPage > 0}">
								<%-- 이동할 URL 생성 --%>
								<c:url value="${getList }" var="nextPageUrl">
									<c:param name="page" value="${pageData.nextPage}" />
									<c:param name="keyword" value="${keyword}" />
									<c:param name="category" value="${category}" />
									<c:param name="area" value="${area}" />
									<c:param name="order" value="${order}" />
								</c:url>
								<li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
				<!-- //페이지네이션 -->
			</div>
			<!-- //문의글 목록 -->
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
</body>
</html>