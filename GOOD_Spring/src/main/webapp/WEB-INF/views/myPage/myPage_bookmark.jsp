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
<style type="text/css">
.bookItem {
	position: relative;
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 0;
	margin-bottom: 20px;
	display: inline-block;
}

.bookItem .thumbnail {
	height: 180px;
	width: 180px;
	vertical-align: middle;
	float: left;
	margin-bottom: 0;
	border: 0;
}

.bookItem .thumbnail>img {
	max-height: 100%;
	max-width: 100%;
	min-height: 100%;
	min-width: 100%;
}

.bookItem .caption {
	height: 180px;
	padding: 15px 10px 15px 10px;
	vertical-align: middle;
	width: calc(100% - 208px);
	float: left;
	border-left: 1px solid #ddd;
}

.caption p {
	color: #495056;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.caption h4 {
	color: #495056;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

.bookItem .btn_container {
	position: absolute;
	top: 5px;
	right: 5px;
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
			<div class="row bookmark">
				<c:forEach var="item" items="${output}">
					<div class="col-xs-12 col-md-12 col-lg-9 bookItem">
						<c:url value="/casPage/cas_detail.do" var="detailUrl">
							<c:param name="SVCID" value="${item.SVCID }" />
						</c:url>
						<div class="thumbnail">
							<img alt="썸네일 이미지" src="${item.IMGURL}"
								onclick="location.href='${detailUrl}'" style="cursor: pointer;">
						</div>
						<div class="caption clearfix">
							<p>카테고리 : ${item.category_id}</p>
							<h4>서비스이름 : ${item.SVCNM }</h4>
							<p>장소 : ${item.AREANM}</p>
							<p>이용시간 : ${item.VMIN }~${item.VMAX }</p>
							<p class="pull-left">대상연령 : ${item.USETGTINFO }</p>
							<p class="pull-right">이용요금 : ${item.PAYATNM }</p>
						</div>
						<div class="btn_container">
							<button class="heart btn btn-warning liked" type="button"
								style="width: 80px; font-size: 18px;">
								<i class="fa fa-heart" aria-hidden="true" role="button"
									style="padding-right: 5px; font-size: 18px;"></i>찜제거
							</button>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
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