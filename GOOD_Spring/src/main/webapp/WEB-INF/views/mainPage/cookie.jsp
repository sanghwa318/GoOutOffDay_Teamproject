<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<%-- <%@ include file="../inc/head.jsp"%> --%>
</head>

<body>
   <!-- 푸터빼고 감싸주세요 -->
   <div class="wrapper">
      <!-- 공통 헤더 -->
   <%--    <%@ include file="../inc/Header.jsp"%> --%>
      <!-- //공통 헤더 -->
      <!-- 컨테이너 -->
      <!-- 페이지 소개 안내 팝업 -->
	<!-- 이젠 팝업 공지 -->
	<div id='ezen2021-05-notice-popup'
		style='position: absolute; left: 50%; top: 50%; padding: 30px 50px; margin-left: -215px; margin-top: -250px; background-color: rgb(43, 43, 43); color: #fff; font-size: 14px; width: 400px; z-index: 9999999;'>
		<h1
			style='border-bottom: 1px solid #eee; font-size: 1.5rem; color: #fff;'>빅
			데이터8기 5조 취업용 웹 사이트 입니다.</h1>
		<p style='color: #fff;'>이 사이트는 "빅데이터 8기 5조"에서 제작한 웹 사이트입니다.</p>
		<p style='color: #fff;'>실제 운영을 위한 사이트가 아님에 착오 없으시기 바랍니다.</p>
		<p>
			<a href="../mainPage/introduce.jsp" target="_blank"
				style='color: #fff; display: inline'>GOOD 웹 페이지 이용 방법 안내
				이동하기☜(클릭)</a>
		</p>
		<p>
			<a href='#' style='color: white'
				onclick="document.cookie = 'ezenPopup=Y;path=/'; $('#ezen2021-05-notice-popup').hide()">[다시보지않음]</a>
		</p>
	</div>

      <!-- //컨테이너 -->
   </div>
   <!-- //푸터빼고 감싸주세요 -->
   <!-- 공통 푸터 -->
<%--    <%@ include file="../inc/Footer.jsp"%> --%>
   <!-- //공통 푸터 -->
   <!-- js -->
<%--    <%@ include file="../inc/plugin.jsp"%> --%>
   <!-- // js -->
</body>
</html>