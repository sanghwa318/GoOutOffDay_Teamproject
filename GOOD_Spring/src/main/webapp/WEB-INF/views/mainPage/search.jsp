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
.pagination {
	justify-content: center;
}

body>div.container {
	min-height: 700px;
}

#list {
	min-height: 600px;
}

.media-body>.lead {
	margin-bottom: 0;
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>

		<!-- 본문 영역 -->
		<div class="container">
			<h1 class="page-header">통합검색</h1>
			<div id="list"></div>
			<!-- 검색결과 없으면 페이지 네이션 숨김 기능 필요. -->
			<div class="text-center">
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
	</div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/x-handlebars-template" id="list-item-tmpl">
	{{#arr.data}}
        <div class="media">
			<!-- 내용영역 -->
			<div class="media-body">
				<!-- 내용의 제목 -->
				<h2 class="media-heading"><a href="#">{{title}}</a></h2>
				<!-- 내용 -->
				<p class="lead">{{content}}</p>
			</div>
		</div>
<hr>
	{{/arr.data}}
    </script>

	<script src="data.js"></script>
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