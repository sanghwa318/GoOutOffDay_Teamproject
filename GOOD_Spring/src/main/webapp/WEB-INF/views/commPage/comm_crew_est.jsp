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
//
상단 //
상단 끝


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
</style>

</head>
<body>

	<div class="wrapper">
		<!-- 공용 헤더 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->

		<div class="container" style="margin-bottom: 50px;">

			<!-- 상단  -->


			<h1 class="page-header">크루 개설</h1>

			
				<form role="form" class="form-crew" method="POST" enctype="multipart/form-data"
				action="${pageContext.request.contextPath}/commPage/comm_crew_est_ok.do">
<div class="row " style="margin-bottom: 30px;"> 
					<div class="form-group col-md-3 col-xs-6">
						<label for="crew_name" style="font-size: 20px;">크루 이름</label> <input
							type="text" id="crew_name" class="form-control crew_input"
							placeholder="크루명을 입력하세요." name="crew_name" value="${crew_name}"
							style="width: 200px; text-align-last: center; font-size: 20px;">
						<button type="submit" id="crewname_check" class="btn btn-default">중복확인</button>
					</div>



					<div class="form-group col-md-3 col-xs-6">
						<label for="crew_category" style="font-size: 20px;">크루 종류</label>
						<input type="text" id="crew_category"
							class="form-control crew_input" placeholder="크루 종류를 입력하세요."
							name="crew_category"
							style="width: 200px; text-align-last: center; font-size: 20px;">
					</div>


					<div class="form-group col-md-3 col-xs-6">
						<label for="crew_location" class="col-md-4 control-label"
							style="font-size: 20px;">지역</label>
						<div>
							<select class="form-control " id="crew_location" name="crew_area"
								style="width: 200px; text-align-last: center; font-size: 20px; padding: 0;">
								<option value="none" hidden >지역</option>
								<option value="강남구">강남구</option>
								<option value="강동구">강동구</option>
								<option value="강북구">강북구</option>
								<option value="">강서구</option>
								<option value="">관악구</option>
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
				
			</div>

			<!-- //상단 -->



			<!-- 파일 드래그 앤 드롭 -->

			<div class="row view text-center col-md-3 col-xs-12">
				
					<div class="form-group ">
						<input type="image" id="img__wrap" name="crew_photo" 
							onerror="this.src='${pageContext.request.contextPath}/assets/img/profile_default.png'"
							src="${sessionScope.principal.userProfile}" width="200px"
							height="200px" style="border-radius: 100px" />
					</div>
				

				<div class="form-group text-center bg-light">
					<label for="img__preview" class=" btn btn-default"
						style="font-size: 20px;">크루 사진 변경</label> <input type="file" name="crew_photo"
						 id="img__preview" class="hidden" /> 
				</div>

			</div>


			<div class="row col-md-offset-2 img_prev">

				<div class="col-md-10 col-sm-10 col-xs-10">
					<h3 class="header text-center ">기본 이미지</h3>
					<ul style="list-style: none;" class="default-img">
						<li><a href="#123" onclick="setImage(0); return fasle"><img
								src="${pageContext.request.contextPath}/assets/icon_img/걷기 아이콘.png" /></a></li>
						<li><a href="#123" onclick="setImage(1); return fasle"><img
								src="${pageContext.request.contextPath}/assets/icon_img/크루 아이콘.png" /></a></li>
						<li><a href="#123" onclick="setImage(2); return fasle"><img
								src="${pageContext.request.contextPath}/assets/icon_img/문화체육 아이콘.png" /></a></li>
						<li><a href="#123" onclick="setImage(3); return fasle;"><img
								src="${pageContext.request.contextPath}/assets/icon_img/체육시설 아이콘.png" /></a></li>
					</ul>
				</div>
			</div>

			<div class="row">
				<div class="container col-md-3 " style="margin-left: 25px">
					<h3 class="header" style="padding-left: 40px;">크루 간단 소개</h3>
					<textarea class="form-control" rows="5" id="crew_sinto" name="crew_sinto"
						style="width: 200px; font-size: 15px; resize: none"
						placeholder="크루를  간단히 소개해주세요."></textarea>
				</div>

				<div class="container col-md-4" style="margin-left: 25px">
					<h3 class="header">크루 소개</h3>
					<textarea class="form-control" rows="5" id="crew_dinto" name="crew_dinto"
						style="width: 550px; font-size: 20px; resize: none"
						placeholder="크루 소개글을 작성해주세요."></textarea>
				</div>
			</div>



			<div class="row col-md-offset-5 col-xs-offset-4">
				<div class="text-center btn_container" style="float: left;">
					<button type="submit" class="btn btn-primary" id="btn_ok">
						<span>개설 완료</span>
					</button>
				</div>


				<div class="text-center btn_container " style="float: left;">
					<button type="reset" class="btn btn-danger" id="btn_cancel">
						<span>취소</span>
					</button>

				</div>


			</div>

