<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<style>

/* 폼 전체 박스 */
.form-horizontal {
	border: 1px solid #87ceed;
	width: auto;
	margin: auto;
	padding: 30px 10px;
}

/* 입력요소 단위 박스 */
.form-group1 {
	padding-top: 15px;
}

/* 마지막 입력 단위의 border 제거 */
/* .form-group:last-child {
	border-bottom: 0;
} */

/* Float 마감제 */
.form-group1:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

/* <label>에 대한 박스 처리 */
.col-md-2 {
	width: 25%;
	display: block;
	float: left;
	font-size: 20px;
	padding-top: 7px;
	text-indent: 5px;
	text-align: right;
}

/* <input>태그가 배치되는 박스의 처리 */
.col-md-10 {
	width: 50%;
	display: block;
	float: left;
}

.col-md-10 #gender1, .col-md-10 #gender2 {
	margin-left: 30px;
	margin-top: 10px;
}

.gender {
	font-size: 20px;
}

.col-md-10 #user_id, .col-md-10 #user_nikname, .col-md-10 #sample4_postcode{
	width: 200px;
	display: block;
	float: left;
}

/* <input>태그 */
.form-control1 {
	width: 100%;
	padding: 5px 0;
	font-size: 14px;
	border: 1px solid #eee;
}

/* 글자 중앙 정렬 */
.text-center {
	text-align: center;
}

/* 필수항목 표시를 위한 `*` */
.identify {
	font-size: 14px;
	color: #f00;
}

/* 에러 메시지에 대한 글자 색상 */
.error {
	color: red;
}

/* 에러가 발생한 <input>태그 */
input.error {
	background-color: #ffff00;
}

/* 에러메시지가 표시중인 <label>태그 */
label.error {
	font-size: 10px;
	display: inline-block;
	padding: 5px 10px;
	margin: 0;
}

#id_uniq_check, #nikname_uniq_check {
	margin-left: 20px;
}
/* 인풋요소 ui*/
.form-control1 {
	border: none;
	border-bottom: 2px solid #ced4da;
	border-radius: 0px;
	background-color: transparent;
	padding-left: 5px;
	box-shadow: none;
	/* required fields */
	/* active state */
	/* invalid state */
}

.form-control1:focus {
	border-bottom-color: #007bff;
	color: #000;
	box-shadow: none;
}

.form-control1:focus.invalid {
	border-bottom-color: #dc3545;
}
</style>
</head>
<body>
   <div class="wrapper">

	<!-- 상단영역 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp" %>

	<!-- 본문영역 -->
	<div class="container">
		<h1 class="page-header">회원가입</h1>
		<!-- 가입폼 시작 -->
		<form class="form-horizontal" name="join_form" id="join_form"
			role="form">
			<!-- 입력양식 -->

			<div class="form-group1">
				<label for='user_id' class="col-md-2 col-xs-2">아이디 <span
					class='identify'>*</span></label>
				<div class="col-md-10 col-xs-10">
					<input type="text" name="user_id" id="user_id" class="form-control1" />
					<input type="hidden" name="id_uniq_check" value="">
					<button class="btn btn-primary" type="button" id="id_uniq_check">중복확인</button>
				</div>
			</div>


			<div class="form-group1">
				<label for='user_nikname' class="col-md-2">닉네임 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="text" name="user_nikname" id="user_nikname"
						class="form-control1" /> <input type="hidden"
						name="nikname_uniq_check" value="">
					<button class="btn btn-primary" type="button"
						id="nikname_uniq_check">중복확인</button>
				</div>
			</div>
			<div class="form-group1">
				<label for='user_pw' class="col-md-2">비밀번호 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="password" name="user_pw" id="user_pw"
						class="form-control1" />
				</div>
			</div>
			<div class="form-group1">
				<label for='user_pw' class="col-md-2">비밀번호 확인 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="password" name="user_pw_re" id="user_pw_re"
						class="form-control1" />
				</div>
			</div>
			<div class="form-group1">
				<label for='user_name' class="col-md-2">이름 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="text" name="user_name" id="user_name"
						class="form-control1" />
				</div>
			</div>

			<div class="form-group1">
				<label for='email' class="col-md-2">이메일 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="email" name="email" id="email" class="form-control1" />
				</div>
			</div>
			<div class="form-group1">
				<label for='tel' class="col-md-2">연락처 <span class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="tel" name="tel" id="tel" class="form-control1" />
				</div>
			</div>
			<div class="form-group1">
				<label for='Address1' class="col-md-2">주소 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="text" id="sample4_postcode" name="sample4_postcode" class="form-control1"  placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()"
						value="우편번호 찾기"><br> <input type="text"
						id="sample4_roadAddress" class="form-control1" placeholder="도로명주소"> <input
						type="text" id="sample4_jibunAddress" class="form-control1"  placeholder="지번주소">
					<span id="guide" style="color: #999; display: none"></span> <input
						type="text" id="sample4_detailAddress"  name="sample4_detailAddress" class="form-control1"  placeholder="상세주소">
	
				</div>
			</div>
			<div class="form-group1">
				<label for='birthdate' class="col-md-2">생년월일 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<input type="date" name="birthdate" id="birthdate"
						class="form-control1" />
				</div>
			</div>
			<div class="form-group1">
				<label for='gender1' class="col-md-2">성별 <span
					class='identify'>*</span></label>
				<div class="col-md-10">
					<label class="gender"> <input type='radio' name='gender'
						id='gender1' value='M'>남자
					</label> <label class="gender"> <input type='radio' name='gender'
						id='gender2' value='F'>여자
					</label>
				</div>
			</div>

			<div class="form-group1">
				<div class="text-center">
					<button type='submit' id="next1" class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-danger"
						onClick="location.href='../mainPage/index.jsp'">취소하기</button>
				</div>
			</div>

		</form>
		<!-- //가입폼 끝 -->
