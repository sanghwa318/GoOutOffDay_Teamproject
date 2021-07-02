<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">

#inq>.jumbotron {
	min-height: 500px;
	box-shadow: none;
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
			<div id="inq">
				<h2>회원 문의</h2>
				<div class="jumbotron">
					<p>질문 내용</p>
				</div>
			</div>
			<div id="ans">
				<h2>관리자 답변</h2>
				<div class="jumbotron">
					<p>답변내용</p>
				</div>
			</div>
			<a type="button" class="pull-left btn btn-default"
				href="myPage_inquiry.jsp" style="width: 75px; margin-bottom:50px;">목록</a>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>

	<script type="text/x-handlebars-template" id="inq">
		{{#array.data}}
				<h2>{{title}}</h2>
				<div class="jumbotron">
					<p>{{content}}</p>
				</div>
		{{/array.data}}
    </script>
    <script type="text/x-handlebars-template" id="ans">
		{{#array.data}}
				<h2>{{title}}</h2>
				<div class="jumbotron">
					<p>{{content}}</p>
				</div>
		{{/array.data}}
    </script>
	<script type="text/javascript">
		function get_inqItem() {
			// 미리 준비한 HTML틀을 읽어온다.
			var template = Handlebars.compile($("#inq-tmpl").html());
			var html = template(content);
			// #list에 읽어온 내용을 추가한다.
			$("#inq").append(html);
			if ('#inq' == null) {
				$("#inq").append(html);
			}
		};
		function get_ansItem() {
			// 미리 준비한 HTML틀을 읽어온다.
			var template = Handlebars.compile($("#ans-tmpl").html());
			var html = template(content);
			// #list에 읽어온 내용을 추가한다.
			$("#ans").append(html);
			if ('#ans' == null) {
				$("#ans").append(html);
			}
		};
	</script>
</body>
</html>