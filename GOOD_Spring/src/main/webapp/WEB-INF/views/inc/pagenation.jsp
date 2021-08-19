<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 페이지네이션 -->
<div class="text-center">
	<!-- 페이지 번호 구현 -->
	<ul class="pagination">
		<%-- 이전 그룹에 대한 링크 --%>
		<c:choose>
			<%-- 이전 그룹으로 이동 가능하다면? --%>
			<c:when test="${pageData.prevPage > 0}">
				<%-- 이동할 URL 생성 --%>
				<c:url value="${getList }" var="prevPageUrl">
					<c:param name="keyword" value="${keyword}" />
					<c:param name="page" value="${pageData.prevPage}" />
				</c:url>
				<li class="page-item"><a href="${prevPageUrl}">&laquo;</a></li>
			</c:when>
		</c:choose>

		<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
		<c:forEach var="i" begin="${pageData.startPage}"
			end="${pageData.endPage}" varStatus="status">
			<%-- 이동할 URL 생성 --%>
			<c:url value="${getList }" var="pageUrl">
				<c:param name="page" value="${i}" />
				<c:param name="keyword" value="${keyword}" />
			</c:url>

			<%-- 페이지 번호 출력 --%>
			<c:choose>
				<%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
				<c:when test="${pageData.nowPage == i}">
					<li class="page-item active"><span style="color: #fff;">${i}<span
							class="sr-only">(current)</span></span></li>
				</c:when>
				<%-- 나머지 페이지의 경우 링크 적용함 --%>
				<c:otherwise>
					<li class="page-item"><a href="${pageUrl}">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<%-- 다음 그룹에 대한 링크 --%>
		<c:choose>
			<%-- 다음 그룹으로 이동 가능하다면? --%>
			<c:when test="${pageData.nextPage > 0}">
				<%-- 이동할 URL 생성 --%>
				<c:url value="${getList }" var="nextPageUrl">
					<c:param name="page" value="${pageData.nextPage}" />
					<c:param name="keyword" value="${keyword}" />
				</c:url>
				<li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
			</c:when>
		</c:choose>
	</ul>
</div>
<!-- //페이지네이션 -->


