$(function() {

			$("#id_unique_check").click(function() {

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
						$("input[name=id_unique_check]").val('y');
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

				if ($("input[name='id_unique_check']").val() == '') {
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
					$("input[name='id_unique_check']").eq(0).focus();
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
				var user_nickname_val = $("#user_nickname").val();

				if (!user_nickname_val) { // 입력되지 않았다면?
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
					$("#user_nickname").focus(); // <-- 커서를 강제로 넣기
					return false; // <-- 실행 중단
				}

				if ($("input[name='nikcname_uniqre_check']").val() == '') {
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
					$("input[name='nikname_unique_check']").eq(0).focus();
					return false;
				}
			});

			//닉네임 중복확인 버튼 시작
			$("#nikname_unique_check")
					.click(
							function() {

								// 입력값을 취득하고, 내용의 존재여부를 검사한다.
								var user_nikname_val2 = $("#user_nickname")
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
										$("input[name=nikname_unique_check]")
												.val('y');
										$("#user_nickname").prop("disabled",
												true);

									} else {
										swal({
											title : "에러",
											text : "사용할 수 없는 닉네임 입니다.",
											type : "error"
										})
										$("#user_nickname").val("");
										$("#user_nickname").focus();
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
														user_nickname : {
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
														postcode :{
															required : true,
														},
														// [상세주소] 필수
														detailAddress : {
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
														user_nickname : {
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
														postcode :{
															required : "우편번호 찾기를 해주세요.",
														},
														detailAddress : {	
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