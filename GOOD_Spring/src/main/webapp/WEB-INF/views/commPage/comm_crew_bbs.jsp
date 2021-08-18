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
.title-img>img {
   width: 200px;
   height: 100px;
}

#crew_middle {
   padding-left: 40px;
}

.col-md-6 {
   margin-left: 40px;
}

.col-md-4 {
   margin-left: 350px;
}

.out {
   padding-bottom: 30px;
}

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

.form-group img{
	max-hieght: 100%;
	min-width: 100%;
	height: 180px;
}
</style>
</head>
<body>
   <!-- [페이지네이션] -->
   <c:set var="URL" value="/commPage/comm_crew_bbs.do" />
   <!-- //[페이지네이션] -->
   <!-- 상단영역 -->
   <div class="wrapper">

      <%@ include file="/WEB-INF/views/inc/Header.jsp"%>
      <!-- 본문영역 -->
      <div class="container">
         <!-- 대제목 -->
         <div class="row main_header">
            <h1 class="page-header page-title" id="cas_header"
               onclick="location.href='${pageContext.request.contextPath}/commPage/comm_index.do'"
               style="cursor: pointer; color: #343a40;">
               <span class="test01">커뮤니티<img
                  src="${pageContext.request.contextPath}/assets/icon_img/커뮤니티 아이콘.png;" />
               </span>
            </h1>
         </div>
         <h1 class="page-header">${output.crew_name} 크루</h1>

         <!-- 본문 상단 영역 -->
         <div class="crew_bbs_header "></div>
         <!-- //본문 상단 영역 -->
         <!-- 본문 중단1 영역 -->
         <div class="crew_ibbs_middle1">
            <div id="crew_middle" class="col-md-3 col-xs-4 col-sm-4">
               <div class="form-group">
                  <span class="title-img"><img
                     src="${output.crew_photo.fileUrl}"> <span class='sr-only'>이미지</span>
                  </span>
                  <h3>가입된 회원 수 : ${output.crew_member}명</h3>
                  <h3 >간단 소개말</h3>
                   <h4 >${output.crew_sinto}</h4>
               </div>
            </div>
            <!-- 크루 상세 정보  -->
            <div class="col-md-6 col-sm-5 col-xs-5 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" style="margin-top:-4%">
					<h2>크루 공지사항(설명)</h2>
					<div class="col-md-3 col-sm-4" style="border: 4px dotted #eeee; min-height:150px; min-width:130%"><p style="font-size:30px; margin:1% 0 0 1%">${output.crew_dinto}</p></div>
				</div>
            <!-- 크루 상세 정보 끝 -->

         </div>
         <!--// 본문 중단1 영역 -->
         <!-- 본문 중단2 영역 -->
         <div class="crew_bbs_middle2">
            <h1 class="col-md-12 col-sm-12 col-xs-12">자유게시판</h1>
            <table
               class="table table-striped table-bordered table-hover col-md-12 col-sm-12 col-xs-12">
               <thead>
                  <tr class="active">
                     <th class="text-center">게시글 번호</th>
                     <th class="text-center">제목</th>
                     <th class="text-center">작성자</th>
                     <th class="text-center">작성일</th>
                     <th class="text-center">조회수</th>
                  </tr>
               </thead>
               <tbody id="list">
                  <!-- 크루 게시물 영역 -->
                  <c:choose>
                     <%--조회결과가 없는 경우 --%>
                     <c:when test="${crewpostoutput != null && fn:length(crewpostoutput) != 0 }">
                        <!--조회 결과에 따른 반복 처리 -->
                        <c:forEach var="item" items="${crewpostoutput}"
                           varStatus="status">
                           
                           <%-- 검색어가 있다면? --%>
                           <c:if test="${keyword != '' }">
                              <%-- 검색어에 <mark> 적용 --%>
                              <c:set var="mark" value="<mark>${keyword}</mark>" />
                              <%--출력을 위해 크루 게시물에서 검색어와 일치하는 단어를 형광펜 효과 --%>
                              <c:set var="post_title"
                                 value="${fn:replace(post_title,keyword,mark)}" />
                              <c:set var="post_content"
                                 value="${fn:replace(post_content,keyword,mark)}" />
                           </c:if>

                           <%-- 상세페이지로 이동하기위한 URL --%>
                           <c:url value="/commPage/comm_crew_post.do" var="postUrl">
                              <c:param name="post_no" value="${item.post_no}" />
                           </c:url>
                           

                           <tr onclick="location.href='${postUrl}'"  style="cursor: pointer;">
                              <td class="text-center">${item.post_no}</td>
                              <td class="text-center">${item.post_title}</td>
                              <td class="text-center">${item.user_nick}</td>
                              <td class="text-center">${item.post_createdate}</td>
                              <td class="text-center">${item.post_hits}</td>
                           </tr>

                        </c:forEach>
                       
                     </c:when>

                     <%--조회결과가 없는 경우 --%>
                     <c:otherwise>
						 <tr>
                           <td class="text-center" colspan="5">등록된 게시글이 없습니다.</td>
                        </tr>
                     </c:otherwise>


                  </c:choose>
               </tbody>
            </table>
            <div class="clearfix">
            <c:if test="${output.user_info_user_no == login_info.getUser_no()}">
            <div class="pull-left">
            <input type="hidden" id="crew-del" name="crew-del" value="${output.crew_no}" />
            <button type='submit' id="crew_del" class="btn btn-danger pull-left">크루해체</button>
            </div>
            </c:if>
            <div class="form-group" >
            <form class="form-horizontal" action="${pageContext.request.contextPath}/commPage/comm_crew_bbs.do" method="GET">
               <div class="col-md-7 col-sm-4 col-xs-3 col-md-offset-2 col-sm-offset-3 col-xs-offset-2" role="search">
                  <div class="form-group input-group">
                        <input type="text" class="form-control" name="keyword"
                           placeholder="게시글 검색"> <span class="input-group-btn">
                     <input type="hidden" id="crew_no" name="crew_no"
                     value="${output.crew_no}" />
                     <input type="hidden" id="crew_name" name="crew_name"
                     value="${output.crew_name}" />
                           <button class="btn btn-blue" type="submit">
                              <i class="glyphicon glyphicon-search"></i>
                           </button>
                        </span>
                     
                  </div>
               </div>
				</form>
				
               <form 
                  action="${pageContext.request.contextPath}/commPage/comm_crew_postWrite.do"
                  method="GET">
                  <input type="hidden" name="post_crew" value="${output.crew_name}" />
                  <input type="hidden" id="crew_no" name="crew_no"
                     value="${output.crew_no}" />

                  <button type="submit" id="btn1" class="btn btn-primary pull-right">글쓰기</button>
               </form>
                <c:if test="${output.user_info_user_no == login_info.getUser_no()}">
               <form 
                  action="${pageContext.request.contextPath}/commPage/comm_crew_memberJoin.do"
                  method="GET">
                  <input type="hidden" name="crew_crew_no" value="${output.crew_no}" />
                  <button type="submit" id="btn2" class="btn btn-primary pull-right" style="margin-right:0.5%">크루관리</button>
               </form>
               </c:if>
               <!-- 탈퇴버튼 -->
               <div >
                  <input type="hidden" id="crew_no" name="crew_no"
                     value="${output.crew_no}" />
                  <button type='submit' id="out" class="btn btn-danger pull-right" style="margin-right:0.5%">탈퇴하기</button>
               </div>
            </div>
            </div>
         </div>
      </div>
   </div>

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
					<c:param name="crew_no" value="${output.crew_no}" />
					<c:param name="crew_name" value="${output.crew_name}" />
					<c:param name="page" value="${pageData.prevPage}" />
					<c:param name="keyword" value="${keyword}" />
				</c:url>
				<li class="page-item"><a href="${prevPageUrl}">&laquo;</a></li>
			</c:when>
		</c:choose>

		<%-- 페이지 번호 (시작 페이지 부터 끝 페이지까지 반복) --%>
		<c:forEach var="i" begin="${pageData.startPage}"
			end="${pageData.endPage}" varStatus="status">
			<%-- 이동할 URL 생성 --%>
			<c:url value="${getList }" var="pageUrl">
				<c:param name="crew_no" value="${output.crew_no}" />
				<c:param name="crew_name" value="${output.crew_name}" />
				<c:param name="page" value="${i}" />
				<c:param name="keyword" value="${keyword}" />
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
					<c:param name="crew_no" value="${output.crew_no}" />
					<c:param name="crew_name" value="${output.crew_name}" />
					<c:param name="page" value="${pageData.nextPage}" />
					<c:param name="keyword" value="${keyword}" />
				</c:url>
				<li class="page-item"><a href="${nextPageUrl}">&raquo;</a></li>
			</c:when>
		</c:choose>
	</ul>
