/**
 * 
 */
/**
 * 
 */
//찜하기 아이콘
$(".heart").on("click",function() {
	 if($(this).hasClass("liked")) {
		$(this).html('<i class="fa fa-heart-o" aria-hidden="true"></i>');
		$(this).removeClass("liked");
	} else {
		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i>');
		$(this).addClass("liked");
	}
});

$(function(){
    cmt_list();
   
})


//글삭제
$("#delete-btn").on("click",function() {
		if(confirm("삭제하시겠습니까?")){
		location.href = getContextPath()+"/commPage/comm_crew_postDeleteOk.do?post_no="+post_no;
		return true;
	}else{
		return false;
	}
})
	
	/**댓글 등록하기 ajax */
	function cmt_add(){

		var crew_post_post_no =$('#post_no').val();
		
		var comment_text=$('#comment_text').val();
		$.ajax({
					url: getContextPath() + '/commPage/comm_crew_post/comment',
					type: 'POST',
					dataType: 'json',
					data: { crew_post_post_no, comment_text },
					success: function(data) { 
						cmt_list();
					},error:function(request,status,error){
						alert("잘못된 요청입니다. 로그인 정보를 확인하세요.")
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
					data: { crew_post_post_no },
					success: function(data) {
						var str = [];
						for(var i =0; i<data.cmtList.length; i++){
						 str[i]='<div id="cmt-item-'+i+'"><div class="row" style="margin: 15px 30px 0 30px;">'
							str[i]+='<div class="pull-left writer_profile">'
							str[i]+='<a href="#"><img style="border-radius: 25px"'
							str[i]+='onerror="this.src=\''+getContextPath()+'/assets/img/profile_default.png\'"'
							str[i]+='src="${sessionScope.principal.userProfile}" width="50px"'
							str[i]+='height="50px"></img></a></div>'
							str[i]+='<div class="pull-left writer_info" style="margin-left: 15px;">'
							str[i]+='<h4>'+data.cmtList[i].comment_usernick+'</h4>'
							str[i]+='<p>'+data.cmtList[i].comment_create_datetime+'</p></div>'
							str[i]+='<div class="pull-right">'
							str[i]+='<button type="button" class="btn btn-link" style="padding: 0; margin-right: 0" onclick="cmt_delete('+data.cmtList[i].comment_no+')">댓글 삭제</button></div></div><div class="row">'
							str[i]+='<div class="col-md-offset-1 col-md-11" style="margin-left: 50px;">'+data.cmtList[i].comment_text+'</div>'
							str[i]+='</div></div><hr>'
						}
					$('#cmt-list').html(str);
				 }
			});
		};
		
		/**댓글 삭제 ajax*/
		function cmt_delete(comment_no){

			if (confirm("정말 삭제하시겠습니까?")){
			
				console.log(comment_no)
			$.ajax({
					url: getContextPath() + '/commPage/comm_crew_post/comment',
					type: 'DELETE',
					dataType: 'json',
					data: {comment_no},
					success: function(data) {
						if(data.rt)
						alert("삭제되었습니다.")
						cmt_list()
						
						
				 },error:function(request,status,error){
						alert("잘못된 요청입니다. 로그인 정보를 확인하세요.")
					}
			});
			}
			
		}
		





