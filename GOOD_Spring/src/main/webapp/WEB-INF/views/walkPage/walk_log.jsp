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
</head>
<style>
.footer {
	margin-top: 50px;
}

h2 {
	text-align: center;
}

.jumbotron {
	margin-top: 20px;
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
	<div class="wrapper">
		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->

		<div class="container">
			<!-- 컨테이너 -->
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/walkPage/walk_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">걷기<img src="${pageContext.request.contextPath}/assets/icon_img/걷기 아이콘.png;"
						style="width: 44px; height: 44px; position: relative; bottom: 5px;"></img>
					</span>
				</h1>
			</div>
			<div class="page-header">
				<h1>걷기Log</h1>
			</div>
			<!-- walk_log 하위 페이지 목록 -->
			<ul class="nav nav-pills" role="navigation">
				<li class="tabmenu active" id="log_tab1"><a data-toggle="tab"
					role="button">내 기록</a></li>
				<li class="tabmenu" id="log_tab2"><a data-toggle="tab"
					role="button">기록 비교</a></li>
				<li class="tabmenu" id="log_tab3"><a data-toggle="tab"
					role="button">목표 설정</a></li>
			</ul>
			<!-- 하위페이지 표시 영역 -->
			<div id="result">
			</div>
		</div>

		<!-- //컨테이너 -->
	</div>
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->

	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->


</body>

<script type="text/javascript">
function getContextPath() {
    var hostIndex = location.href.indexOf(location.host)
          + location.host.length;
    var contextPath = location.href.substring(hostIndex, location.href
          .indexOf('/', hostIndex + 1));
    return contextPath;
 }
	$(function() {
		$.get(getContextPath()+'/walkPage/walk_myLog.do', function(req) {

			$('#result').html(req);
		}, 'html');

		$("#log_tab1").click(function(e) {
			// e.preventDefault();

			$.get(getContextPath()+'/walkPage/walk_myLog.do', function(req) {

				$('#result').html(req);
			}, 'html');
		});
		$("#log_tab2").click(function(e) {
			// e.preventDefault();

			$.get(getContextPath()+'/walkPage/walk_logCompare.do', function(req) {

				$('#result').html(req);
			}, 'html');
		});
		$("#log_tab3").click(function(e) {
			// e.preventDefault();

			$.get(getContextPath()+'/walkPage/walk_logSetGoal.do', function(req) {

				$('#result').html(req);
			}, 'html');
		});

	});
</script>

</html>