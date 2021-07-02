<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>

<style type="text/css">
.main_header>h1 {
	position: relative;
	text-align: center;
	transition: all 0.3s ease;
	transform: translateY(0);
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
		<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/adminPage/admin_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<!-- 제목영역 -->
			<h1 class="page-header">회원 목록</h1>
			<!-- 리스트영역-->
			<form id="member-form" class="form-horizontal">
				<table class='table'>
					<colgroup>
						<col width="50" />
						<col width="50" />
						<col width="100" />
						<col width="100" />
						<col width="100" />
						<col width="50" />
						<col width="120" />
						<col width="150" />
						<col width="150" />
						<col width="100" />
						<col width="100" />
						<col width="50" />
					</colgroup>
					<thead>
						<tr>
							<th class='text-center'><input type="checkbox"
								name="all_check" id="all_check" checked /></th>
							<th class='text-center'>#</th>
							<th class='text-center'>이름</th>
							<th class='text-center'>아이디</th>
							<th class='text-center'>닉네임</th>
							<th class='text-center'>성별</th>
							<th class='text-center'>연락처</th>
							<th class='text-center'>이메일</th>
							<th class='text-center'>주소</th>
							<th class='text-center'>방문수</th>
							<th class='text-center'>가입일</th>
							<th class='text-center'>수정</th>
						</tr>
					</thead>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 1 </a></td>
						<td class='text-center' rowspan="1">회원이름 1</td>
						<td class='text-center'>회원 ID</td>
						<td class='text-center'><input type="text" class='nickname'
							data-value="" value="닉네임" style="width: 100%"></td>
						<td class='text-center'><select id="gender" class='gender'
							style="height: 26px;">
								<option value="M">남</option>
								<option value="F">여</option>
						</select></td>
						<td class='text-center'><input type="text" class='tel'
							data-value="" value="010-1234-5678" style="width: 100%"></td>
						<td class='text-center'><input type="text" class='email'
							data-value="" value="abc@def.ghi" style="width: 100%"></td>
						<td class='text-center'><input type="text"
							class='useraddress' data-value="" value="주소" style="width: 100%"></td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-11</span></td>
						<td class="text-center">
							<button class="btn btn-update btn-default btn-xs"
								data-member-id="001" data-member-name="회원이름 1">수정</button>
						</td>
					</tr>
				</table>
				<hr />
				<div class="text-center">
					<button type="button" class="btn btn-warning" id="check-delete">회원
						탈퇴</button>
				</div>
			</form>
			<!-- //리스트영역 끝-->
			<!-- //미디어 아이템 끝 -->
			<!-- //리스트영역 끝-->
		</div>
		<!-- //본문영역 끝 -->
	</div>
	<div></div>
	<!-- 하단영역 -->
	<%@ include file="../inc/Footer.jsp"%>
	<%@ include file="../inc/plugin.jsp"%>
	<script type="text/javascript">
	$(function() {
		$(".btn-update").click(function(e) {
	        e.preventDefault();
	        const current = $(this);
	        const memberId = current.data('member-id');
	        const memberName = current.data('member-name');
	
	        swal({
	            title: '확인',
	            text: '정말 ' + memberName + '(을)를 수정하시겠습니까?',
	            type: "question",
	            showCancelButton: true
	        }).then(function(result) {
	            if (result.value) {
	                $.delete(ROOT_URL + "", {
	                    member_id: [memberId] // 배열로 묶어서 전송
	                }, function(json) {
	                    $('.member-item-' + memberId).remove();
	                });
	            }
	        });
	    });
		$("#all_check").change(function() {
	        $(".member_id").prop('checked', $(this).is(':checked'));
		});
	        $("#check-delete").click(function() {
	            const memberId = [];
	            const obj = $(".member_id:checked");
	
	            if (obj.length < 1) {
	                swal('알림', '선택된 항목이 없습니다.');
	                return false;
	            }
	
	            swal({
	                title: '확인',
	                text: '정말 ' + obj.length + '개의 항목을 삭제하시겠습니까?',
	                type: "question",
	                showCancelButton: true
	            }).then(function(result) {
	                if (result.value) {
	                    obj.each(function(i, v) {
	                    	memberId.push($(v).val());
	                    });
	
	                    $.delete(ROOT_URL + "", {
	                    	member_id: memberId
	                    }, function(json) {
	                        swal({
	                            title: '확인',
	                            text: '삭제되었습니다.'
	                        }).then(function(result) {
	                            obj.each(function(i, v) {
	                                $('.member-item-' + $(v).val()).remove();
	                            });
	                            $('html, body').animate({scrollTop : 0}, 400);
	                        });
	                    });
	                }
	            });
	        });
	});

	</script>
</body>
</html>