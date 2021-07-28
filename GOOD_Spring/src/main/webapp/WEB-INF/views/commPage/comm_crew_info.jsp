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

<style type="text/css">
.title-img>img {
	width: 200px;
	height: 100px;
}

#crew_middle {
	padding-left: 40px;
}

.col-md-8 {
	margin-left: 40px;
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

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}
</style>
</head>
<body>
	<div class="wrapper">

		<!-- 상단영역 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img
						src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">${output.crew_name} 크루를 소개합니다</h1>
			<!-- 본문 상단 영역 -->
			<div class="crew_info_header col-md-12 "></div>
			<!-- //본문 상단 영역 -->
			<!-- 본문 중단 영역 -->
			<div class="crew_info_middle">
				<div class="col-md-3" id="crew_middle">
					<div class="form-group">
						<span class="title-img"><img
							src="${output.crew_photo.fileUrl}"> <span class='sr-only'>이미지</span>
						</span>
						<h5>가입된 회원 수 : ${output.crew_member}</h5>
						<h3 class="title-name">${output.crew_name} 크루 소개</h3>
						<p>${output.crew_sinto}</p>
					</div>
				</div>
				<!-- 크루 상세 정보  -->
				<div class="col-md-8">
					<h2>${output.crew_name} &nbsp 크루 정보</h2>
					<p>${output.crew_dinto}</p>
				</div>
				<!-- 크루 상세 정보 끝 -->

			</div>
			<!--// 본문 중단 영역 -->
			<!-- 본문 하단 영역 -->



			<div class="crew_info_footer">
				<div class="col-md-12">
					<div class="text-center">
						<form class="form-horizontal" role="form" class="form-crew" id='crew_form'
							method="get"
							action="${pageContext.request.contextPath}/commPage/comm_crew_info_ok.do">
							<input type="hidden" name="crew_no" value="${output.crew_no}">
							<button type='submit' id="join" class="btn btn-primary">가입하기</button>
							<button type="reset" class="btn btn-info"
								onClick="location.href='${pageContext.request.contextPath}/commPage/comm_crew.do'">목록</button>
						</form>
					</div>
					<hr />
				</div>

			</div>
			<!--// 본문 하단 영역 -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>

	<script>
	$().ready(function(){
		
		$("#join").click(function() {
			event.preventDefault();
			 // prevent form submit
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "해당 크루에 가입을 하시겠습니까?", // 내용
				type : 'question', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오' // 취소버튼 표시 문구
				
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					$('#crew_form').submit();
				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '가입이 취소되었습니다.', 'error');
				}

			});
			
		});
	});
	</script>


</body>
</html>