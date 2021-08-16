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

.title-img>img {
	width: 100px;
	height: 100px;
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

.thumbnail img {
	max-hieght: 100%;
	min-width: 100%;
	height: 180px;
}

.pagination {
	margin-top: -100px;
}


</style>
</head>
<body>
	<!-- [페이지네이션] -->
	<c:set var="URL" value="/commPage/comm_crew.do" />
	<!-- //[페이지네이션] -->
	<div class="wrapper">

		<!-- 상단 영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문 영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">
				크루<img
					src="${pageContext.request.contextPath}/assets/icon_img/크루 아이콘.png"
					alt="크루 아이콘">
			</h1>

			<!-- 크루 본문영역 상단 -->

			<form class="form-horizontal" name="crew_header" id="crew_header"
				role="form" method="get"
				action="${pageContext.request.contextPath}/commPage/comm_crew.do">
				<div class="form-group">

					<div class="col-md-2 col-sm-3 col-xs-3 col-md-offset-1" role="search">
						<div class="form-group input-group">
							<input type="text" class="form-control" placeholder="크루를 검색해보세요."
								id="keyword" name="keyword" value=""><span
								class="input-group-btn">
								<button class="btn btn-blue" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
						</div>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2"  >
						<select class="form-control" id="crew_area" name="crew_area">
							<option value="">지역</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
						</select>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2 ">
						<select class="form-control" id="crew_condition" name="order">
							<option value="">조건</option>
							<option value=1>최신순</option>
							<option value=2>오래된순</option>
						</select>
					</div>
					<div class="col-md-2 col-sm-2 col-xs-2">
						<select class="form-control" id="crew_category" name="crew_category">
							<option value="">종류</option>
							<option value="걷기/체육">걷기/체육</option>
							<option value="친목/모임">친목/모임</option>
							<option value="문화/창작/예술">문화/창작/예술</option>
						</select>
					</div>
					<div class="col-md-2 col-sm-3 col-xs-3 pull-right btn_se" >
						<button type='reset' class="btn btn-primary" id="btn"
							onClick="location.href='${pageContext.request.contextPath}/commPage/comm_crew_est.do'">크루개설</button>
						<button type="reset" class="btn btn-primary" id="btn"
							onClick="location.href='${pageContext.request.contextPath}/commPage/comm_crew_myCrew.do'">마이크루</button>
					</div>
				</div>
			</form>
			<!-- 본문상단 끝 -->
			
				<div class="crew_middle">
				<div class="best">

			<!-- 크루 본문영역 중단 -->
			<c:choose>
				<%--조회결과가 없는 경우 --%>
				<c:when test="${output==null || fn:length(output) == 0} ">
					<div class="null">
						<div align="center">조회결과가 없습니다.</div>
					</div>
				</c:when>
				<%--조회결과가 있는 경우  --%>
				<c:otherwise>
					<%-- 조회 결과에 따른 반복 처리 --%>
					<c:forEach var="item" items="${output}" varStatus="status">
						<%-- 출력을 위해 준비한 크루이름 변수  --%>
						<c:set var="crew_name" value="${item.crew_name}" />

						<%-- 검색어가 있다면? --%>
						<c:if test="${keyword != '' }">
							<%-- 검색어에 <mark> 적용 --%>
							<c:set var="mark" value="<mark>${keyword}</mark>" />
							<%--출력을 위해 크루 이름에서 검색어와 일치하는 단어를 형광펜 효과 --%>
							<c:set var="crew_name"
								value="${fn:replace(crew_name,keyword,mark)}" />

						</c:if>

						<%-- 상세페이지로 이동하기위한 URL --%>
						<c:url value="/commPage/comm_crew_info.do" var="infoUrl">
							<c:param name="crew_no" value="${item.crew_no}" />
							<c:param name="crew_name" value="${item.crew_name}" />
						</c:url>
						
						<div class="col-xs-6 col-sm-4 col-md-3">
							<div class="thumbnail item" onclick="location.href='${infoUrl}'"
								style="cursor: pointer;">
								<img alt="크루 이미지" src="${item.crew_photo.fileUrl}"
									onclick="location.href='${infoUrl}'" style="cursor: pointer;">
								<div class="caption clearfix">
									<h4>
										<a href="${infoUrl}"> ${item.crew_name}</a>
									</h4>
									<h4>크루 소개: ${item.crew_sinto}</h4>
									<h4 >지역: ${item.crew_area}</h4>
									<h4 >종류: ${item.crew_category}</h4>
								</div>

							</div>
						</div>
						
						<!-- 관리자 권한으로 들어갔을땐, info를 거치지않고 바로 bbs로 들어가기 -->
						<c:url value="/commPage/comm_crew_bbs.do" var="bbsUrl">
							<c:param name="crew_no" value="${item.crew_no}" />
							<c:param name="crew_name" value="${item.crew_name}" />
						</c:url>
					<c:if test="${login_info.user_admin =='true'}">
						<%-- 관리자 권한으로 들어갔을땐, bbs상세페이지로 이동하기위한 URL --%>
						<div class="col-xs-6 col-sm-4 col-md-3">
							<div class="thumbnail item" onclick="location.href='${bbsUrl}'"
								style="cursor: pointer;">
								<img alt="크루 이미지" src="${item.crew_photo.fileUrl}"
									onclick="location.href='${bbsUrl}'" style="cursor: pointer;">
								<div class="caption clearfix">
									<h4>
										<a href="${bbsUrl}"> ${item.crew_name}</a>
									</h4>
									<h4>크루 소개: ${item.crew_sinto}</h4>
									<h4 >지역: ${item.crew_area}</h4>
									<h4 >종류: ${item.crew_category}</h4>
								</div>
							</div>
						</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			</div>
		</div>

		</div>
	</div>
	<br>
	<!-- 페이지네이션 -->
	<%@ include file="../inc/pagenation.jsp"%>
	<!-- //페이지네이션 -->

	<!-- 본문하단 끝 -->

	<!-- 하단 영역 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>

</body>
</html>