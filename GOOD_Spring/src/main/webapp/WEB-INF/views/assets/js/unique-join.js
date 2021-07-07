$(function() {

			$("#id-unique-check").click(function() {

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
						$("input[name=id-unique-check]").val('y');
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

				if ($("input[name='id-unique-check']").val() == '') {
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
					$("input[name='id-unique-check']").eq(0).focus();
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

				if ($("input[name='nikcname-unique-check']").val() == '') {
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
					$("input[name='nickname-unique-check']").eq(0).focus();
					return false;
				}
			});

			//닉네임 중복확인 버튼 시작
			$("#nickname-unique-check")
					.click(
							function() {

								// 입력값을 취득하고, 내용의 존재여부를 검사한다.
								var user_nickname_val2 = $("#user_nickname")
										.val();

								$.post("../api/id_unique_check.do", {
									user_id : user_nickname_val2
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
										$("input[name=nickname-unique-check]")
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
								}); 