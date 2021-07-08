 function getContextPath() {
      var hostIndex = location.href.indexOf(location.host)
            + location.host.length;
      var contextPath = location.href.substring(hostIndex, location.href
            .indexOf('/', hostIndex + 1));
      return contextPath;
   }

$(function(){
	
		/**유효성 검사 추가 함수 */
	$.validator.addMethod("kor", function(value, element){
		return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
	});
	
	$.validator.addMethod("phone", function(value, element){
		return this.optional(element) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) ||
		/^\d{2,3}\d{3,4}\d{4}$/i.test(value);
	});
	$.validator.addMethod("address", function(value, element){
		return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value) ||
		/[~!@#$%^&*()_+|<>?:{}]/i.test(value) || /[0-9]/i.test(value) ;
	});
	$.validator.addMethod("nick", function(value, element){
		return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value) ||
		/^[a-zA-Z]*$/i.test(value) || /^[0-9]*$/i.test(value) ;
	});
	
	/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
		$("#join_form").validate({
			/**입력검사 규칙 */
			rules: {
				//[아이디] 필수 + 알파벳, 숫자 조합만 허용
				user_id: {required: true, alphanumeric: true, minlength: 4, maxlength: 30,
                remote : {
                    url : getContextPath() + '/mainPage/join/id_unique_check_jquery',
                    type : 'post',
                    data : {
                        user_id : function() {
                            return $("#user_id").val();
                        }
                    }
                }
            },
				//[닉네임] 필수 + 알파벳, 숫자 조합
				user_nick: {required: true, alphanumeric: true, minlength: 4, maxlength: 30,
                remote : {
                    url : getContextPath() + '/mainPage/join/nickname_unique_check_jquery',
                    type : 'post',
                    data : {
                        user_nick : function() {
                            return $("#user_nick").val();
                        }
                    }
                }
            },
				//[비밀번호] 필수 + 글자수 길이 제한
				user_pw: {required: true, minlength: 4, maxlength: 30},
				//[비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
				user_pw_re: {required: true, equalTo: "#user_pw"},
				//[이름] 필수
				user_name:{required: true, kor: true, maxlength: 30},
				//[이메일] 필수 + 이메일 형식 일치 필요
				email: {
                required: true, email: true, maxlength: 255,
                remote : {
                    url : getContextPath() + '/mainPage/join/email_unique_check_jquery',
                    type : 'post',
                    data : {
                        email : function() {
                            return $("#email").val();
                        }
                    }
                }
            },
				//[연락처] 필수
				tel: {required: true, minlength: 9, maxlength: 11},
				//[우편번호] 필수
				postcode: {required: true},
				// [도로명주소] 우편번호가 입력된 경우만 필수
     		    addr1: 'required',           		
				//[나머지주소] 필수 + 한글, 숫자, 특수문자 조합만 허용
				addr2: {required: true, address: true },
				//[성별] 필수
				gender: "required"
			},
			/**규칙이 맞지 않을 경우의 메시지 */
			messages: {
				user_id: {
					required: "아이디를 입력하세요.",
					alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다.",
       		        minlength: "아이디는 최소 {0}글자 이상 입력하셔야 합니다.",
                    maxlength: '아이디는 최대 {0}글자까지 가능합니다.',
                    remote: '이미 사용중인 아이디 입니다.'
				},
				user_nick: {
					required: "닉네임을 입력하세요.",
					alphanumeric: "닉네임은 영어, 숫자만 입력 가능합니다.",
					minlength: "닉네임은 최소 {0}글자 이상 입력하셔야 합니다.",
                    maxlength: '닉네임은 최대 {0}글자까지 가능합니다.',
                    remote: '이미 사용중인 닉네임 입니다.'
				},
				user_pw: {
					required: "비밀번호를 입력하세요.",
					minlength: "비밀번호는 최소 {0}글자 이상 입력하셔야 합니다.",
					maxlength: '아이디는 최대 {0}글자까지 가능합니다.'
				},
				user_pw_re: {
              		required: '비밀번호 확인값을 입력하세요.',
                	equalTo: '비밀번호 확인이 잘못되었습니다.'
         		},
				user_name: {
            	    required: '이름을 입력하세요.',
            	    kor: '이름은 한글만 입력 가능합니다.',
            	    minlength: '이름은 최소 {0}글자 이상 입력하셔야 합니다.',
      	            maxlength: '이름은 최대 {0}글자까지 가능합니다.'
          		},
          		email: {
                    required: '이메일을 입력하세요.',
                    email: '이메일 형식이 잘못되었습니다.',
                    maxlength: '이메일은 최대 {0}글자까지 가능합니다.',
                    remote: '이미 사용중인 이메일 입니다.'
                },
				tel: {
                    required: '연락처를 입력하세요.',
                    phone: '연락처 형식이 잘못되었습니다.',
                    minlength: '연락처는 최소 {0}글자 이상 입력하셔야 합니다.',
                    maxlength: '연락처는 최대 {0}글자까지 가능합니다.'
          		},
				postcode: {
					required: '우편번호를 검색하세요.'
				},
				addr1: {
					required: '도로명 주소를 입력하세요.'
				},
				
				addr2:{
					required: '나머지 주소를 입력하세요.',
					address: '나머지 주소는 한글, 숫자, "-" 만 가능합니다.'
				},
				gender: {
					required: '성별을 선택하세요.'
				}
			}
		});// end validate()
		
		$('#join_form').ajaxForm({
        // submit 전에 호출된다.
        beforeSubmit: function(arr, form, options) {
            // validation 플러그인을 수동으로 호출하여 결과를 리턴한다.
            // 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
            return $(form).valid();
        },
		success: function(json) {
            swal('알림', '회원가입이 완료되었습니다. 로그인 해 주세요.', 'success').then(function(result) {
                window.location = getContextPath() + '/mainPage/login.do';
            });
        }
       
    }); // end ajaxForm

    $("#id_unique_check").click(function(e) {
        const userId = $("#user_id").val();

        if (!userId) {
            swal('알림', '아이디를 입력하세요.', 'warning');
            return;
        }

        $.post(getContextPath() + '/mainPage/join/id_unique_check_jquery', {
            user_id: userId
        }, function(json) {
			
            swal('확인', '사용가능한 아이디 입니다.', 'success');
		
        });
    });

	$("#nickname_unique_check").click(function(e) {
        const userNick = $("#user_nick").val();

        if (!userNick) {
            swal('알림', '닉네임을 입력하세요.', 'warning');
            return;
        }

        $.post(getContextPath() + '/mainPage/join/nickname_unique_check_jquery', {
            user_nick: userNick
        }, function(json) {
            swal('확인', '사용가능한 닉네임 입니다.', 'success');
        });
    });

    $("#email_unique_check").click(function(e) {
        const email = $("#email").val();

        if (!email) {
            swal('알림', '이메일을 입력하세요.', 'warning');
            return;
        }

        $.post(getContextPath() + '/mainPage/join/email_unique_check_jquery', {
            email: email
        }, function(json) {
            swal('확인', '사용가능한 이메일 입니다.', 'success');
        });
    });
});




