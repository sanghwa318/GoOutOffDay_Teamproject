<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link rel="stylesheet" href="../plugins/sweetalert/sweetalert2.min.css" />
<style>
.media .media-body {
	padding: 0 30px;
}

.media-body > h3:first-child {
	margin-top: 0;
}
</style>

</head>

<body>
	<div class="wrapper">
		<%@ include file="../inc/Header.jsp"%>

		<div class="container">
			<div class="header header_p text-center" style="margin-bottom: 50px;">
				<h2>찜한 목록</h2>
			</div>
			<div class="media"
				style="padding: 0px; margin-top: 30px; margin-bottom: -80px;">
				<a class="pull-left" href="#"><img class="media-object"
					src="img" style="width: 250px; height: 250px;"></a>
				<div class="media-body">
					<h3>카테고리 : 걷기코스</h3>
					<h3>코스명 :</h3>
					<h3>지역 :</h3>
					<h3>거리 :</h3>
					<h3>예상소요시간 :</h3>
					<h3>난이도 :</h3>
				</div>
				<div class="btn_container"
					style="text-align: center; margin-top: -35px;">
					<button class="heart btn btn-warning"
						style="font-size: 20px; width: 150px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
						<i class="fa fa-heart" aria-hidden="true" role="button"
							style="padding-right: 5px;"></i> 찜하기 취소
					</button>
				</div>
			</div>
			<hr />
			<div class="media"
				style="padding: 0px; margin-top: 30px; margin-bottom: -80px;">
				<a class="pull-left" href="#"><img class="media-object"
					src="img" style="width: 250px; height: 250px;"></a>
				<div class="media-body">
					<h3>카테고리 : 걷기코스</h3>
					<h3>코스명 :</h3>
					<h3>지역 :</h3>
					<h3>거리 :</h3>
					<h3>예상소요시간 :</h3>
					<h3>난이도 :</h3>
				</div>
				<div class="btn_container"
					style="text-align: center; margin-top: -35px;">
					<button class="heart btn btn-warning"
						style="font-size: 20px; width: 150px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
						<i class="fa fa-heart" aria-hidden="true" role="button"
							style="padding-right: 5px;"></i> 찜하기 취소
					</button>
				</div>
			</div>
			<hr />
			<div class="media"
				style="padding: 0px; margin-top: 30px; margin-bottom: -80px;">
				<a class="pull-left" href="#"><img class="media-object"
					src="img" style="width: 250px; height: 250px;"></a>
				<div class="media-body">
					<h3>카테고리 : 공연 전시 문화</h3>
					<h3>태그 : 공연</h3>
					<h3>제목 :</h3>
					<h3>간단설명 :</h3>
					<h3>장소 :</h3>
					<h3>서비스상태 :</h3>
				</div>
				<div class="btn_container"
					style="text-align: center; margin-top: -35px;">
					<button class="heart btn btn-warning"
						style="font-size: 20px; width: 150px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
						<i class="fa fa-heart" aria-hidden="true" role="button"
							style="padding-right: 5px;"></i> 찜하기 취소
					</button>

				</div>
			</div>
			<hr />

			<div class="media"
				style="padding: 0px; margin-top: 30px; margin-bottom: -80px;">
				<a class="pull-left" href="#"><img class="media-object"
					src="img" style="width: 250px; height: 250px;"></a>
				<div class="media-body">
					<h3>카테고리 : 공연 전시 문화</h3>
					<h3>태그 : 전시</h3>
					<h3>제목 :</h3>
					<h3>간단설명 :</h3>
					<h3>장소 :</h3>
					<h3>서비스상태 :</h3>
				</div>
				<div class="btn_container"
					style="text-align: center; margin-top: -35px;">
					<button class="heart btn btn-warning"
						style="font-size: 20px; width: 150px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
						<i class="fa fa-heart" aria-hidden="true" role="button"
							style="padding-right: 5px;"></i> 찜하기 취소
					</button>

				</div>
			</div>
			<hr />

			<!-- 페이지네이션 -->

			<div class="container text-center">
				<ul class="pagination pagination-lg">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><span>1<span class="sr-only">(current)</span></span></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>

			</div>

		</div>





	</div>


	<%@ include file="../inc/Footer.jsp"%>

	<%@ include file="../inc/plugin.jsp"%>

	<!-- 카카오 맵 -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	b6b1199a25d6406101fb441c0afa0e00&libraries=services,clusterer,drawing"></script>
	<!-- 카카오 맵 -->
	<script type="text/javascript">
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
	<script>
		// 하트
		$(".heart")
				.on(
						"click",
						function() {
							if ($(this).hasClass("liked")) {
								$(this)
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기 취소');
								$(this).removeClass("liked");
							} else {
								$(this)
										.html(
												'<i class="fa fa-heart" aria-hidden="true" style="padding-right:5px;"></i> 찜하기 취소');
								$(this).addClass("liked");
							}
					          swal({
					              title: '확인',                // 제목
					              text: "정말 취소를 하시겠습니까?",  // 내용
					              type: 'warning',              // 종류
					              confirmButtonText: '네',     // 확인버튼 표시 문구
					              showCancelButton: true,       // 취소버튼 표시 여부
					              cancelButtonText: '아니오',       // 취소버튼 표시 문구
					          }).then(function(result) {        // 버튼이 눌러졌을 경우의 콜백 연결
					              if (result.value) {           // 확인 버튼이 눌러진 경우
					                  swal('찜하기 취소', '찜하기가 취소되었습니다.', 'success');
					                  setTimeout(function() {
					                	  location.href='../myPage/myPage_bookmark.jsp';
										}, 1000);
					                  
					              } 
					       
					          });
						});
	</script>
	<!-- //하트 -->

</body>
</html>