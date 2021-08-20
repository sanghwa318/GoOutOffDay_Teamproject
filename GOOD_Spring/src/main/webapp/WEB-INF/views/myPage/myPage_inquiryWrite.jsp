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
			<form class="form-group col-md-12 col-md-offset-1">
				<div class="row">
					<div class="col-md-8">
						<label for="QnA_title">제목</label> <input type="text"
							id="QnA_title" class="form-control" name="QnA_title"
							style="display: inline-block; width: 90%; margin-left: 10px">
					</div>
					<div class="col-md-4">
						<label for="QnA_category" class="control-label categorydiv">카테고리</label>
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
				<textarea name="QnA_text" id="QnA_text" class="ckeditor"></textarea>

				<br>
				<div class="pull-left">
					<a
						href="${pageContext.request.contextPath}/myPage/myPage_inquiry.do"
						class="btn btn-info">목록</a>
				</div>
				<div class="pull-right">
					<button type="submit" id="write-btn" class="btn btn-info">작성완료</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script src="//cdn.ckeditor.com/4.12.1/basic/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
	$('#write-btn').click(function(e){
		e.preventDefault();
		let QnA_title=$('#QnA_title').val();
		let QnA_category=$('#QnA_category option:selected').val();
		let QnA_text=CKEDITOR.instances['QnA_text'].getData()
			
				$.ajax({
					url: getContextPath()+'/myPage/myPage_inquiryWrite_ok',
					dataType: 'json',
					method:'post',
					data: {QnA_title, QnA_category, QnA_text},
					success: function(data) {
						swal("성공", "작성되었습니다.", "success").then(function(){
						window.location.href= getContextPath()+"/myPage/myPage_inquiryDetail.do"
						+ "?QnA_no=" + data.output.QnA_no;
						})
					},error: function(data, status, error){
						
					var error_msg =data.responseJSON.rt
						swal({
							title : "에러",
							text :error_msg,
							type : "error"
						})
						return false; // <-- 실행 중단
					}
				})
			})
})

</script>
</body>
</html>