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
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Joinlayout.css" />
</head>
<body>
   <div class="wrapper">

	<!-- 상단영역 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp" %>

	<!-- 본문영역 -->
	<div class="container">
	<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="page-header">
                <h1>회원가입</h1>
        </div>
		<!-- 가입폼 시작 -->
		<form class="form-horizontal" name="join_form" id="join_form"
			role="form">
			<!-- 입력양식 -->
			<!-- 아이디 -->
			<div class="form-group1">
				<label for='user_id' class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="user_id" class="form-control" id="user_id" placeholder="영문,숫자조합 최대 30글자">
                            <span class="input-group-btn">
                                <button type="button" id="id-unique-check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
			</div>
			</div><!-- //아이디 -->
			<!-- 닉네임 -->
			<div class="form-group1">
				<label for='user_nickname' class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="user_nickname" class="form-control" id="user_nickname" placeholder="한굴,영문,숫자조합 최대 30글자">
                            <span class="input-group-btn">
                                <button type="button" id="nickname-unique-check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
			</div>
			</div><!-- //닉네임 -->
			
			<!-- 비밀번호 -->
			<div class="form-group1">
                    <label for="user_pw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div><!-- //비밀번호 -->
                <!-- 비밀번호 확인 -->
                <div class="form-group1">
                    <label for="user_pw_confirm" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw_confirm" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div><!-- //비밀번호 확인 -->
              
              <!-- 이름 -->
			 <div class="form-group1">
                    <label for="user_name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_name" class="form-control" id="user_name" placeholder="한글, 최대 30글자" />
                    </div>
                </div><!-- //이름 -->
			
			<!-- 이메일 -->
			<div class="form-group1">
                    <label for="email" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" id="email" placeholder="예시 : example@example.com" />
                            <span class="input-group-btn">
                                <button type="button" id="email-unique-check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
                    </div>
                </div><!-- //이메일 -->
            <!-- 연락처 -->
			<div class="form-group1">
                    <label for="phone" class="col-sm-2 control-label">연락처</label>
                    <div class="col-sm-10">
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="`-`없이 숫자만 입력" />
                    </div>
                </div><!-- //연락처 -->
                
             <!-- 주소 우편번호 -->
			<div class="form-group1">
			<label for="user_id" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-4">
                        <div class="input-group">
                        <input type="text" name="postcode" class="form-control" id="postcode" maxlength="5" readonly>
                            <span class="input-group-btn">
                            <button type="button" onclick="execDaumPostcode()" class="btn btn-info postcode-finder" data-postcode="#postcode" data-addr1="#addr1" data-addr2="#addr2" data-frame="#postcode-frame">우편번호검색</button>
                        	</span>
                        </div>
                    </div>
                    </div><!-- //주소 우편번호 -->
                  <!-- 주소 도로명 -->  
                 <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" class="form-control" id="roadAddress" readonly />
                    </div><!-- //주소 도로명 -->
                 </div>
                 <!-- 주소 지번 -->
                  <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" class="form-control" id="jibunAddress" readonly /> 
                    </div>
                 </div><!-- //주소 지번 -->
                 <!-- 주소 나머지 -->
                <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" name="detailAddress" class="form-control" id="detailAddress" placeholder="나머지 주소" />
                    </div>
                </div><!-- 주소 나머지 -->
				
			
			<!-- 생년월일 -->
			<div class="form-group1">
                    <label for="birthday" class="col-sm-2 control-label">생년월일</label>
                    <div class="col-sm-10">
                        <input type="date" name="birthday" class="form-control" id="birthday" />
                    </div>
                </div><!-- //생년월일 -->
          <!-- 성별 -->
          <div class="form-group1">
                    <label for="gender1" class="col-sm-2 control-label">성별</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1" value="M" checked> 남자
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1" value="F"> 여자
                        </label>
                    </div>
                </div><!-- //성별 -->
         
			<!-- 버튼 -->	
			<div class="form-group1">
				<div class="col-sm-10 col-sm-offset-2 text-center">
					<button type='submit' id="next1" class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-danger"
						onClick="location.href='${pageContext.request.contextPath}/'">취소하기</button>
				</div>
			</div><!-- //버튼 끝 -->

		</form>
		<!-- //가입폼 끝 -->
		</div>
</div>
</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function execDaumPostcode() {
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
							document.getElementById('postcode').value = data.zonecode;
							document.getElementById("roadAddress").value = roadAddr;
							document.getElementById("jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							if (roadAddr !== '') {
								document.getElementById("extraAddress").value = extraRoadAddr;
							} else {
								document.getElementById("extraAddress").value = '';
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