</div>
<!-- //페이지네이션 -->

   
   
   
   <!--// 본문 하단 영역 -->
   <%@ include file="../inc/Footer.jsp"%>


   <%@ include file="../inc/plugin.jsp"%>



</body>
<script>
	let crew_no='${output.crew_no}';
	let crew_name='${crew_name}'
   $("#out")
         .click(
               function() {

                  event.preventDefault();
                  // 확인, 취소버튼에 따른 후속 처리 구현
                  swal({
                     title : '확인', // 제목
                     text : "해당 크루에서 탈퇴 하시겠습니까?", // 내용
                     type : 'question', // 종류   
                     confirmButtonText : '네', // 확인버튼 표시 문구
                     showCancelButton : true, // 취소버튼 표시 여부
                     cancelButtonText : '아니오', // 취소버튼 표시 문구
                  })
                        .then(
                              function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
                                 if (result.value) { // 확인 버튼이 눌러진 경우

                                    window.location.href = getContextPath()+ "/commPage/comm_crew_bbs_delete_ok?crew_no="+ ${output.crew_no};

                                 } else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
                                    swal('취소', '탈퇴가 취소되었습니다.',
                                          'error');
                                 }

                              });
               });
</script>
<script>

      $("#crew_del").click(function() {

         event.preventDefault();      
         // 확인, 취소버튼에 따른 후속 처리 구현
         swal({
            title : '확인', // 제목
            text : "해당 크루를 해체하시겠습니까?", // 내용
            type : 'question', // 종류   
            confirmButtonText : '네', // 확인버튼 표시 문구
            showCancelButton : true, // 취소버튼 표시 여부
            cancelButtonText : '아니오', // 취소버튼 표시 문구
         }).then(function(result) { // 버튼이 눌러졌을 경우의 콜백 연결
            if (result.value) { // 확인 버튼이 눌러진 경우
            	$.ajax({
					url: getContextPath() +"/commPage/comm_crew_bbs_deletecrew.do?crew_no="+ crew_no,
					method:'post',
					data: {crew_no},
					success:function(json){
						swal('성공', crew_name+' 크루가 해체 되었습니다.', 'success' 
							).then(function(result){
							window.location.href=getContextPath()+"/commPage/comm_crew.do"
						});
					},error:function(data, status, error){
						var error_msg =data.responseJSON.rt
						swal({
							title : "에러",
							text :error_msg,
							type : "error"
							})
					return false; // <-- 실행 중단
					}
				});

            } else if (result.dismiss === 'cancel') { // 취소버튼이 눌러진 경우
               swal('취소', '해체가 취소되었습니다.', 'error');
            }

         });
      });
   </script>
</html>