</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("sample4_extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("sample4_extraAddress").value = '';
							}

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}
	</script>



	
	<script type="text/javascript">
		$(function() {

			$("#id_uniq_check").click(function() {

				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var user_id_val2 = $("#user_id").val();

				$.post("../api/id_unique_check.do", {
					user_id : user_id_val2
					
				}, function(req) {
					
					// 사용 가능한 아이디인 경우 --> req = { result: "OK" }
					// 사용 불가능한 아이디인 경우 --> req = { result: "FAIL" }
					if (req.result == 'OK') {
						swal({
							title : "성공",
							text : "사용가능한 아이디 입니다.",
							type : "success"
						}).then(function(result) {
							// 창이 닫히는 애니메이션의 시간이 있으므로,
							// 0.1초의 딜레이 적용 후 포커스 이동
							setTimeout(function() {

							}, 100);
						});
						$("input[name=id_uniq_check]").val('y');
						$("#user_id").prop("disabled", true);

					} else {
						swal({
							title : "에러",
							text : "사용할 수 없는 아이디 입니다.",
							type : "error"
						})
						$("#user_id").val("");
						$("#user_id").focus();
					}
				}); // end $.get
			});

			/** id중복 체크 확인 */
			$("#next1").click(function() {

				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var user_id_val = $("#user_id").val();

				if (!user_id_val) { // 입력되지 않았다면?
					swal({
						title : "에러",
						text : "아이디를 입력해 주세요.",
						type : "error"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					}); // <-- 메시지 표시
					$("#user_id").focus(); // <-- 커서를 강제로 넣기
					return false; // <-- 실행 중단
				}

				if ($("input[name='id_uniq_check']").val() == '') {
					swal({
						title : "경고",
						text : "아이디 중복확인을 해주세요.",
						type : "warning"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					});
					$("input[name='id_uniq_check']").eq(0).focus();
					return false;
				} else if($(("#user_id").validate)){
					swal({
						title : "경고",
						text : "아이디 중복확인을 해주세요.",
						type : "warning"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					});
				}
				// 위의 if문을 무사히 통과했다면 내용이 존재한다는 의미이므로,
				// 입력된 내용을 Ajax를 사용해서 웹 프로그램에게 전달한다.
				// 입력값을 취득하고, 내용의 존재여부를 검사한다.
				var user_nikname_val = $("#user_nikname").val();

				if (!user_nikname_val) { // 입력되지 않았다면?
					swal({
						title : "에러",
						text : "닉네임을 입력해 주세요.",
						type : "error"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					}); // <-- 메시지 표시
					$("#user_nikname").focus(); // <-- 커서를 강제로 넣기
					return false; // <-- 실행 중단
				}

				if ($("input[name='nikname_uniq_check']").val() == '') {
					swal({
						title : "경고",
						text : "닉네임 중복확인을 해주세요.",
						type : "warning"
					}).then(function(result) {
						// 창이 닫히는 애니메이션의 시간이 있으므로,
						// 0.1초의 딜레이 적용 후 포커스 이동
						setTimeout(function() {

						}, 100);
					});
					$("input[name='nikname_uniq_check']").eq(0).focus();
					return false;
				}
			});

			//닉네임 중복확인 버튼 시작
			$("#nikname_uniq_check")
					.click(
							function() {

								// 입력값을 취득하고, 내용의 존재여부를 검사한다.
								var user_nikname_val2 = $("#user_nikname")
										.val();

								$.post("../api/id_unique_check.do", {
									user_id : user_nikname_val2
								// 닉네임
								}, function(req) {
									// 사용 가능한 닉네임인 경우 --> req = { result: "OK" }
									// 사용 불가능한 닉네임인 경우 --> req = { result: "FAIL" }
									if (req.result == 'OK') {
										swal({
											title : "성공",
											text : "사용가능한 닉네임 입니다.",
											type : "success"
										}).then(function(result) {
											// 창이 닫히는 애니메이션의 시간이 있으므로,
											// 0.1초의 딜레이 적용 후 포커스 이동
											setTimeout(function() {

											}, 100);
										});
										$("input[name=nikname_uniq_check]")
												.val('y');
										$("#user_nikname").prop("disabled",
												true);

									} else {
										swal({
											title : "에러",
											text : "사용할 수 없는 닉네임 입니다.",
											type : "error"
										})
										$("#user_nikname").val("");
										$("#user_nikname").focus();
									}
								}); // end $.get

								/** 플러그인의 기본 설정 옵션 추가 */
								jQuery.validator
										.setDefaults({
											onkeyup : false, // 키보드입력시 검사 안함
											onclick : false, // <input>태그 클릭시 검사 안함
											onfocusout : false, // 포커스가 빠져나올 때 검사 안함
											showErrors : function(errorMap,
													errorList) { // 에러 발생시 호출되는 함수 재정의
												// 에러가 있을 때만..
												if (this.numberOfInvalids()) {
													// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
													//alert(errorList[0].message);
													// 0번째 에러 발생 항목에 포커스 지정
													//$(errorList[0].element).focus();

													swal(
															{
																title : "에러",
																text : errorList[0].message,
																type : "error"
															})
															.then(
																	function(
																			result) {
																		// 창이 닫히는 애니메이션의 시간이 있으므로,
																		// 0.1초의 딜레이 적용 후 포커스 이동
																		setTimeout(
																				function() {
																					$(
																							errorList[0].element)
																							.val(
																									'');
																					$(
																							errorList[0].element)
																							.focus();
																				},
																				100);
																	});
												}
											}
										});

								/** 유효성 검사 추가 함수 */
								$.validator.addMethod("kor", function(value,
										element) {
									return this.optional(element)
											|| /^[ㄱ-ㅎ가-힣]*$/i.test(value);
								});

								$.validator
										.addMethod(
												"phone",
												function(value, element) {
													return this
															.optional(element)
															|| /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i
																	.test(value)
															|| /^\d{2,3}\d{3,4}\d{4}$/i
																	.test(value);
												});
								$.validator
										.addMethod(
												"address",
												function(value, element) {
													return this.optional(element)
													|| /^[ㄱ-ㅎ가-힣0-9]*$/i.test(value);
												});

								/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
								$("#join_form")
										.validate(
												{
													/** 입력검사 규칙 */
													rules : {
														// [아이디] 필수 + 알파벳,숫자 조합만 허용
														user_id : {
															required : true,
															alphanumeric : true
														},
														// [비밀번호] 필수 + 글자수 길이 제한
														user_pw : {
															required : true,
															minlength : 4,
															maxlength : 20
														},
														// [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
														user_pw_re : {
															required : true,
															equalTo : "#user_pw"
														},
														// [이름] 필수
														user_name : {
															required : true,
															kor : true
														},
														// [닉네임] 필수 알파벳,숫자 조합만 허용
														user_nikname : {
															required : true,
															alphanumeric : true
														},
														// [이메일] 필수 + 이메일 형식 일치 필요
														email : {
															required : true,
															email : true
														},
														// [연락처] 필수
														tel : {
															required : true,
															phone : true
														},
														// [우편번호찾기] 필수
														sample4_postcode :{
															required : true,
															number : true
														},
														// [상세주소] 필수
														sample4_detailAddress : {
															required : true,
															address : true
														},
														// [생년월일] 필수 + 날짜 형식 일치 필요
														birthdate : {
															required : true,
															date : true
														},
														// [성별] 필수 입력,
														gender : "required",
													},
													/** 규칙이 맞지 않을 경우의 메시지 */
													messages : {
														user_id : {
															required : "아이디를 입력하세요.",
															alphanumeric : "아이디는 영어,숫자만 입력 가능합니다."
														},
														user_pw : {
															required : "비밀번호를 입력하세요.",
															minlength : "비밀번호는 4글자 이상 입력하셔야 합니다.",
															maxlength : "비밀번호는 최대 20자까지 가능합니다."
														},
														user_pw_re : {
															required : "비밀번호 확인값을 입력하세요.",
															equalTo : "비밀번호 확인이 잘못되었습니다."
														},
														user_name : {
															required : "이름을 입력하세요.",
															kor : "이름은 한글만 입력 가능합니다."
														},
														user_nikname : {
															required : "닉네임을 입력하세요.",
															alphanumeric : "닉네임은 영어,숫자만 입력 가능합니다."
														},
														email : {
															required : "이메일을 입력하세요.",
															email : "이메일 형식이 잘못되었습니다."
														},
														tel : {
															required : "연락처를 입력하세요.",
															phone : "연락처 형식이 잘못되었습니다."
														},
														roadAddress : {
															required : "도로명주소를 입력하세요.",
															address : "도로명주소는 한글,숫자만 입력 가능합니다."
														},
														sample4_postcode :{
															required : "우편번호 찾기를 해주세요.",
															number : "우편번호는 숫자만 가능합니다."
														
														},
														sample4_detailAddress : {	
															 required : "상세주소를 입력하세요.",
															 address : "상세주소는 한글과 숫자만 가능합니다."															
														},
														
														birthdate : {
															required : "생년월일을 입력하세요.",
															date : "생년월일의 형식이 잘못되었습니다."
														},
														gender : "성별을 선택해 주세요."

													}

												}); // end validate()

							}); // end
		});
	</script>

</body>
</html>