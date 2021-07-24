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
<link
	href="../plugins/drag-drop-image-uploader/dist/image-uploader.min.css"
	rel="stylesheet">

<style>
.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}

.main_header>h1:hover {
	transform: translate(0, -10px);
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}

.title-img>img {
	width: 100px;
	height: 100px;
}

.product-item {
	padding-top: 0;
}

.out {
	padding-bottom: 30px;
}

.page-header button {
	float: right;
}

.thumbnail img {
	max-hieght: 100%;
	min-width: 100%;
	height: 180px;
}

.pagination {
	margin-top: -100px;
}
</style>
</head>

<body>
	<!-- [페이지네이션] -->
	<c:set var="URL" value="/commPage/comm_crew_myCrew.do" />
	<!-- //[페이지네이션] -->
	<div class="wrapper">

		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 본문 영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">
				마이크루
				<!-- 탈퇴버튼 -->
				<button type='submit' id="out" class="btn btn-danger">탈퇴하기</button>
			</h1>


			<!-- 마이크루 본문영역 중단 -->
			<div class="crew_middle">
				<div class="best">

					<c:choose>

						<%--조회결과가 없는 경우 --%>
						<c:when test="${output==null || fn:length(output) == 0} ">
							<div class="null">
								<div align="center">조회결과가 없습니다.</div>
							</div>
						</c:when>

						<%--조회결과가 있는 경우  --%>
						<c:otherwise>
							<%-- 조회 결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}" varStatus="status">
								<%-- 출력을 위해 준비한 크루이름 변수  --%>
								<c:set var="crew_name" value="${item.crew_name}" />


								<%-- 상세페이지로 이동하기위한 URL --%>
								<c:url value="/commPage/comm_crew_bbs.do" var="bbsUrl">
									<c:param name="crew_no" value="${item.crew_no}" />
								</c:url>

								<div class="col-xs-6 col-sm-4 col-md-3">
									<div class="thumbnail item" onclick="location.href='${bbsUrl}'"
										style="cursor: pointer;">
										<img alt="크루 이미지" src="${item.crew_photo.fileUrl}"
											onclick="location.href='${bbsUrl}'" style="cursor: pointer;">
										<div class="caption clearfix">
											<p>
												<a href="${bbsUrl}">크루 이름: ${item.crew_name}</a>
											</p>
											<h4>크루 소개: ${item.crew_sinto}</h4>
											<p class="pull-left">지역: ${item.crew_area}</p>
										</div>

									</div>
								</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<!-- 페이지네이션 -->
					<%@ include file="../inc/pagenation.jsp"%>
					<!-- //페이지네이션 -->
				</div>

			</div>
			<!-- 본문하단 끝 -->
		</div>

	</div>




	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
	<script>
		$("#out").click(function() {
			const delcrew = [];
			const obj = $(".del:checked");

			if (obj.length < 1) {
				swal('알림', '선택된 크루가 없습니다.');
				return false;
			}
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "해당 크루에서 탈퇴 하시겠습니까?", // 내용
				type : 'question', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					swal('성공', '탈퇴되었습니다.', 'success');
					setTimeout(function() {
						location.href = '../commPage/comm_crew_myCrew.jsp';
					}, 1000);

				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '탈퇴가 취소되었습니다.', 'error');
				}

			});
		});
	</script>
</body>
</html>