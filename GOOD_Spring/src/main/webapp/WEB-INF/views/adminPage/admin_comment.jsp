<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style type="text/css">

.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
}
</style>
</head>

<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<div class="container" style="margin-bottom: 10px;">
<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../adminPage/admin_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<div class="header" style="margin-bottom: 50px;">

				<h2 style="text-align: center;">코스 상세 페이지</h2>

			</div>


			<div class="row">

				<div class="pull-left">
					<div class="map" id="map" style="width: 550px; height: 520px;"></div>
				</div>

				<div class="pull-left"
					style="margin-left: 30px; font-size: 30px; color: blue;">
					지역 :<span style="font-size: 25px; color: black;"> 서초구</span> <br />
					<br /> 거리 : <span style="font-size: 25px; color: black;">
						5KM</span> <br /> <br /> 소요시간 : <span
						style="font-size: 25px; color: black;"> 3시간</span> <br /> <br />
					난이도 : <span style="font-size: 25px; color: black;"> Hell</span> <br />
					<br /> 코스 상세정보 :
					<div class="admin_content "
						style="border: 1px solid #eee; width: 550px; height: auto; line-height: auto; padding: 3px; color: red !important;">
						<textarea class="form-control" rows="2"
							style="width: 550px; font-size: 20px; resize: none;"
							placeholder="내용을 입력해주세요."></textarea>

					</div>
					<p
						style="font-size: 25px; color: black; width: 550px; height: auto; line-height: auto;">
						여기가 코스 상세 정보 내용 입니다.여기가 코스 상세 정보 내용 입니다.여기가 코스 상세 정보 내용 입니다.여기가 코스
						상세 정보 내용 입니다. 여기가 코스 상세 정보 내용 입니다.여기가 코스 상세 정보 내용 입니다.</p>
				</div>


				<div class="pull-left"
					style="margin-top:25px ; font-size: 30px; color: blue;">교통편 :
					<span style="font-size: 25px; color: black;">버스타고 내려서
						걸어가 버스타고 내려서 걸어가 버스타고 내려서 걸어가 </span> <br /> <br /> 
				세부코스 :<span style="font-size: 25px; color: black;">버스타고 내려서
						걸어가 버스타고 내려서 걸어가 버스타고 내려서 걸어가 </span> <br /> <br /> 

				</div>




			</div>

			<hr />

		</div>

		<!-- 버튼 -->
		<div class="btn_container" style="text-align: center;">
			<button class="btn btn-danger" type="submit"
				style="width: 150px; margin-top: 50px; margin-bottom: 80px; margin-right: 50px; border: 0; outline: 0;">
				<span style="font-size: 20px;">수정 취소</span>
			</button>


			<button class="heart btn btn-success"
				style="font-size: 20px; width: 150px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
				수정 완료</button>
		</div>

		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
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
		
	</script>



</body>
</html>