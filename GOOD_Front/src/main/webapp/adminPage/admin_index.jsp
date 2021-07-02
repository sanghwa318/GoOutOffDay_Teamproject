<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style>
@media ( min-width :992px) {
	.line {
		height: 240px;
		border-right: 2px solid #eee;
	}
	.wrapper>.container>.admin_row{
	margin-top:80px}
	

}

@media ( max-width :992px) {
	.line {
		border-bottom: 1px solid #eee;
	}
}

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

div.wrapper {
	min-height: 90%;
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
					onclick="location.href='../adminPage/admin_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<div class="row admin_row">
				<!-- 회원정보 -->
				<div class="col-md-3 line" style="padding-bottom: 20px;">
					<h1 class="text-center">-회원정보-</h1>
					<div class="row" style="padding: 10px;">
						<button class="btn btn-lg btn-default col-xs-offset-2 col-xs-8"
							onclick="location.href='<%=request.getContextPath()%>/adminPage/admin_inquiry.jsp'">1:1문의관리</button>
					</div>
					<div class="row" style="padding: 10px;">
						<button class="btn btn-lg btn-primary col-xs-offset-2 col-xs-8"
							onclick="location.href='<%=request.getContextPath()%>/adminPage/admin_member.jsp'">회원관리</button>
					</div>
				</div>
				<!-- //회원정보 -->
				<!-- 커뮤니티 -->
				<div class="col-md-3 line" style="padding-bottom: 20px;">
					<h1 class="text-center">-커뮤니티-</h1>
					<div class="row" style="padding: 10px;">
						<button class="btn btn-lg btn-success col-xs-offset-2 col-xs-8"
							onclick="location.href='<%=request.getContextPath()%>/adminPage/admin_userCourse.jsp'">회원코스관리</button>
					</div>
				</div>
				<!-- //커뮤니티 -->
				<!-- 통계 -->
				<div class="col-md-3 line" style="padding-bottom: 20px;">
					<h1 class="text-center">-통계-</h1>
					<div class="row" style="padding: 10px;">
						<button class="btn btn-lg btn-info col-xs-offset-2 col-xs-8"
							onclick="location.href='<%=request.getContextPath()%>/adminPage/admin_stats.jsp'">회원로그</button>
					</div>
				</div>
				<!-- //통계 -->
				<!-- 공지사항 -->
				<div class="col-md-3" style="padding-bottom: 20px;">
					<h1 class="text-center">-공지사항-</h1>
					<div class="row" style="padding: 10px;">
						<button class="btn btn-lg btn-warning col-xs-offset-2 col-xs-8"
							onclick="location.href='<%=request.getContextPath()%>/adminPage/admin_notice.jsp'">공지사항관리</button>
					</div>
				</div>
				<!-- //공지사항 -->
			</div>

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