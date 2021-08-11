/**
 * 
 */
//좋아요 기능
function isLike() {
	$.ajax({
				url: getContextPath() + '/commPage/comm_myCourseDetail/isLike.do',
				type: 'POST',
				dataType: 'json',
				data: { mycourse_no },
				error: function(error){
				},
				success: function(json){
					console.log("json.isLike :"+json.isLike);
					$('#likeCount').html("좋아요 "+json.count);
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
	console.log("좋아요 버튼 클릭");
	 if($(this).hasClass("liked")) {
		$.ajax({
				url: getContextPath() + '/commPage/comm_myCourseDetail/deleteLike.do',
				type: 'POST',
				dataType: 'json',
				data: { mycourse_no },
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
				console.log("좋아요 취소 완료");
		        isLike();
		        }
		})
		
	} else {
		$.ajax({
				url: getContextPath() + '/commPage/comm_myCourseDetail/addLike.do',
				type: 'POST',
				dataType: 'json',
				data: { mycourse_no },
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
				console.log("좋아요 추가 완료");
				isLike();
		        }
		})
	}
});
//====좋아요 기능 끝

//글삭제
$("#delete-btn").on("click",function() {
		if(confirm("삭제하시겠습니까?")){
		location.href = getContextPath()+"/commPage/comm_myCourseDeleteOk.do?mycourse_no="+mycourse_no;
		return true;
	}else{
		return false;
	}
})
	
	/**댓글 등록하기 ajax */
	function cmt_add(){

		var comment_text=$('#comment_text').val();
		$.ajax({
					url: getContextPath() + '/commPage/comm_myCourseDetail/comment',
					type: 'POST',
					dataType: 'json',
					data: { mycourse_no, comment_text },
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
				$.ajax({
					url: getContextPath() + '/commPage/comm_myCourseDetail/comment',
					type: 'GET',
					dataType: 'json',
					data: { mycourse_no },
					success: function(data) {
						var str = [];
						for(var i =0; i<data.cmtList.length; i++){
							var photo=data.cmtList[i].user_photo;
							if(data.cmtList[i].user_photo==null){
								photo=getContextPath()+'/assets/img/profile_default.png'
								}
						 str[i]='<div id="cmt-item-'+i+'"><div class="row" style="margin: 15px 0px 0 15px;">'
							str[i]+='<div class="pull-left writer_profile">'
							str[i]+='<a href="#"><img style="border-radius: 25px"'
							str[i]+='src=\''+photo+'\' width="50px"'
							str[i]+='height="50px"></img></a></div>'
							str[i]+='<div class="pull-left writer_info"  style="margin-left: 10px; margin-top:-8px;">'
							str[i]+='<h4>'+data.cmtList[i].comment_user_nick+'</h4>'
							str[i]+='<p style="color:#979797;">'+data.cmtList[i].comment_create_datetime+'</p></div>'
							str[i]+='<div class="pull-right">'
							str[i]+='<button type="button" class="btn btn-link" style="padding: 0; margin-right: 0" onclick="cmt_delete('+data.cmtList[i].comment_no+')">댓글 삭제</button></div></div><div class="row">'
							str[i]+='<div class="col-md-offset-1 col-md-11" style="margin-left:2%; font-size:20px;">'+data.cmtList[i].comment_text+'</div>'
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
					url: getContextPath() + '/commPage/comm_myCourseDetail/comment',
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
		
		
//카카오맵 지도 정보
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center: new kakao.maps.LatLng(37.5160832, 126.9661696), // 지도의 중심좌표
		level: 4, // 지도의 확대 레벨
		mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
	};
var course_name = $('#mycourse_name').data('mycoursename');
	var mycourse_no = $('#mycourse_name').data('mycourseno');


//

	
$(function() {
	/**지도 불러오기 **/
	map = null;
	var map = new kakao.maps.Map(mapContainer, mapOption);
	$.ajax({
		url: getContextPath() + '/commPage/comm_myCourseDetailGetLoc.do',
		type: 'post',
		data: { course_name },
		success: function(data) {
			var linepath = [];
			var lat = [];
			var lon = [];
			for (var i = 0; i < data.courseName.length; i++) {

				lat[i] = parseFloat(data.courseName[i].lat);
				lon[i] = parseFloat(data.courseName[i].lon);
				linepath[i] = new kakao.maps.LatLng(parseFloat(data.courseName[i].lat), parseFloat(data.courseName[i].lon));
			};
			// 지도에 선을 표시한다 
			var polyline = new kakao.maps.Polyline({
				map: map, // 선을 표시할 지도 객체 
				path: linepath,
				strokeWeight: 2, // 선의 두께
				strokeColor: '#FF0000', // 선 색
				strokeOpacity: 1, // 선 투명도
				strokeStyle: 'solid' // 선 스타일
			});
			// 지도에 마커를 생성하고 표시한다
			var marker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(lat[0], lon[0]), // 마커의 좌표
				map: map // 마커를 표시할 지도 객체
			});
			// 지도 중심 좌표 변화 이벤트를 등록한다
			kakao.maps.event.addListener(map, 'center_changed', function() {
				console.log('지도의 중심 좌표는 ' + map.getCenter().toString() + ' 입니다.');
			});
			map.setCenter(new kakao.maps.LatLng(lat[0], lon[0]));

			// 도형에 mouseover 이벤트를 등록한다 
			kakao.maps.event.addListener(polyline, 'mouseover', function() {
				console.log('도형에 mouseover 이벤트가 발생했습니다!');
			});

			// 도형에 mouseout 이벤트를 등록한다 
			kakao.maps.event.addListener(polyline, 'mouseout', function() {
				console.log('도형에 mouseout 이벤트가 발생했습니다!');
			});

			// 도형에 mousedown 이벤트를 등록한다
			kakao.maps.event.addListener(polyline, 'mousedown', function() {
				console.log('도형에 mousedown 이벤트가 발생했습니다!');
			});
		}
	});
	/**지도 불러오기 끝*/
	
	//댓글 목록 표시 함수 호출
	cmt_list();
	//좋아요 검사 함수 호출
	isLike();
});




