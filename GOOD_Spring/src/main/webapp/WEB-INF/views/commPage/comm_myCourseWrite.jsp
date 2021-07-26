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
<link
	href="https://cdn.jsdelivr.net/npm/froala-editor@latest/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />

<style type="text/css">
.fr-wrapper {
	min-height: 400px
}

#editable {
	margin-top: 30px;
}

input#title {
	width: 500px;
	height: 34px;
}

#editable, input#title, h2 {
	margin-left: 30px;
}

input#title {
	margin-top: 30px;
}

.btn-group {
	margin: 30px 0;
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

.body .main_header {
	padding-bottom: 0;
}

.cke_contents {
	min-height: 400px;
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
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<div class="header">
				<h1 style="color: #343a40; padding-left: 32px">코스 작성</h1>
			</div>
			<form
				action="${pageContext.request.contextPath}/commPage/comm_myCourseWriteOk.do"
				method="post">
				<div class="row">
					<div class="col-md-6">
						<label for="mycourse_name" class="control-label categorydiv">코스
							선택</label> <select class="form-control" name="mycourse_name"
							id="course_name"
							style="display: inline-block; width: 80%; margin-left: 10px; margin-top: 3px">
							<option value="">코스를 선택해주세요.</option>
							<c:forEach var="courseName" items="${courseName}"
								varStatus="status">
								<option value="${courseName.course_name }">${courseName.course_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="col-md-6">
						<label for="mycourse_area" class="control-label categorydiv">지역
							선택</label> <select class="form-control" id="mycourse_area"
							name="mycourse_area"
							style="display: inline-block; width: 80%; margin-left: 10px; margin-top: 3px">
							<option value="">지역</option>
							<option value="전체">전체</option>
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
				</div>
				<br>
				<div class="map" id="map" style="width: 100%; height: 250px;"></div>

				<textarea name="mycourse_content" id="mycourse_content" class="ckeditor"></textarea>

				<div class="btn-group pull-right">
					<a id="btn_cancel" type="button"
						href="${pageContext.request.contextPath}/commPage/comm_myCourse.do"
						class="btn btn-warning">취소</a>
					<input type="submit" value="작성완료" class="btn btn-primary"/>
				</div>
			</form>
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	b6b1199a25d6406101fb441c0afa0e00&libraries=services,clusterer,drawing"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/myCourseWrite-js.js"></script>

	<!-- // js -->
</body>
</html>