<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style type="text/css">
.categorydiv {
	height: 34px;
	padding-top: 7px;
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<h1 class="page-header">1:1 문의</h1>
			<form class="form-group col-md-10 col-md-offset-1" action="${pageContext.request.contextPath}/myPage/myPage_inquiry.do">
				<div class="row">
					<div class="col-md-6">
						<label for="inq_title" class="col-md-3">제목:</label>
						<div class="col-md-9">
							<input type="text" name="inq_title" class="form-control"
								name="inq_title">
						</div>
					</div>
					<div class="col-md-6">
						<label for="inq_cateory" class="col-md-3 control-label categorydiv">카테고리</label>
						<div class="col-md-4">
							<select class="form-control" id="inq_cateory" name="inq_cateory">
								<option value="">category</option>
								<option value="walk">걷기</option>
								<option value="cas">문화체육</option>
								<option value="bicycle">자전거</option>
								<option value="community">커뮤니티</option>
							</select>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<label for="inq_content" class="col-md-3">내용</label>
						<textarea class="form-control" id="inq_content" name="inq_content"
							style="min-height: 500px; resize: none"></textarea>
					</div>
				</div>
				<br>
				<div class="pull-left">
					<a href="${pageContext.request.contextPath}/myPage/myPage_inquiry.do" class="btn btn-info">목록</a>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-info">작성완료</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>
</body>
</html>