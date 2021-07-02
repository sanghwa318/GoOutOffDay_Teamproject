<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
request.setCharacterEncoding("UTF-8");
String pageno = request.getParameter("pageNo");
int j = Integer.parseInt(pageno);
int k = (j - 1) / 5;
int pageNum = k * 5;
%>
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

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}


.body .main_header {
	padding-bottom: 0;
}

.thumbnail{
padding:0;}
.title-img > img {
width: 100px;
height: 100px;
}
</style>
</head>
<body>
	<!-- 상단영역 -->
	<%@ include file="../inc/Header.jsp"%>
	<!-- 본문영역 -->
	<div class="container">
		<!-- 제목영역 -->
		<!-- 대제목 -->
		<div class="row main_header">
			<h1 class="page-header page-title" id="cas_header"
				onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
				style="cursor: pointer; color: #343a40;">
				<span class="test01">커뮤니티<img src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" 	 />
				</span>
			</h1>
		</div>
		<!-- 본문 게시판 시작 -->
		<div class="row cas_list">
			<!-- 커뮤니티 최상단 제목 -->
			<div class="header">
				<h1 style="color: #343a40;">나만의 코스</h1>
			</div>
			<!-- //제목영역 끝 -->
			<!-- 리스트영역-->
			<div class="row cas_item">
			<%for (int i=0; i<8; i++){ %>
					<div class="col-xs-6 col-sm-4 col-md-3">
						<div class="thumbnail item"
							onclick="location.href='${pageContext.request.contextPath}/commPage/comm_myCourseDetail.do'"
							style="cursor: pointer;">
							<img alt="테스트이미지 1번"
								src="${pageContext.request.contextPath}/assets/img/profile_default.png">
							<div class="caption clearfix">
								<p>작성자명
								</p>
								<h4>코스제목가나다라마바사
								</h4>
								<p class="pull-left">????</p>
								<p class="pull-right">????</p>
							</div>
						
						</div>
					</div>
								<%} %>
				</div>

			<!-- //리스트영역 끝-->
			<div style="height: 70px;">
				<form class="searchform col-md-4 col-md-offset-4 col-xs-9"
					role="search" style="padding-top: 15px;">
					<div class="form-group input-group">
						<input type="text" class="form-control" placeholder="검색">
						<span class="input-group-btn">
							<button class="btn btn-blue" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- 게시글 작성 버튼 -->
				<div class="pull-right postbtn"
					style="padding-top: 15px; padding-bottom: 15px;">
					<a href="${pageContext.request.contextPath}/commPage/comm_myCourseWrite.do" class="btn btn-info"
						id="postcourse">게시글 작성</a>
				</div>
			</div>

			<!-- 페이지네이션영역-->
			<div class="text-center">
				<ul class="pagination" id="pagination" style="margin-top: 0;">
					<li class="page-item"><a <%if (k != 0) {%>
						href="${pageContext.request.contextPath}/commPage/comm_myCourse.do?pageNo=<%=pageNum - 4%>" <%}%>>&laquo;</a></li>
					<%
					for (int l = 1; l < 6; l++) {
					%>

					<li class="page-item <%if (j == l + pageNum) {%>active<%}%>"><a
						class="page-item-a"
						href="${pageContext.request.contextPath}/commPage/comm_myCourse.do?pageNo=<%=pageNum + l%>"><%=pageNum + l%></a></li>

					<%
					}
					%>
					<li class="page-item"><a
						href="${pageContext.request.contextPath}/commPage/comm_myCourse.do?pageNo=<%=pageNum + 6%>">&raquo;</a></li>
				</ul>
			</div>
			<span class="sr-only">(current)</span>
			<!-- //페이지네이션영역 끝-->
		</div>
	</div>
	<!-- //본문영역 끝 -->
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript">
		
	</script>
</body>
</html>