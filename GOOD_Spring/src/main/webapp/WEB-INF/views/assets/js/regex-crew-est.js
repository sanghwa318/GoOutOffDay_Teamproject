 function getContextPath() {
      var hostIndex = location.href.indexOf(location.host)
            + location.host.length;
      var contextPath = location.href.substring(hostIndex, location.href
            .indexOf('/', hostIndex + 1));
      return contextPath;
   }

$(function(){
		
    $("#crewname_unique_check").click(function(e) {
        const crewName = $("#crew_name").val();

        if (!crewName) {
            swal("에러", '크루이름을 입력하세요.', "error");
      	
        }
		else{
			$.ajax({
				url:getContextPath() + '/commPage/comm_crew_est_ok/crewname_unique_check',
				type: 'post',
				dateType: 'json',
				data: {crew_name: crewName},
				success: function(data){
					swal('성공','사용가능한 크루이름 입니다.','success').then(function(result){
						$("input[name=crewname_unique_check]").val('y');
					$("#crewname_unique_check").eq(0).removeClass('btn-success');
					CNunique=true;
					})

				},error: function(data, status, error){
					var error_msg =data.responseJSON.rt
						swal({
							title : "에러",
							text :error_msg,
							type : "error"
							}).then(function(result) {
								// 창이 닫히는 애니메이션의 시간이 있으므로,
						                  // 0.1초의 딜레이 적용 후 포커스 이동
						                  setTimeout(function() {
						                	  $("#crew_name").focus(); // <-- 커서를 강제로 넣기
						                  }, 100);
						}); // <-- 메시지 표시
					return false; // <-- 실행 중단
				}
			})
       
        }
    });
	
	
});
 	var test = false;
		$('#img__preview').on("change", function(e) {

			var f = e.target.files[0];

			if (!f.type.match("image*")) {
				 swal("에러", "이미지파일만 첨부할 수 있습니다.", "error");
				$("#img__preview").val('');
				return;
			}

			if (f.size > 1024 * 1024 * 2) {
				 swal("에러", "이미지크기는 2MB 이하만 가능합니다.", "error");
				$('#img__preview').val('');
				return;
			}
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img__wrap').attr("src", e.target.result);
			};
			reader.readAsDataURL(f);
			
			test = e.target.files[0].type.includes("image");
			$("#crew_insert").removeClass("btn-success")
			
		});
		$(function() {
			$('#btn_ok').click(function(e) {
								e.preventDefault();

						        	 /** 크루명 중복 체크 확인 */
						            // 입력값을 취득하고, 내용의 존재여부를 검사한다.
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
						                	  $("#crew_name").focus(); // <-- 커서를 강제로 넣기
						                  }, 100);
						               }); // <-- 메시지 표시
						               return false; // <-- 실행 중단
						            }

						            if ($("input[name='crewname_unique_check']").val() == '') {
						               swal({
						                  title : "경고",
						                  text : "크루명 중복확인을 해주세요.",
						                  type : "warning"
						               }).then(function(result) {
						                  // 창이 닫히는 애니메이션의 시간이 있으므로,
						                  // 0.1초의 딜레이 적용 후 포커스 이동
						                  setTimeout(function() {
						                	  $("#crewname_unique_check").eq(0).addClass("btn-success") // <-- 강제 포커싱
						                  }, 100);
						               });
						               return false; // <-- 실행 중단
						            } 
						            
						            
					

								var crew_category_val = $("#crew_category option").index($("#crew_category option:selected"))										

								if (!crew_category_val) { // 선택되지 않았다면?
									swal({
										title : "에러",
										text : "크루종류를 선택해 주세요.",
										type : "error"
									}).then(function(result) {
										// 창이 닫히는 애니메이션의 시간이 있으므로,
										// 0.1초의 딜레이 적용 후 포커스 이동
										setTimeout(function() {
											$("#crew_category").focus();
										}, 100);
									}); // <-- 메시지 표시
									return false; // <-- 실행 중단
								}

								var crew_location_val = $(
										"#crew_area option").index(
										$("#crew_area option:selected"));

								if (!crew_location_val) { // 입력되지 않았다면?
									swal({
										title : "에러",
										text : "지역을 선택해 주세요.",
										type : "error"
									}).then(function(result) {
										// 창이 닫히는 애니메이션의 시간이 있으므로,
										// 0.1초의 딜레이 적용 후 포커스 이동
										setTimeout(function() {
											$("#crew_area").focus(); // <-- 커서를 강제로 넣기
										}, 100);
									}); // <-- 메시지 표시

									return false; // <-- 실행 중단
								}
								
								var crew_photo_val = $("#crew_photo").val();
							
								if(!test) {
									swal({
										title :"에러",
										text : "크루 사진을 등록해주세요.",
										type : "error"
									}).then(function(result){
									
										setTimeout(function(){
											$("#crew_insert").addClass("btn-success")
										}, 100);
									});
									
									return false;
									
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
										}, 100);
									}); // <-- 메시지 표시

									return false; // <-- 실행 중단
								}

								var crew_dinto_val = $("#crew_dinto").val();

								if (!crew_dinto_val) { // 입력되지 않았다면?
									swal({
										title : "에러",
										text : "크루 설명을 입력해 주세요.",
										type : "error"
									}).then(function(result) {
										// 창이 닫히는 애니메이션의 시간이 있으므로,
										// 0.1초의 딜레이 적용 후 포커스 이동

										setTimeout(function() {
											$("#crew_dinto").focus(); // <-- 커서를 강제로 넣기
										}, 100);
									}); // <-- 메시지 표시

									return false; // <-- 실행 중단

								} else {
									swal({
										title : '확인', // 제목
										text : "개설을 축하합니다!", // 내용
										type : 'success', // 종류
										confirmButtonText : '네', // 확인버튼 표시 문구
									}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
										if (result.value) { // 확인 버튼이 눌러진 경우
											 $("#crew_name").removeAttr('disabled');
											document.getElementById("est_form").submit();   // 유효성 검사 후 submit
														}

													});

								}
							});

			$("#btn_cancel").click(
							function() {
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
										swal('삭제','크루 개설이 취소되었습니다.','success');
									setTimeout(function() {
										location.href = '${pageContext.request.contextPath}/commPage/comm_crew.do';
																}, 100);

													}

												});
							});

		});
		
		$('input[type="text"]').keydown(function() {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			});


