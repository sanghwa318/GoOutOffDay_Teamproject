/**
 * 찜목록 추가제거 (김도운)
 */
// 하트
$(".heart")
	.on(
		"click",
		function() {
			if ($(this).hasClass("liked")) {
				swal({
					title: '확인',
					text: "찜목록에서 제거할까요?",
					type: 'question',
					confirmButtonText: '네',
					showCancelButton: true,
					cancelButtonText: '아니요',
				})
					.then(
						function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
							if (result.value) { // 확인 버튼이 눌러진 경우
								deleteBookMark();

							} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
								$(".heart")
									.html(
										'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜제거');
								$(".heart")
									.removeClass(
										"liked");
								swal(
									'취소',
									'제거가 취소되었습니다.',
									'error');
							}
						});
			} else {
				swal({
					title: '확인',
					text: "찜목록에 추가할까요?",
					type: 'question',
					confirmButtonText: '네',
					showCancelButton: true,
					cancelButtonText: '아니요',
				})
					.then(
						function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
							if (result.value) { // 확인 버튼이 눌러진 경우
								addBookMark();

							} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
								$(".heart")
									.html(
										'<i class="fa fa-heart-o" aria-hidden="true" style="padding-right:5px;"></i> 찜하기');
								$(".heart")
									.removeClass(
										"liked");
								swal(
									'취소',
									'취소되었습니다.',
									'error');
							}
						});
			}

		});