<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html>
<head>

<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<style>
/* 폼 전체 박스 */
.form-horizontal {
	width: auto;
	margin: auto;
	padding: 30px 10px;
}

.col-md-2 {
	display: inline-block;
	margin-left: 10px;
	folat: left;
}

.col-md-4 {
	margin-left: 20px;
}

.title-img>img {
	width: 100px;
	height: 100px;
}

.thumbnail {
	padding: 0;
}

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.main_header>h1:hover {
	transform: translate(0, -10px);
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}
</style>
</head>
<body>
	<div class="wrapper">

		<!-- 상단 영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문 영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="../icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">
				크루<img src="../icon_img/크루 아이콘.png" alt="크루 아이콘">
			</h1>

			<!-- 크루 본문영역 상단 -->

			<form class="form-horizontal" name="crew_header" id="crew_header"
				role="form" method="get" action="${pageContext.request.contextPath}/commPage/comm_crew.do">
				<div class="form-group">
					<div class="col-md-3 pull-right">
						<button type='reset' class="btn btn-primary" id="btn"
							onClick="location.href='${pageContext.request.contextPath}/commPage/comm_crew_est.do'">크루개설</button>
						<button type="reset" class="btn btn-primary" id="btn"
							onClick="location.href='../commPage/comm_crew_myCrew.jsp'">마이크루</button>
					</div>
					<div class="col-md-4" role="search">
						<div class="form-group input-group">
							<span class="input-group-btn">
								<button class="btn btn-blue" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span><input type="text" class="form-control" placeholder="크루, 게시글 검색" id="keyword" name="keyword" value="${keyword}">
						</div>
					</div>
					<div class="col-md-2 pull-right">
						<select class="form-control" id="crew_region" name="crew_region">
							<option value="">지역</option>
							<option value="all">전체</option>
							<option value="gangnam">강남구</option>
							<option value="gangdong">강동구</option>
							<option value="gangbug">강북구</option>
							<option value="gangseo">강서구</option>
							<option value="gwan-ag">관악구</option>
							<option value="gwangjin">광진구</option>
							<option value="gulo">구로구</option>
							<option value="geumcheon">금천구</option>
							<option value="nowon">노원구</option>
							<option value="dobong">도봉구</option>
							<option value="dongdaemun">동대문구</option>
							<option value="dongjag">동작구</option>
							<option value="mapo">마포구</option>
							<option value="seodaemun">서대문구</option>
							<option value="seocho">서초구</option>
							<option value="seongdong">성동구</option>
							<option value="seongbug">성북구</option>
							<option value="songpa">송파구</option>
							<option value="yangcheon">양천구</option>
							<option value="yeongdeungpo">영등포구</option>
							<option value="yongsan">용산구</option>
							<option value="eunpyeong">은평구</option>
							<option value="jonglo">종로구</option>
							<option value="jung-gu">중구</option>
							<option value="junglang">중랑구</option>
						</select>
					</div>
					<div class="col-md-2  pull-right">
						<select class="form-control" id="crew_condition"
							name="crew_condition">
							<option value="">조건</option>
							<option value="fast">최신순</option>
							<option value="low">오래된순</option>
							<option value="popular">인기순</option>
						</select>
					</div>
				</div>
			</form>
			<!-- 본문상단 끝 -->

			<!-- 크루 본문영역 중단 -->
			<div class="row cas_item">
			
			<table border="1">
			<thead>
				<tr>
					<th width="80" align="center">크루번호: </th>
					<th width="80" align="center">크루이름: </th>
				</tr>
			</thead>
			
			
			<tbody>
			<c:choose>
			<%--조회결과가 없는 경우 --%>
			<c:when test="${output==null || fn:length(output) == 0} ">
			
			<tr>
				<td colspan="9" align="center">조회결과가 없습니다.</td>
			</tr>
			</c:when>
			<%--조회결과가 있는 경우  --%>
			<c:otherwise>
				<%-- 조회 결과에 따른 반복 처리 --%>
				<c:forEach var="item" items="${output}" varStatus="status">
					<%-- 출력을 위해 준비한 크루이름 변수  --%>
					<c:set var="crew_name" value="${item.crew_name}"/>
					
					<%-- 검색어가 있다면? --%>
					<c:if test="${keyword != '' }">
						<%-- 검색어에 <mark> 적용 --%>
						<c:set var="mark" value="<mark>${keyword}</mark>" />
						<%--출력을 위해 크루 이름에서 검색어와 일치하는 단어를 형광펜 효과 --%>
						<c:set var="crew_name" value="${fn:replace(crew_name,keyword,mark)}"/>
						
					</c:if>
					
					<%-- 상세페이지로 이동하기위한 URL --%>
					<c:url value="/commPage/comm.crew.info.do" var="infoUrl">
						<c:param name="crew_no" value="${item.crew_no}"/>
					</c:url>
				
				<tr>
					<td align="center"><img src="${item.crew_photo.fileUrl}" width="100" /></td>
					<td align="center"><a href="${infoUrl}">${item.crew_name}</a></td>
				</tr>
				</c:forEach>
			</c:otherwise>
				</c:choose>
				
				
				<%-- 페이지 번호 구현 --%>
				<%-- 이전 그룹에 대한 링크 --%>
				<c:choose>
					<%--이전 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.prevPage > 0}">
						<%-- 이동할 URL 생성 --%>
						<c:url value="/commPage/comm_crew.do" var="prevPageUrl">
							<c:param name="page" value="${pageData.prevPage}"/>
							<c:param name="keyword" value="${keyword}"/>
						</c:url>
						<a href="${prevPageUrl}">[이전]</a>
					
					</c:when>
					<c:otherwise>[이전]</c:otherwise>
					
				</c:choose>
				
				<%--페이지 번호  --%>
				<c:forEach var="i" begin="${pageData.startPage}" end="${pageData.endPage}" varStatus="status">
				<%--이동할 URL 생성 --%> 
				 <c:url value="/commPage/comm_crew.do" var="pageUrl">
				 <c:param name="page" value="${i}"/>
				 <c:param name="keyword" value="${keyword}"/>
				 </c:url>
				 
				 
				 <%--페이지 번호 출력 --%>
				 <c:choose>
				 	<%--현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
				 	<c:when test="${pageData.nowPage} == i">
				 		<strong>[${i}]</strong>
				 	</c:when>
				 	<%--나머지 페이지의 경우 링크 적용함 --%>
				 	<c:otherwise>
				 	<a href="${pageUrl}">[${i}]</a>
				 	</c:otherwise>
				 </c:choose>
				 
				</c:forEach>
				
				<%-- 다음 그룹에 대한 링크 --%>
				<c:choose>
					<%--다음 그룹으로 이동 가능하다면? --%>
					<c:when test="${pageData.nextPage} 0">
					<%--이동할 URL생성 --%>
					<c:url value="/commPage/comm_crew.do" var="nextPageUrl">
						<c:param name="page" value="${pageData.nextPage}"/>
						<c:param name="keyword" value="${keyword}"/>
					</c:url>
					<a href="${nextPageUrl}">[다음]</a>
					</c:when>
					<c:otherwise>[다음]</c:otherwise>
					
					
				</c:choose>
				
				 </tbody>
				</table>
			</div>
		</div>

		<!-- 크루 본문영역 하단 -->

		<div class="text-center" id="paging">
			<ul class="pagination">
				<li class="page-item disabled"><a href="#">&laquo;</a></li>
				<li class="page-item active"><span>1<span
						class="sr-only">(current)</span></span></li>
				<li class="page-item"><a href="#">2</a></li>
				<li class="page-item"><a href="#">3</a></li>
				<li class="page-item"><a href="#">4</a></li>
				<li class="page-item"><a href="#">5</a></li>
				<li class="page-item"><a href="#">&raquo;</a></li>
			</ul>
		</div>
		<!-- 본문하단 끝 -->
	</div>
	</div>
	<!-- 하단 영역 -->
		<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>

</body>
</html>