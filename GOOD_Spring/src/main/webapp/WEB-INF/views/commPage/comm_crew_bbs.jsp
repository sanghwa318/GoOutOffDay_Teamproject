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
.title-img>img {
	width: 200px;
	height: 100px;
}

#crew_middle {
	padding-left: 40px;
}

.col-md-6 {
	margin-left: 40px;
}

#btn2 {
	margin-right: 5px;
}

.col-md-4 {
	margin-left: 350px;
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
	<!-- [페이지네이션] -->
	<c:set var="URL" value="/commPage/comm_crew_bbs.do" />
	<!-- //[페이지네이션] -->
	<!-- 상단영역 -->
	<div class="wrapper">

		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">${output.crew_name}크루</h1>
			<!-- 본문 상단 영역 -->
			<div class="crew_bbs_header col-md-12 "></div>
			<!-- //본문 상단 영역 -->
			<!-- 본문 중단1 영역 -->
			<div class="crew_ibbs_middle1">
				<div class="col-md-3" id="crew_middle">
					<div class="form-group">
						<span class="title-img"><img
							src="${output.crew_photo.fileUrl}"> <span class='sr-only'>이미지</span>
						</span>
						<h5>가입된 회원 수 : ${output.crew_member} 명</h5>
						<h3 class="crew_name">${output.crew_name}크루</h3>
						<p>${output.crew_sinto}</p>
					</div>
				</div>
				<!-- 크루 상세 정보  -->
				<div class="col-md-6">
					<h2>${output.crew_name}크루정보</h2>
					<p>${output.crew_dinto}</p>
				</div>
				<!-- 크루 상세 정보 끝 -->

			</div>
			<!--// 본문 중단1 영역 -->
			<!-- 본문 중단2 영역 -->
			<div class="crew_bbs_middle2">
				<h1 class="col-md-12">자유게시판</h1>
				<table
					class="table table-striped table-bordered table-hover col-md-12">
					<thead>
						<tr class="active">
							<th class="text-center">게시글 번호</th>
							<th class="text-center">제목</th>
							<th class="text-center">작성자</th>
							<th class="text-center">작성일</th>
							<th class="text-center">조회수</th>
						</tr>
					</thead>
					<tbody id="list">
						<c:choose>
							<%--조회결과가 없는 경우 --%>
							<c:when test="${crewpost == null || fn:length(crewpost) == 0 })">
								<tr>
									<td class="text-center">등록된 게시글이 없습니다.</td>
								</tr>

								<%--조회결과가 있는 경우 --%>
								<c:otherwise>
									<c:forEach var="item" items="${crewpost}" varStatus="status">

									</c:forEach>

									<tr>
										<td class="text-center">${crewpost.post_no}</td>
										<td class="text-center">${crewpostoutput.post_title}</td>
										<td class="text-center">${crewpost.user_info_user_no}</td>
										<td class="text-center">${crewpost.post_hits}</td>
									</tr>

								</c:otherwise>
							</c:when>

						</c:choose>
					</tbody>
				</table>

				<div class="form-group">
					<div class="col-md-4" role="search">
						<div class="form-group input-group">
							<input type="text" class="form-control" placeholder="게시글 검색">
							<span class="input-group-btn">
								<button class="btn btn-blue" type="submit">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</span>
						</div>
					</div>
					<form
						action="${pageContext.request.contextPath}/commPage/comm_crew_memberJoin.do"
						method="GET">
						<input type="hidden" name="crew_crew_no" value="${output.crew_no}" />
						<button type="submit" id="btn2" class="btn btn-primary pull-right">회원관리</button>
					</form>

					<form
						action="${pageContext.request.contextPath}/commPage/comm_crew_postWrite.do"
						method="GET">
						<input type="hidden" name="post_crew" value="${output.crew_name}" />
						<input type="hidden" name="crew_no" value="${output.crew_no}" />
						<button type="submit" id="btn1" class="btn btn-primary pull-right">글쓰기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 페이지네이션 -->
	<%@ include file="../inc/pagenation.jsp"%>
	<!-- //페이지네이션 -->
	<!--// 본문 하단 영역 -->
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>



</body>
</html>