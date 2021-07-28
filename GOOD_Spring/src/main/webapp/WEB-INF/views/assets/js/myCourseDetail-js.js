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
					}
		});
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
						 str[i]='<div id="cmt-item-'+i+'"><div class="row" style="margin: 15px 0px 0 15px;">'
							str[i]+='<div class="pull-left writer_profile">'
							str[i]+='<a href="#"><img style="border-radius: 25px"'
							str[i]+='onerror="this.src=\''+getContextPath()+'/assets/img/profile_default.png\'"'
							str[i]+='src="${sessionScope.principal.userProfile}" width="50px"'
							str[i]+='height="50px"></img></a></div>'
							str[i]+='<div class="pull-left writer_info" style="margin-left: 15px;">'
							str[i]+='<h4>'+data.cmtList[i].comment_user_nick+'</h4>'
							str[i]+='<p>'+data.cmtList[i].comment_create_datetime+'</p></div>'
							str[i]+='<div class="pull-right">'
							str[i]+='<button type="button" class="btn btn-link test1" style="padding: 0; margin-right: 0" onclick="cmt_delete('+data.cmtList[i].comment_no+')">댓글 삭제</button></div></div><div class="row">'
							str[i]+='<div class="col-md-offset-1 col-md-11" style="margin-left: 10px;">'+data.cmtList[i].comment_text+'</div>'
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
						alert("삭제되었습니다.")
						cmt_list()
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
	console.log(course_name)
	console.log(mycourse_no)

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
});




