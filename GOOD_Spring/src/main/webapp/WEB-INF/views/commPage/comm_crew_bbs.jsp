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
				<span class="test01">커뮤니티<img src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" 	 />
				</span>
			</h1>
		</div>
			<h1 class="page-header">${output.crew_name} 크루</h1>
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
						<h5>가입된 회원 수 : 6명</h5>
						<h3 class="crew_name">${output.crew_name} 크루</h3>
						<p>${output.crew_sinto}</p>
					</div>
				</div>
				<!-- 크루 상세 정보  -->
				<div class="col-md-6">
					<h2>${output.crew_name} 크루 정보</h2>
					<p>
						${output.crew_dinto}
					</p>
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
						<tr>
							<td class="text-center">1</td>
							<td class="text-center"><a
								href="../commPage/comm_crew_post.jsp">팀 프로젝트 상황</a></td>
							<td class="text-center">김도훈</td>
							<td class="text-center">2021-06-09</td>
							<td class="text-center">111</td>
						</tr>
						<tr>
							<td class="text-center">2</td>
							<td class="text-center"><a
								href="../commPage/comm_crew_post.jsp">오늘 점심은 또죠 입니다</a></td>
							<td class="text-center">박찬희</td>
							<td class="text-center">2021-06-10</td>
							<td class="text-center">222</td>
						</tr>
						<tr>
							<td class="text-center">3</td>
							<td class="text-center"><a
								href="../commPage/comm_crew_post.jsp">동해물과 백두산이 마르고 닳도록</a></td>
							<td class="text-center">이상화</td>
							<td class="text-center">2021-06-11</td>
							<td class="text-center">333</td>
						</tr>
						<tr>
							<td class="text-center">4</td>
							<td class="text-center"><a
								href="../commPage/comm_crew_post.jsp">탕수육 짱</a></td>
							<td class="text-center">이준복</td>
							<td class="text-center">2021-06-12</td>
							<td class="text-center">555</td>
						</tr>
						<tr>
							<td class="text-center">5</td>
							<td class="text-center"><a
								href="../commPage/comm_crew_post.jsp">하느님이 보우하사 우리나라만세</a></td>
							<td class="text-center">정채원</td>
							<td class="text-center">2021-06-13</td>
							<td class="text-center">666</td>
						</tr>
						<tr>
							<td class="text-center">6</td>
							<td class="text-center"><a
								href="../commPage/comm_crew_post.jsp">무궁화 삼천리 화려강산</a></td>
							<td class="text-center">한남규</td>
							<td class="text-center">2021-06-14</td>
							<td class="text-center">777</td>
						</tr>
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
					<button type="button" id="btn1" class="btn btn-primary pull-right"
						onclick="location.href='../commPage/comm_crew_postWrite.jsp'">글쓰기</button>
					<button type="button" id="btn2" class="btn btn-primary pull-right"
						onclick="location.href='../commPage/comm_crew_memberJoin.jsp'">회원관리</button>
				</div>
			</div>
			<!-- //본문 중단2 영역 -->
			<!-- 본문 하단 영역 -->
			<div class="crew_bbs_footer">
				<div class="text-center col-md-12">
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
			</div>
			<!--// 본문 하단 영역 -->
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>



</body>
</html>