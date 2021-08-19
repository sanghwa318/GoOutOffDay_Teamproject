<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<link
	href="${pageContext.request.contextPath}/assets/plugins/drag-drop-image-uploader/dist/image-uploader.min.css"
	rel="stylesheet">

<style type="text/css">
.profile_info {
	padding-top: 60px;
}

.profileimage {
	padding-top: 30px;
}
</style>
</head>
<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 상단영역 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- 본문영역 -->
		<div class="container">
			<h1 class="page-header">마이페이지</h1>
			<div class="row">
				<div class="col-md-3 col-md-offset-1 col-xs-3  profileimage"
					style="width: 230px">
					<form id="uploadForm">
						<div class="form-group">
							<img id="img__wrap"
								onerror="this.src='${pageContext.request.contextPath}/assets/img/profile_default.png'"
								src="${login_info.getUser_photo().getFileUrl()}" width="200px"
								height="200px" style="border-radius: 100px" />
						</div>
						<div class="form-group text-center bg-light">
							<label for="user_photo" class=" btn btn-default">프로필 사진
								변경</label> <input type="file" name="user_photo" id="user_photo"
								class="hidden" /> 
								<button type="submit"
								name="userProfile_apply" id="userProfile_apply" class="btn btn-default" >적용</button>
						</div>
						<input type="hidden" name="id"
							value="${sessionScope.principal.id}" />
					</form>
				</div>
				<div class="col-md-7 col-md-offset-1 col-xs-6 col-xs-offset-1 profile_info">
					<h4>ID: ${login_info.getUser_id()}</h4>
					<h4>닉네임: ${login_info.getUser_nick()}</h4>
					<h4>
						휴대폰 번호: ${login_info.getTel()}
					</h4>
					<h4>
						주소: ${login_info.getAddress1()}&nbsp;${login_info.getAddress2()}
					</h4>
					<h4>
						이메일: ${login_info.getEmail()}
					</h4>
					<h4>
						가입일:${login_info.getCreate_datetime()}
					</h4>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-11 col-md-offset-1">
					<div class="pull-left">
						<a href="${pageContext.request.contextPath}/myPage/myPage_inquiry.do" class="btn btn-default">1:1 문의</a>
					</div>
					<div class="pull-right">
						<a href="${pageContext.request.contextPath}/myPage/myPage_accountEdit.do" class="btn btn-default">계정 관리</a>
						<a href="${pageContext.request.contextPath}/myPage/myPage_accountOut.do" class="btn btn-default">회원 탈퇴</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../inc/Footer.jsp"%>


	<%@ include file="../inc/plugin.jsp"%>


	<script type="text/javascript">
		$('#user_photo').on("change", function(e) {
			var f = e.target.files[0];

			if (!f.type.match("image*")) {
				swal('에러',"이미지만 첨부할 수 있습니다.",'error');
				$("#user_photo").val('');
				return;
			}

			if (f.size > 1024 * 1024 * 2) {
				swal('에러',"이미지는 2MB 이하만 가능합니다.",'error');
				$('#user_photo').val('');
				return;
			}
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#img__wrap').attr("src", e.target.result);
			};
			reader.readAsDataURL(f);
		});
		
		$(function(){
			$('#userProfile_apply').on('click', function(e){
				e.preventDefault();
				var form= $('#uploadForm')[0];
				var formData=new FormData(form);
			    $.ajax({
			        url : getContextPath()+'/myPage/myPage_index_image_ok.do',
			        type : 'POST',
			        data : formData,
			        contentType : false,
			        processData : false,
			        success:function(data){
			        	swal({
							title: "성공",
							text: '프로필 사진이 변경되었습니다',
							type: "success"
						}).then(function(){
							window.location.reload();
						})
			        },error:function(data,status,error){
						swal({
							title: "에러",
							text: data.responseJSON.rt,
							type: "error"
						})
						return false; // <-- 실행 중단
			        }
			    })
			})
		})
		
	</script>
</body>
</html>