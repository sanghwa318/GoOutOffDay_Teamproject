<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">

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
			<div class="col-md-10 col-md-offset-1">
				<h2>문의글 목록</h2>
				<table class="table table-bordered">
					<thead>
						<tr class="active">
							<th class="text-center">#</th>
							<th class="text-center">상태</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">제목</th>
						</tr>
					</thead>
					<tbody id="list">
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">답변완료</td>
							<td class="text-center">걷기</td>
							<td class="text-center"><a href="${pageContext.request.contextPath}/myPage/myPage_inquiryDetail.jsp">코스등록
									문의 드립니다.</a></td>
						</tr>
						<tr>
							<td class="text-center">2</td>
							<td class="text-center">답변중</td>
							<td class="text-center">문화/체육</td>
							<td class="text-center"><a href="${pageContext.request.contextPath}/myPage/myPage_inquiryDetail.jsp">행사정보가
									잘못되었습니다.</a></td>
						</tr>
						<tr>
							<td class="text-center">3</td>
							<td class="text-center">답변중</td>
							<td class="text-center">걷기</td>
							<td class="text-center"><a href="${pageContext.request.contextPath}/myPage/myPage_inquiryDetail.jsp">코스등록
									문의 드립니다.</a></td>
						</tr>
					</tbody>
				</table>
				<a type="button" class="btn btn-primary pull-right" href="${pageContext.request.contextPath}/myPage/myPage_inquiryWrite.jsp">작성하기</a>
			</div>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>

	<script type="text/x-handlebars-template" id="list-item-tmpl">
		{{#array.data}}
       				 <tr>	
						<td class="text-center">{{number}}</td>
						<td class="text-center">{{status}}</td>
						<td class="text-center">{{category}}</td>
						<td class="text-center">{{title}}</td>
					</tr>
		{{/array.data}}
    </script>
	<script type="text/javascript">
		function get_list() {
			// 미리 준비한 HTML틀을 읽어온다.
			var template = Handlebars.compile($("#list-item-tmpl").html());
			var html = template(content);
			// #list에 읽어온 내용을 추가한다.
			$("#list").append(html);
			if ('#list' == null) {
				$("#list").append(html);
			}
		};

		$(function() {
			get_list();

		});
	</script>
</body>
</html>