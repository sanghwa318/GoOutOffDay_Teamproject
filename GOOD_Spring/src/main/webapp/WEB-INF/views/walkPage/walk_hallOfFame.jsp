<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
</head>
<style>
div.media-body a, h2, h4{
text-decoration:none;
}
div.media-body a {
	color: #000000;
	}

.footer {
	margin-top: 50px;
}

.page {
	text-align: center;
}

.pagination {
	margin-top: 20px;
}

.media{
cursor:pointer;
}


.media-object{
height=170px;
width=170px;
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
</style>
<body>
	<div class="Wrapper">
		<div class="header">
			<%@ include file="../inc/Header.jsp"%>
		</div>
		<div class="container">
				<!-- 대제목 -->
		<div class="row main_header">
			<h1 class="page-header page-title" id="cas_header"
				onclick="location.href='../walkPage/walk_index.jsp'"
				style="cursor: pointer; color: #343a40;">
				<span class="test01">걷기<img src="../icon_img/걷기 아이콘.png;"
					style="width: 3rem; height: 3rem; position:relative; bottom: 3px; left: 5px;"></img>
				</span>
			</h1>
		</div>
			<div class="body">
				<div class="page_header">
					<h1>명예의 전당</h1>
				</div>
				<!-- 미디어 아이템 영역 -->
					<div class="media" id="media_content">
						<!-- 이미지 왼쪽 배치 -->
						<a class="pull-left" href="#"><img class="media-object"
							src="../img/profile_default.png" height="170" width="170"
							alt="도심의 야경"></a>
						<!-- 미디어 내용 영역 -->
						<div class="media-body" style="padding-left: 20px;" id="media-body">
							<!-- 내용의 제목 -->
							<h2 class="media-heading">
								<a>코스이름</a>
							</h2>
							<div style="padding: 5px 20px;">
								<h4 class="media-heading">
									<a href="#">지역 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">유형 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">거리 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">시간 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">난이도 : </a>
								</h4>
							</div>
						</div>
					</div>
					<hr />
					<!-- //미디어 아이템 영역-->
					<!-- 미디어 아이템 영역 -->
					<div class="media">
						<!-- 이미지 왼쪽 배치 -->
						<a class="pull-left" href="#"><img class="media-object"
							src="../img/profile_default.png" height="170" width="170"
							alt="도심의 야경"></a>
						<!-- 미디어 내용 영역 -->
						<div class="media-body" style="padding-left: 20px;">
							<!-- 내용의 제목 -->
							<h2 class="media-heading">
								<a>코스이름</a>
							</h2>
							<div style="padding: 5px 20px;">
								<h4 class="media-heading">
									<a href="#">지역 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">유형 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">거리 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">시간 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">난이도 : </a>
								</h4>
							</div>
						</div>
					</div>
					<hr />
					<!-- //미디어 아이템 영역-->
					<!-- 미디어 아이템 영역 -->
					<div class="media">
						<!-- 이미지 왼쪽 배치 -->
						<a class="pull-left" href="#"><img class="media-object"
							src="../img/profile_default.png" height="170" width="170"
							alt="도심의 야경"></a>
						<!-- 미디어 내용 영역 -->
						<div class="media-body" style="padding-left: 20px;">
							<!-- 내용의 제목 -->
							<h2 class="media-heading">
								<a href="<%=request.getContextPath()%>/walkPage/walk_detailCourse.jsp">코스이름</a>
							</h2>
							<div style="padding: 5px 20px;">
								<h4 class="media-heading">
									<a href="#">지역 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">유형 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">거리 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">시간 : </a>
								</h4>
								<h4 class="media-heading">
									<a href="#">난이도 : </a>
								</h4>
							</div>
						</div>
					</div>
					<hr />
					<!-- //미디어 아이템 영역-->

				<div class="page">
					<ul class="pagination">
						<li class="disabled"><a href="#">&lt;</a></li>
						<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->

	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->


<script>
$(function(){
	$("#media_content").click(function(){
		location.href = "<%=request.getContextPath()%>/commPage/comm_myCourseDetail.jsp";
		
	});
	
	
	
});

</script>

</body>
</html>