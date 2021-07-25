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

<style>
/*찜하기 버튼*/
.fa-heart-o {
	color: red;
	cursor: pointer;
}

.fa-heart {
	color: red;
	cursor: pointer;
}

.detail_map {
	padding-left: 20px;
}

.admin_content {
	padding-left: 20px;
}

ul, li {
	list-style: none;
}

.info li {
	border: 1px solid #eee;
	padding: 17px 20px 20px 10px;
	border-bottom: 1px solid #ddd;
}

.info p {
	font-size: 25px;
	display: inline;
}

.info strong {
	font-size: 25px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<%@ include file="../inc/Header.jsp"%>

		<div class="row">
			<div class="container" style="margin-bottom: 10px;">
				<div class="header" style="margin-bottom: 50px;">
					<h1 style="text-align: center;">${output.COURSE_NAME} > 
						${output.CPI_NAME }</h1>
					<h3 style="text-align: right;">추천수: ${output.VOTE_CNT }</h3>
				</div>


				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="detail_map">
							<div class="map" id="map" style="width: 500px; height: 520px;"></div>

						</div>

						<!-- 버튼 -->
						<div class="btn_container"
							style="text-align: center; margin-left: -50px;">

							<button class="btn btn-info" type="submit"
								style="font-size: 20px; width: 140px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
								<span style="font-size: 20px;"><i
									class="glyphicon glyphicon-arrow-right"
									style="padding-right: 5px;"></i> 위치 안내</span>
							</button>
							<button class="heart btn btn-success"
								style="font-size: 20px; width: 140px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
								<i class="fa fa-heart-o" aria-hidden="true" role="button"
									style="padding-right: 5px;"></i> 찜하기
							</button>

						</div>
					</div>


					<!-- 123 -->
					<div class="col-md-6 col-sm-12 col-xs-12 main_info">
						<ul class="info">
							<li class="infoItem"><strong class="infoLabel">포인트
									설명 :</strong>
								<p class="infoText">${output.CPI_CONTENT }</p></li>
							<li class="infoItem"><strong class="infoLabel">지역 :</strong>
								<p class="infoText">${output.AREA_GU }</p></li>
							<li class="infoItem"><strong class="infoLabel">거리 :
							</strong>
								<p class="infoText">${output.DISTANCE }</p></li>
							<li class="infoItem"><strong class="infoLabel">소요시간
									: </strong>
								<p class="infoText">${output.LEAD_TIME }</p></li>
							<li class="infoItem"><strong class="infoLabel">난이도
									: </strong>
								<p class="infoText">
									<c:choose>
										<c:when test="${output.COURSE_LEVEL =='1'}">초급</c:when>
										<c:when test="${output.COURSE_LEVEL =='2'}">중급</c:when>
										<c:when test="${output.COURSE_LEVEL =='3'}">고급</c:when>
									</c:choose>
								</p></li>
							<li class="infoItem"><strong class="infoLabel">세부코스
									: </strong>
								<p class="infoText">${output.DETAIL_COURSE }</p></li>
							<li class="infoItem"><strong class="infoLabel">교통편
									: </strong>
								<p class="infoText">${output.TRAFFIC_INFO }</p>
								<h3 class="infoText">[관련지하철 - ${output.RELATE_SUBWAY }]</h3></li>
							<li class="infoItem">
								<h2 style="text-align: center;">- ${output.COURSE_NAME} -</h2>
								<p class="infoText">${output.CONTENT }</p>
								<h3 class="infoText">[추가날짜:${output.REG_DATE }]</h3>
							</li>
						</ul>
					</div>
					<!-- 123 -->


				</div>
				<div class="text-center">
					<button onclick="location.href='${pageContext.request.contextPath}/walkPage/walk_search.do'" class="btn btn-default"
						style="font-size: 20px; width: 140px; margin-top: 50px; margin-bottom: 80px; border: 0; outline: 0;">
						목록</button>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../inc/Footer.jsp"%>

	<%@ include file="../inc/plugin.jsp"%>
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
												'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
								$(this).removeClass("liked");
							} else {
								$(this)
										.html(
												'<i class="fa fa-heart" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
								$(this).addClass("liked");
							}
						});
	</script>
	<!-- //하트 -->

	<script type="text/javascript">
	$(function(){
		$(".btn-default").click(function(){
			location.href="<%=request.getContextPath()%>
		/walkPage/walk_search.jsp";

							});

		});
	</script>
</body>
</html>