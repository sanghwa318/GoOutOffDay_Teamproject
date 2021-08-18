/**
 * 
 */
/**
 * 
 */
 

//좋아요 기능
$(function(){
    isLike();
   
})

var post_no =$('#post_no').val();
function isLike() {

	$.ajax({
				url: getContextPath() + '/commPage/comm_crew_post/isLike',
				type: 'POST',
				dataType: 'json',
				data: {"post_no":post_no},
				error: function(error){
				},
				success: function(json){
					$('#likeCount').html("좋아요 "+json.count);
					$('#likeCount2').html("좋아요 "+json.count);
					var str ="";
					if(json.isLike>0){
						$('.heart').addClass("liked");
						str ='<i class="fa fa-heart" aria-hidden="true" role="button" id="like-btn"></i>'
						$('.heart').html(str);
					}else{
						$('.heart').removeClass("liked");
						str ='<i class="fa fa-heart-o" aria-hidden="true" role="button" id="like-btn"></i>'
						$('.heart').html(str);
					}
				}
	})

}
$(".heart").on("click",function() {
	var post_no =$('#post_no').val();
	console.log("좋아요 버튼 클릭");
	 if($(this).hasClass("liked")) {
		$.ajax({
				url: getContextPath() + '/commPage/comm_crew_post/deleteLike',
				type: 'POST',
				dataType: 'json',
				data: {"post_no":post_no},
				error: function(error){
		        	var error_msg ='';
		        	var code = parseInt(error.status / 100);
		        	if (code == 4) 	{
		                error_msg = "로그인이 필요한 서비스입니다. 로그인 후 이용해주세요.\n";
							swal({
								title : "에러",
								text :error_msg,
								type : "error"
							}).then(function(result) {
								// 창이 닫히는 애니메이션의 시간이 있으므로,
								// 0.1초의 딜레이 적용 후 포커스 이동
								setTimeout(function() {

								}, 100);
							}); // <-- 메시지 표시
							//window.location = getContextPath()+"/mainPage/login.do";
		            }
					/*else if(code == 4){
						error_msg = "탈퇴된 회원입니다.\n"
					}*/ 	
		        },
		        success: function(json) {
		        isLike();
		        }
		})
		
	} else {
	var post_no =$('#post_no').val();
		$.ajax({
				url: getContextPath() + '/commPage/comm_crew_post/addLike',
				type: 'POST',
				dataType: 'json',
				data: { "post_no":post_no },
				error: function(error){
		        	var error_msg ='';
		        	var code = parseInt(error.status / 100);
		        	if (code == 4) 	{
		                error_msg = "로그인이 필요한 서비스입니다. 로그인 후 이용해주세요.\n";
							swal({
								title : "에러",
								text :error_msg,
								type : "error"
							}).then(function(result) {
								// 창이 닫히는 애니메이션의 시간이 있으므로,
								// 0.1초의 딜레이 적용 후 포커스 이동
								setTimeout(function() {

								}, 100);
							}); // <-- 메시지 표시
							//window.location = getContextPath()+"/mainPage/login.do";
		            }
					/*else if(code == 4){
						error_msg = "탈퇴된 회원입니다.\n"
					}*/ 
		        },
		        success: function(json) {
				isLike();
		        }
		})
	}
});
//====좋아요 기능 끝

$(function(){
    cmt_list();
   
})

	
	/**댓글 등록하기 ajax */
	function cmt_add(){

		var crew_post_post_no =$('#post_no').val();
		
		var comment_text=$('#comment_text').val();
		$.ajax({
					url: getContextPath() + '/commPage/comm_crew_post/comment',
					type: 'POST',
					dataType: 'json',
					data: { crew_post_post_no:crew_post_post_no, comment_text:comment_text },
					success: function(data) { 
						cmt_list();
					},error:function(request,status,error){
						swal("실패","잘못된 요청입니다. 로그인 정보를 확인하세요.","error")
					}
		});
		var comment_text=$('#comment_text').val('');
	}
	
	
		/**댓글 목록 불러오기 ajax */
	function cmt_list(){
		
				var crew_post_post_no =$('#post_no').val();
		
				$.ajax({
					url: getContextPath() + '/commPage/comm_crew_post/comment',
					type: 'GET',
					dataType: 'json',
					data: { "crew_post_post_no":crew_post_post_no },
					success: function(data) {
						$('#CommentCount').html(data.count);
						$('#CommentCount2').html(data.count);
						var str = [];
						for(var i =0; i<data.cmtList.length; i++){
							var photo='';
							if(data.cmtList[i].user_photo==null){
								photo=getContextPath()+'/assets/img/profile_default.png'
								}else{
							photo=data.cmtList[i].user_photo.fileUrl;									
								}
						 str[i]='<div id="cmt-item-'+i+'"><div class="row" style="margin: 15px 30px 0 18%;">'
							str[i]+='<div class="pull-left writer_profile">'
							str[i]+='<a href="#"><img style="border-radius: 25px"'
							str[i]+='src=\''+photo+'\' width="50px"'
							str[i]+='height="50px"></img></a></div>'
							str[i]+='<div class="pull-left writer_info" style="margin-left: 10px; margin-top:-8px;">'
							str[i]+='<h4>'+data.cmtList[i].comment_usernick+'</h4>'
							str[i]+='<p style="color:#979797;">'+data.cmtList[i].comment_create_datetime+'</p></div>'
							str[i]+='<div class="pull-right">'
							str[i]+='<button type="button" class="btn btn-link" style="padding: 0; margin-right: 0" onclick="cmt_delete('+data.cmtList[i].comment_no+')">댓글 삭제</button></div></div><div class="row">'
							str[i]+='<div class="col-md-11 col-sm-11 col-xs-11" style="margin-left:18%; font-size:20px; margin-bottom:-20px;">'+data.cmtList[i].comment_text+'</div>'
							str[i]+='</div></div><hr width="85%" align="right">'
						}
					$('#cmt-list').html(str);
				 }
			});
		};
		
		/**댓글 삭제 ajax*/
		function cmt_delete(comment_no){
		var crew_post_post_no =$('#post_no').val();
					
		
						swal({
						title : '확인', // 제목
						text : "정말 삭제하시겠습니까?", // 내용
						type : 'warning', // 종류
						confirmButtonText : '네', // 확인버튼 표시 문구
						showCancelButton : true, // 취소버튼 표시 여부
						cancelButtonText : '아니오', // 취소버튼 표시 문구
					}).then(
						function(result){
							if (result.value) { // 확인 버튼이 눌러진 경우
						$.ajax({
							url: getContextPath() + '/commPage/comm_crew_post/comment',
							type: 'DELETE',
							dataType: 'json',
							data: {comment_no,crew_post_post_no},
							success: function(data) {
								if(data.rt)
								swal("성공", "삭제되었습니다.", "success")
								cmt_list()
							},error:function(request,status,error){
								swal("에러","잘못된 요청입니다. 로그인 정보를 확인하세요.","error"
								).then(function(){
								location.href=getContextPath()+"/mainPage/login.do"	
								})
							}
						});
					}
				});
			}
		





