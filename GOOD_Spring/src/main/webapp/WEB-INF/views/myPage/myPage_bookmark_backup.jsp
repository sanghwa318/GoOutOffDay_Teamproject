<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<link rel="stylesheet" href="../plugins/sweetalert/sweetalert2.min.css" />
<style>
.media .media-body {
	padding: 0 30px;
}

.media-body>h3:first-child {
	margin-top: 0;
}
</style>

</head>

<body>
	<div class="wrapper">
		<!-- 상단영역 시작 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 상단영역 끝 -->
		<div class="container">
			<div class="header header_p text-center" style="margin-bottom: 50px;">
				<h2>찜한 목록</h2>
			</div>
			<c:forEach var="item" items="${output}">
				<div class="media"
					style="padding: 0px; margin-top: 30px; margin-bottom: -80px;">
					<a class="pull-left" href="#"><img class="media-object"
						src="${item.IMGURL}" style="width: 250px; height: 250px;"></a>
					<div class="media-body">
						<h3>카테고리 : ${item.category_id}</h3>
						<h3>서비스이름 : ${item.SVCNM }</h3>
						<h3>장소 : ${item.AREANM}</h3>
						<h3>이용시간 : ${item.VMIN }~${item.VMAX }</h3>
						<h3>대상연령 : ${item.USETGTINFO }</h3>
						<h3>이용요금 : ${item.PAYATNM }</h3>
					</div>
					<div class="btn_container"
						style="text-align: center; margin-top: -35px;">
						<button class="heart btn btn-warning liked"
							value="${item.category_id}" data-value="${item.service_id}"
							style="font-size: 20px; width: 150px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
							<i class="fa fa-heart" aria-hidden="true" role="button"
								style="padding-right: 5px;"></i> 찜 제거
						</button>
					</div>
				</div>
				<hr />
			</c:forEach>
			<!-- 페이지 번호 구현 -->
			<div class="text-center">
				<%-- 이전 그룹에 대한 링크 --%>
				<ul class="pagination">
					<c:choose>
						<%-- 이전 그룹으로 이동 가능하다면? --%>
						<c:when test="${pageData.prevPage > 0}">
							<%-- 이동할 URL 생성 --%>
							<c:url value="${getList }" var="prevPageUrl">
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
							<c:url value="/myPage/myPage_bookmark.do" var="nextPageUrl">
								<c:param name="page" value="${pageData.nextPage}" />
							</c:url>
							<li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>

		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript">
	/**
	 * 찜목록 추가제거 (김도운)
	 */
	// 하트
	$(".heart")
		.on(
			"click",
			function() {
				if ($(this).hasClass("liked")) {
					var catid = $(this).attr('value');
					var svcid = $(this).data('value');
					var heart = $(this);
					swal({
						title: '확인',
						text: "찜목록에서 제거할까요?",
						type: 'question',
						confirmButtonText: '네',
						showCancelButton: true,
						cancelButtonText: '아니요',
					})
						.then(
							function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
								if (result.value) { // 확인 버튼이 눌러진 경우
									$.ajax({
										cache: false,
										url: getContextPath() + '/casPage/BookMark',
										type: 'POST',
										dataType: 'json',
										data: { catid, svcid },
										timeout: 10000,
										success: function(req) {

											console.log("삭제 성공 >> " + req);
											swal(
												'성공',
												'찜목록에서 제거되었습니다.',
												'success').then(function (result) {
												location.reload();
												}), {
												buttons: {
													confirm: {
														text: '닫기',
														value: true,
														className: 'btn btn-outline-primary'
													}
												}
											}
											setTimeout(function() {
											}, 1000);
										},
										error: function(error) {
											console.log("에러 >> " + error.status);
											swal('주의', '찜목록에 제거하기가 실패했습니다.', 'warning'), {
												closeOnClickOutside: false,
												closeOnEsc: false,
												buttons: {
													confirm: {
														text: '닫기',
														value: true,
														className: 'btn btn-outline-primary'
													}
												}
											}
										}
									})

								} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
									swal(
										'취소',
										'제거가 취소되었습니다.',
										'error');
							}
					});
				} 
			});
	</script>
</body>
</html>