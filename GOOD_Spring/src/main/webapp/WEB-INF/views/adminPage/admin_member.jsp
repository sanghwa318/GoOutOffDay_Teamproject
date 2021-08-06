<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>

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
					onclick="location.href='${pageContext.request.contextPath}/adminPage/admin_index.do'"
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
							<th class='text-center'>선택</th>
							<th class='text-center'>회원번호</th>
							<th class='text-center'>아이디</th>
							<th class='text-center'>닉네입</th>
							<th class='text-center'>이름</th>
							<th class='text-center'>성별</th>
							<th class='text-center'>연락처</th>
							<th class='text-center'>이메일</th>
							<th class='text-center'>도로명주소</th>
							<th class='text-center'>상세주소</th>
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
									<c:if test="${!item.user_out}">
									<tr class="member-item member-item-001">
										<td align="center"><input type='radio' data-userid="${item.user_id}"
										data-useradmin="${item.user_admin}"
								 name='member_id' class="member_id" id="member_id" value="001" /></td>
										<td class='text-center'>${i}</td>
										<td class='text-center'>${item.user_id}</td>
										<td class='text-center'>${item.user_nick}</td>
										<td class='text-center'>${item.user_name}</td>
										<td class='text-center'>
										<c:if test="${item.gender eq 'M'}">남자</c:if> 
										<c:if test="${!item.gender eq 'Y'}">여자</c:if></td>
										<td class='text-center'>${fn:substring(item.tel, 0 ,3)}-${fn:substring(item.tel, 3 ,6)}-${fn:substring(item.tel, 6, 9)}</td>
										<td class='text-center'>${item.email}</td>
										<td class='text-center'>${item.address1}</td>
										<td class='text-center'>${item.address2}</td>
										<td class='text-center'>${item.create_datetime}</td>
									</tr>
								</c:if>
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
	 function getContextPath() {
	      var hostIndex = location.href.indexOf(location.host)
	            + location.host.length;
	      var contextPath = location.href.substring(hostIndex, location.href
	            .indexOf('/', hostIndex + 1));
	      return contextPath;
	   }
		$("#check-delete").click(function() {
			const delcrew = [];
			const obj = $(".member_id:checked");

			if (obj.length < 1) {
				swal('알림', '선택된 회원이 없습니다.');
				setTimeout(function(){
					
				}, 1000);
				return false;
			}
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "해당 회원을 추방 시키겠습니까?", // 내용
				type : 'question', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					var ui = $("#member_id:checked").data("userid");
				    var ua = $("#member_id:checked").data("useradmin")
					
					window.location.href=getContextPath() +"/adminPage/admin_member_delete?user_id=" + ui + "&user_admin=" + ua; 

				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '추방이 취소되었습니다.', 'error');
				}

			});
		});

	</script>
</body>
</html>