</form>

		</div>
		
	</div>
	
	
	
	<!-- 공용 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


	<script type="text/javascript">
		$('#img__preview').on("change", function(e) {
			console.log(e.target.files);

			console.log(e.target.files[0].type.match("image*"));
			console.log(e.target.files[0].type.includes("image"));

			var f = e.target.files[0];

			if (!f.type.match("image*")) {
				alert("이미지만 첨부할 수 있습니다.");
				$("#img__preview").val('');
				return;
			}

			if (f.size > 1024 * 1024 * 2) {
				alert("이미지는 2MB 이하만 가능합니다.");
				$('#img__preview').val('');
				return;
			}
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img__wrap').attr("src", e.target.result);
			};
			reader.readAsDataURL(f);
		});
	</script>

	<script type="text/javascript">
		function setImage(index) {

			var image_list = [ '${pageContext.request.contextPath}/assets/icon_img/걷기 아이콘.png',
					'${pageContext.request.contextPath}/assets/icon_img/크루 아이콘.png', 
					'${pageContext.request.contextPath}/assets/icon_img/문화체육 아이콘.png',
					'${pageContext.request.contextPath}/assets/icon_img/체육시설 아이콘.png' ];

			var image = document.getElementById("img__wrap");

			image.src = image_list[index];
		}
	</script>
   <script>
      $(function() {
         $('#btn_ok')
               .click(
                     function(e) {

                        var crew_name_val = $("#crew_name").val();

                        if (!crew_name_val) { // 입력되지 않았다면?
                           swal({
                              title : "에러",
                              text : "크루명을 입력해 주세요.",
                              type : "error"
                           }).then(function(result) {
                              // 창이 닫히는 애니메이션의 시간이 있으므로,
                              // 0.1초의 딜레이 적용 후 포커스 이동
                              setTimeout(function() {
                                 $("#crew_name").focus();
                              }, 1);
                           }); // <-- 메시지 표시
                           
                           return false; // <-- 실행 중단
                        } 
                        
                        var crew_category_val = $("#crew_category").val();

                        if (!crew_category_val) { // 입력되지 않았다면?
                           swal({
                              title : "에러",
                              text : "크루종류를 입력해 주세요.",
                              type : "error"
                           }).then(function(result) {
                              // 창이 닫히는 애니메이션의 시간이 있으므로,
                              // 0.1초의 딜레이 적용 후 포커스 이동
                              setTimeout(function() {
                                 $("#crew_category").focus();
                              }, 1);
                           }); // <-- 메시지 표시
                           
                           return false; // <-- 실행 중단
                        }

                        var crew_location_val = $(
                              "#crew_location option").index(
                              $("#crew_location option:selected"));

                        if (!crew_location_val) { // 입력되지 않았다면?
                           swal({
                              title : "에러",
                              text : "지역을 선택해 주세요.",
                              type : "error"
                           }).then(function(result) {
                              // 창이 닫히는 애니메이션의 시간이 있으므로,
                              // 0.1초의 딜레이 적용 후 포커스 이동
                              setTimeout(function() {
                                 $("#crew_location").focus(); // <-- 커서를 강제로 넣기
                              }, 1);
                           }); // <-- 메시지 표시
                           
                           return false; // <-- 실행 중단
                        }

                        var crew_sinto_val = $("#crew_sinto").val();

                        if (!crew_sinto_val) { // 입력되지 않았다면?
                           swal({
                              title : "에러",
                              text : "크루 간단소개를 입력해 주세요.",
                              type : "error"
                           }).then(function(result) {
                              // 창이 닫히는 애니메이션의 시간이 있으므로,
                              // 0.1초의 딜레이 적용 후 포커스 이동
                              
                              setTimeout(function() {
                            	  $("#crew_sinto").focus(); // <-- 커서를 강제로 넣기
                              }, 1);
                           }); // <-- 메시지 표시
                           
                           return false; // <-- 실행 중단
                        } 
                        
                        var crew_dinto_val = $("#crew_dinto").val();

                        if (!crew_dinto_val) { // 입력되지 않았다면?
                           swal({
                              title : "에러",
                              text : "크루 소개를 입력해 주세요.",
                              type : "error"
                           }).then(function(result) {
                              // 창이 닫히는 애니메이션의 시간이 있으므로,
                              // 0.1초의 딜레이 적용 후 포커스 이동
                              
                              setTimeout(function() {
                            	  $("#crew_dinto").focus(); // <-- 커서를 강제로 넣기
                              }, 1);
                           }); // <-- 메시지 표시
                           
                           return false; // <-- 실행 중단
                           
                        }  else {
                           swal({
                              title : '확인', // 제목
                              text : "개설을 축하합니다!", // 내용
                              type : 'success', // 종류
                           })
                                 .then(
                                       function(result) {
                                          // 창이 닫히는 애니메이션의 시간이 있으므로,
                                          // 0.1초의 딜레이 적용 후 포커스 이동
                                          setTimeout(
                                                function() {
                                    location.href = '${pageContext.request.contextPath}/commPage/comm_crew_info.do';
                                                }, 100);
                                       })
                        }

                     });

         $("#btn_cancel").click(function() {
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal({
               title : '확인', // 제목
               text : "정말 취소를 하시겠습니까?", // 내용
               type : 'warning', // 종류
               confirmButtonText : '네', // 확인버튼 표시 문구
               showCancelButton : true, // 취소버튼 표시 여부
               cancelButtonText : '아니오', // 취소버튼 표시 문구
            }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
               if (result.value) { // 확인 버튼이 눌러진 경우
                  swal('삭제', '크루 개설이 취소되었습니다.', 'success');
                  setTimeout(function() {
                     location.href = '${pageContext.request.contextPath}/commPage/comm_crew.do';
                  }, 1000);

               }

            });
         });

      });
   </script>




</body>
</html>