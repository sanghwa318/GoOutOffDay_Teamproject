<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.main_header>h1:hover {
	transform: translate(0, -10px);
}

.main_header>h1>span>img {
	width: 3rem;
	height: 3rem;
	position: relative;
	left: 5px;
	bottom: 0px;
}
</style>
</head>

<body>
	<!-- 푸터빼고 감싸주세요 -->
	<div class="wrapper">
		<!-- 공통 헤더 -->
		<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<div class="container">
			<!-- 제목영역 -->
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">커뮤니티<img src="<%=request.getContextPath()%>/assets/icon_img/커뮤니티 아이콘.png" />
					</span>
				</h1>
			</div>
			<h1 class="page-header">크루회원 목록</h1>
			<!-- 리스트영역-->
			<form id="member-form" class="form-horizontal">
				<table class='table'>
					<colgroup>
						<col width="100" />
						<col width="100" />
						<col width="200" />
						<col width="200" />
						<col width="250" />
						<col width="200" />
						<col width="250" />
					</colgroup>
					<thead>
						<tr>
							<th class='text-center'>선택</th>
							<th class='text-center'>회원번호</th>
							<th class='text-center'>아이디</th>
							<th class='text-center'>닉네임</th>
							<th class='text-center'>게시글 수</th>
							<th class='text-center'>가입일시</th>
							<th class='text-center'>최종접속일</th>
						</tr>
					</thead>
					<tbody>
							<%-- 조회결과에 따른 반복 처리 --%>
							<c:forEach var="item" items="${output}">
							<c:set var="i" value="${i+1}" />
							<tr>
								<td align="center"><input type='radio' data-memberno="${item.member_no}"
								data-crewno="${item.crew_crew_no}" name='member_id' class="member_id"
								  id="member_id" value="001" /></td>
								<td align="center">${i}</td>
								<td align="center">${item.user_id}</td>
								<td align="center">${item.user_nick}</td>
								<td align="center">${item.member_no}</td>
								<td align="center">${item.member_create_datetime}</td>
								<td align="center">${item.member_visit_datetime}</td>
							</tr>
							</c:forEach>
					</tbody>
				</table>
				<hr />
				<div class="text-center">
					<button type="button" class="btn btn-danger" id="check-delete">추방하기</button>
						<button type="button" class="btn btn-info" id="check-back" 	
					onClick="location.href='${pageContext.request.contextPath}/commPage/comm_crew_bbs.do?crew_no=${output[0].crew_crew_no}'">뒤로가기</button>
					
				</div>
			</form>
			<!-- //리스트영역 끝-->
			<!-- //미디어 아이템 끝 -->
			<!-- //리스트영역 끝-->
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 공통 푸터 -->
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
	<!-- // js -->
	
	<script>
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
				swal('알림', '선택된 멤버가 없습니다.');
				setTimeout(function(){
					
				}, 1000);
				return false;
			}
			// 확인, 취소버튼에 따른 후속 처리 구현
			swal({
				title : '확인', // 제목
				text : "해당 회원을 크루에서 추방 하시겠습니까?", // 내용
				type : 'question', // 종류
				confirmButtonText : '네', // 확인버튼 표시 문구
				showCancelButton : true, // 취소버튼 표시 여부
				cancelButtonText : '아니오', // 취소버튼 표시 문구
			}).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
				if (result.value) { // 확인 버튼이 눌러진 경우
					var mn = $("#member_id:checked").data("memberno");
					var cn = $("#member_id:checked").data("crewno");
					window.location.href=getContextPath() +"/commPage/comm_crew_memberJoin_delete?member_no=" + mn +"&crew_crew_no=" + cn ;

				} else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
					swal('취소', '추방이 취소되었습니다.', 'error');
				}

			});
		});
	</script>
</body>
</html>