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

.cke_contents {
	min-height: 400px;
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
			<form class="form-group col-md-10 col-md-offset-1"
				action="${pageContext.request.contextPath}/myPage/myPage_inquiryWrite_ok"
				method="post">
				<div class="row">
					<div class="col-md-8">
						<label for="QnA_title">제목</label> <input type="text"
							name="QnA_title" class="form-control" name="QnA_title"
							style="display: inline-block; width: 90%; margin-left: 10px">
					</div>
					<div class="col-md-4">
						<label for="inq_cateory" class="control-label categorydiv">카테고리</label>
						<select class="form-control" id="QnA_category" name="QnA_category"
							style="display: inline-block; width: 75%; margin-left: 10px; margin-top: 3px">
							<option value="">category</option>
							<option value="걷기">걷기</option>
							<option value="문화체육">문화체육</option>
							<option value="자전거">자전거</option>
							<option value="커뮤니티">커뮤니티</option>
						</select>
					</div>
				</div>
				<br>
				<textarea name="QnA_text" class="ckeditor"></textarea>

				<br>
				<div class="pull-left">
					<a
						href="${pageContext.request.contextPath}/myPage/myPage_inquiry.do"
						class="btn btn-info">목록</a>
				</div>
				<div class="pull-right">
					<button type="submit" class="btn btn-info">작성완료</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>
	<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>

</body>
</html>