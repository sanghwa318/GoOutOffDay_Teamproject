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

.main_header>h1:hover {
	transform: translate(0, -10px);
}
/* Zebra striping */
thead tr:nth-of-type(odd) { 
  background: #eee; 
}
# table_list {
	margin-left: 30px;
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
			<div class="col-md-12 table-responsive" id="table_list">
				<table class='table table-bordered table-hover'>
					<thead>
						<tr class="active">
							<th class='text-center'>선택</th>
							<th class='text-center'>번호</th>
							<th class='text-center'>아이디</th>
							<th class='text-center'>닉네임</th>
							<th class='text-center'>이름</th>
							<th class='text-center'>성별</th>
							<th class='text-center'>연락처</th>
							<th class='text-center'>이메일</th>
							<th class='text-center'>도로명주소</th>
							<th class='text-center'>상세주소</th>
							<th class='text-center'>가입일시</th>
						</tr>
					</thead>
					<tbody id="list">
						<%-- 조회결과에 따른 반복 처리 --%>
						<c:choose>
							<%-- 조회 결과가 없는 경우 --%>
							<c:when test="${output == null || fn:length(output) == 0 }">
								<h1>조회결과가 없습니다.</h1>
							</c:when>

							<%-- 조회 결과가 있는 경우 --%>
							<c:otherwise>
							
								<c:forEach var="item" items="${output}">
									<c:if test="${keyword != ''}">
									<c:set var="mark" value="<mark>${keyword}</mark>" />
									<%--출력을 위해 검색어와 일치하는 단어를 형광펜 효과 --%>
									<c:set var="user_name" value="${fn:replace(user_name,keyword,mark)}" />
									</c:if>
									<c:if test="${!item.user_out}">
									<tr class="member-item member-item-001">
										<td align="center"><input type='radio' data-userid="${item.user_id}"
										data-useradmin="${item.user_admin}"
								 name='member_id' class="member_id" id="member_id" value="001" /></td>
										<td class='text-center'>${item.user_no}</td>
										<td class='text-center'>${item.user_id}</td>
										<td class='text-center'>${item.user_nick}</td>
										<td class='text-center'>${item.user_name}</td>
										<td class='text-center'>
										<c:if test="${item.gender eq 'M'}">남자</c:if> 
										<c:if test="${!item.gender eq 'Y'}">여자</c:if></td>
										<td class='text-center'>${fn:substring(item.tel, 0 ,3)}-${fn:substring(item.tel, 3 ,7)}-${fn:substring(item.tel, 7, 10)}</td>
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
				</div>
				<!-- 검색영역 -->
			         <form method="get"
			            action="${pageContext.request.contextPath}/adminPage/admin_member.do"
			            class="form-group pull-right">
			            <div class="form-group input-group col-md-3 col-sm-3 col-xs-4 pull-right">
			            <input type="search" name="keyword" id="keyword" class="form-control"
			               placeholder="이름으로 검색" value="${keyword}" /> <span
			               class="input-group-btn">
			               <button class="btn btn-blue" type="submit">
			                  <span style="color: #0069a6;"></span><i
			                     class="glyphicon glyphicon-search" style="color: #eeffff;"></i>
			               </button>
			            </span>
			            </div>
			         </form>
			<!-- //리스트영역 끝-->
			<!-- //미디어 아이템 끝 -->
			<!-- //리스트영역 끝-->
			 <!-- 페이지네이션 -->
            <div class="text-center">
               <!-- 페이지 번호 구현 -->
               <ul class="pagination">
                  <%-- 이전 그룹에 대한 링크 --%>
                  <c:choose>
                     <%-- 이전 그룹으로 이동 가능하다면? --%>
                     <c:when test="${pageData.prevPage > 0}">
                        <%-- 이동할 URL 생성 --%>
                        <c:url value="${getList }" var="prevPageUrl">
                           <c:param name="page" value="${pageData.prevPage}" />
                           <c:param name="keyword" value="${keyword}" />
                           <c:param name="category" value="${category}" />
                           <c:param name="area" value="${area}" />
                           <c:param name="order" value="${order}" />
                        </c:url>
                        <li class="page-item"><a href="${prevPageUrl}">&laquo;</a></li>
                     </c:when>
                  </c:choose>

                  <%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
                  <c:forEach var="i" begin="${pageData.startPage}"
                     end="${pageData.endPage}" varStatus="status">
                     <%-- 이동할 URL 생성 --%>
                     <c:url value="${getList }" var="pageUrl">
                        <c:param name="page" value="${i}" />
                        <c:param name="keyword" value="${keyword}" />
                        <c:param name="category" value="${category}" />
                        <c:param name="area" value="${area}" />
                        <c:param name="order" value="${order}" />
                     </c:url>

                     <%-- 페이지 번호 출력 --%>
                     <c:choose>
                        <%-- 현재 머물고 있는 페이지 번호를 출력할 경우 링크 적용 안함 --%>
                        <c:when test="${pageData.nowPage == i}">
                           <li class="page-item active"><span style="color: #fff;">${i}<span
                                 class="sr-only">(current)</span></span></li>
                        </c:when>
                        <%-- 나머지 페이지의 경우 링크 적용함 --%>
                        <c:otherwise>
                           <li class="page-item"><a href="${pageUrl}">${i}</a></li>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
                  <%-- 다음 그룹에 대한 링크 --%>
                  <c:choose>
                     <%-- 다음 그룹으로 이동 가능하다면? --%>
                     <c:when test="${pageData.nextPage > 0}">
                        <%-- 이동할 URL 생성 --%>
                        <c:url value="${getList }" var="nextPageUrl">
                           <c:param name="page" value="${pageData.nextPage}" />
                           <c:param name="keyword" value="${keyword}" />
                           <c:param name="category" value="${category}" />
                           <c:param name="area" value="${area}" />
                           <c:param name="order" value="${order}" />
                        </c:url>
                        <li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
                     </c:when>
                  </c:choose>
               </ul>
            </div>
            <!-- //페이지네이션 -->
			
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