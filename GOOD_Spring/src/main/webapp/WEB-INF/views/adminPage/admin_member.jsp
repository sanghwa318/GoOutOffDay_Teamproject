<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
					onclick="location.href='../adminPage/admin_index.jsp'"
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
					</colgroup>
					<thead>
						<tr>
							<th class='text-center'><input type="checkbox"
								name="all_check" id="all_check" /></th>
							<th class='text-center'>#</th>
							<th class='text-center'>아이디</th>
							<th class='text-center'>닉네입</th>
							<th class='text-center'>이름</th>
							<th class='text-center'>성별</th>
							<th class='text-center'>연락처</th>
							<th class='text-center'>이메일</th>
							<th class='text-center'>주소</th>
							<th class='text-center'>방문수</th>
							<th class='text-center'>가입일시</th>
						</tr>
					</thead>
					<tbody>
						<%-- 조회결과에 따른 반복 처리 --%>
						<c:choose>
							<%-- 조회 결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0 }">
								<h1>조회결과가 없습니다.</h1>
							</c:when>

							<%-- 조회 결과가 있는 경우 --%>
							<c:otherwise>
								<c:forEach var="item" items="${output}">
									<c:set var="i" value="${i+1}" />
									<tr class="member-item member-item-001">
										<td class='text-center' rowspan="1"><input
											type='checkbox' name='member_id[]' class="member_id"
											value="001" /></td>
										<td class='text-center'>${i}</td>
										<td class='text-center'>${item.user_id}</td>
										<td class='text-center'>${item.user_nick}</td>
										<td class='text-center'>${item.user_name}</td>
										<td class='text-center'>
										<c:if test="${item.gender eq 'M'}">남자</c:if> 
										<c:if test="${!item.gender eq 'Y'}">여자</c:if></td>
										<td class='text-center'>${fn:substring(item.tel, 0 ,3)}-${fn:substring(item.tel, 3 ,6)}-${fn:substring(item.tel, 6, 9)}</td>
										<td class='text-center'>${item.email}</td>
										<td class='text-center'>${item.address1} &nbsp; ${item.address2}</td>
										<td class='text-center text-primary'><span class='visit'
											data-value=""> 300</span></td>
										<td class='text-center'>${item.create_datetime}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
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