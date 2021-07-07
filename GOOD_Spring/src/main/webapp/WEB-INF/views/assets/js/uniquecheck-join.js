$(function(){
	/**플러그인의 기본 설정 옵션 추가 */
	jQuery.validator.setDefaults({
		onkeyup:false,		//키보드 입력시 검사 안함
		onclick:false, 		//<input>태그 클릭시 검사 안함
		onfocusout:false,	//포커스가 빠져나올 때 검사 안함
		showErrors:function(errorMap, errorList){	//에러 발생시 호출되는 함수 재정의
			//에러가 있을 때만
			if(this.numberOfInvalids()){
				
				swal({
					title: "에러",
					text: errorList[0].message,
					type: "error"
				}).then (function(result){
					
				});
			}
		}
	});
});

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
});


$(function(){
		/** form태그에 부여한 id속성에 대한 유효성 검사 함수 호출 */
		$("#join_form").validate({
			/**입력검사 규칙 */
			rules: {
				//[아이디] 필수 + 알파벳, 숫자 조합만 허용
				user_id: {required: true, alphanumeric: true, minlength: 4, maxlength: 30
				/*remote : {
                    url : ROOT_URL + '/rest/account/id_unique_check_jquery',
                    type : 'post',
                    data : {
                        user_id : function() {
                            return $("#user_id").val();
                        }}}*/
				},
				//[닉네임] 필수 + 한글, 알파벳, 숫자 조합
				user_nickname: {required: true, nick: true, minlength:4, maxlength: 30
				/*remote : {
                    url : ROOT_URL + '/assets/api/nicknameUniqueCheck',
                    type : 'post',
                    data : {
                        user_id : function() {
                            return $("#user_id").val();
                        }}}*/
				 },
				//[비밀번호] 필수 + 글자수 길이 제한
				user_pw: {required: true, minlength: 4, maxlength: 30},
				//[비밀번호 확인] 필수 + 특정 항목과 일치 (pw로 연결)
				user_pw_re: {required: true, equalTo: "#user_pw"},
				//[이름] 필수
				user_name:{required: true, kor: true, maxlength: 30},
				//[이메일] 필수 + 이메일 형식 일치 필요
				email: {required: true, email: true, maxlength: 255
               /* remote : {
                    url : ROOT_URL + '/assets/api/emailUniqueCheck',
                    type : 'post',
                    data : {
                        email : function() {
                            return $("#email").val();
                        }}}*/
                    },
				//[연락처] 필수
				tel: {required: true, minlength: 9, maxlength: 11},
				//[우편번호] 필수
				postcode: {required: true},
				// [도로명주소] 우편번호가 입력된 경우만 필수
     		    roadAddress: 'required',
      	        // [주소2] 우편번호가 입력된 경우만 필수
           		jibunAddress: 'required',
				//[나머지주소] 필수 + 한글, 숫자, 특수문자 조합만 허용
				detailAddress: {required: true, address: true },
				//[생년월일] 필수 + 날짜 형식 일치 필요
				birthdate: {required: true, date:true},
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
				user_nickname: {
					required: "닉네임을 입력하세요.",
					nick: "닉네임은 한글, 영어, 숫자만 입력 가능합니다.",
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
				detailAddress:{
					required: '나머지 주소를 입력하세요.',
					address: '나머지 주소는 한글, 숫자, "-" 만 가능합니다.'
				},
				birthdate: {
					required: '생년월일을 입력하세요.',
					date: '생년월일의 형식이 잘못되었습니다.'	
				},
				gender: {
					required: '성별을 선택하세요.'
				}
			}
		});// end validate()
});

