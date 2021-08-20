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

<style>

.view {
	float: left;
}

.default-img li {
	float: left;
}

.img_prev li {
	margin-left: 15px;
	margin-top: -20px;
	padding: 30px;
	border: 1px #eee;
	padding: 30px;
}

.img_prev li img {
	width: 100px;
	height: 100px;
	border: 1px solid #eeee;
}

.img_prev ul h3 {
	margin: 30px;
}

button span {
	font-size: 20px;
}

.btn_container {
	margin: 40px 25px -20px 0;
}

.btn_container button {
	width: 80px;
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

.crew_pp>#img__wrap{
	margin-top: 30px;
}

/** 이미지 클릭 금지*/
#img__wrap {
	pointer-events: none;
}

/** 버튼,input 인라인 변경 */
#crewname_unique_check, #crew_name{

	display: inline-block;
}

/** label  블록레벨 변경*/
label {
	display: block;
}

/** 중복확인 버튼 위치 조정 */
#crewname_unique_check {
margin-bottom: 5px;
}

</style>

</head>
<body>

	<div class="wrapper">
		<!-- 공용 헤더 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->

		<div class="container" >
			
			<h1 class="page-header">크루 개설</h1>
			
			<!-- 개설 폼 시작 -->
			<form role="form" class="form-crew" method="post" id='est_form'	enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/commPage/comm_crew_est_ok">
					<div class="col-md-12 col-sm-12 col-xs-12">
					<div class="col-md-4 col-xs-12 col-sm-4 ">
						<label for="crew_name" style="font-size: 20px;">크루 이름</label> 
						<input type="text" id="crew_name" class="form-control crew_input pull-left"
							placeholder="한글로 입력하세요." name="crew_name" value="${crew_name}"
							style="width: 75%; text-align-last: center; font-size: 20px;" />
							<input type="hidden" name="crewname_unique_check" value="" />
						<button type="button" id="crewname_unique_check" class="btn btn-default" style="padding:6px; margin:0; margin-top:-1px;">중복확인</button>
						</div>
					<div class="col-md-4 col-xs-12 col-sm-4">
						<label for="crew_category" style="font-size: 20px;">크루 종류</label>
						<div>
						<select class="form-control " id="crew_category" name="crew_category"
								style="width: 75%; text-align-last: center; font-size: 20px; padding: 0;">
								<option value="none">종류</option>
								<option value="걷기/체육">걷기/체육</option>
								<option value="친목/모임">친목/모임</option>
								<option value="문화/창작/예술">문화/창작/예술</option>
							</select>
						</div>
					</div>
					<div class="col-md-4 col-xs-12 col-sm-4">
						<label for="crew_area" class=" control-label"
							style="font-size: 20px;">지역</label>
							<select class="form-control " id="crew_area" name="crew_area"
								style="width: 75%; text-align-last: center; font-size: 20px; padding: 0;">
								<option value="none">지역</option>
								<option value="강남구">강남구</option>
								<option value="강동구">강동구</option>
								<option value="강북구">강북구</option>
								<option value="강서구">강서구</option>
								<option value="관악구">관악구</option>
								<option value="광진구">광진구</option>
								<option value="구로구">구로구</option>
								<option value="금천구">금천구</option>
								<option value="노원구">노원구</option>
								<option value="도봉구">도봉구</option>
								<option value="동대문구">동대문구</option>
								<option value="동작구">동작구</option>
								<option value="마포구">마포구</option>
								<option value="서대문구">서대문구</option>
								<option value="서초구">서초구</option>
								<option value="성동구">성동구</option>
								<option value="성북구">성북구</option>
								<option value="송파구">송파구</option>
								<option value="양천구">양천구</option>
								<option value="영등포구">영등포구</option>
								<option value="용산구">용산구</option>
								<option value="은평구">은평구</option>
								<option value="종로구">종로구</option>
								<option value="중구">중구</option>
								<option value="중랑구">중랑구</option>
							</select>
				</div>
				</div>
					
					<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="col-sm-4 crew_pp col-md-4 col-xs-6 text-center">
						<input type="image" id="img__wrap" name="crew_photo" id="crew_photo"
							src='${pageContext.request.contextPath}/assets/img/profile_default.png'
							 width="70%" height="50%" style="border-radius: 100%; margin-top:30px;" />
							 <br>
							<label for="img__preview" class=" btn btn-default" id="crew_insert"
							style="font-size: 20px;">크루 사진 등록</label> <input type="file"
							name="crew_photo" id="img__preview" class="hidden"  />
					</div>
					
					<div class="col-md-7 col-sm-8 col-xs-6">
						<h3 class="header">크루 간단 소개</h3>
						<textarea class="form-control" rows="5" id="crew_sinto"
							name="crew_sinto"
							style="font-size: 20px; resize: none"
							placeholder="자신의 크루를 간단하게 소개해주세요."></textarea>
					</div>
					
					</div>
					<div class="col-sm-12 col-xs-12 col-md-12">
						<h3 class="header">크루 설명</h3>
						<textarea class="form-control" rows="5" id="crew_dinto"
							name="crew_dinto"
							style="font-size: 15px; resize: none"
							placeholder="해당 크루에 대한 설명 혹은 공지사항을 적어주세요."></textarea>
					
					</div>	
					<div class="col-sm-12 col-xs-12 col-md-12">
					<div class="text-center btn_container" >
						<button type="submit" class="btn btn-primary" id="btn_ok">
							<span>개설 완료</span>
						</button>
						<button type="reset" class="btn btn-danger" id="btn_cancel">
							<span>취소</span>
						</button>

					</div>		
					</div>			

			</form><!-- //개설폼 끝 -->

		</div>
	</div>



	<!-- 공용 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
	<script	src="${pageContext.request.contextPath}/assets/js/regex-crew-est.js"></script>
</body>
</html>