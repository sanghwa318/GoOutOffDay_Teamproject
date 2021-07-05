<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
</head>

<body>
   <!-- 푸터빼고 감싸주세요 -->
   <div class="wrapper">
      <!-- 공통 헤더 -->
      <%@ include file="/WEB-INF/views/inc/Header.jsp"%>
      <!-- //공통 헤더 -->
      <!-- 컨테이너 -->
     <div class="container">
<h1 class="page-header">이용안내</h1>
      <div class="section v1">
			<h3><a href="${pageContext.request.contextPath}/bicyclePage/bicycle_index.do" class="a1">자전거</a></h3>
			<p>자전거 페이지에서는 현재 서울시에서 운영하고 있는 공공자전거 "따릉이"의 자전거 갯수 현황을 통한 대여가능 여부를 파악 하실 수 있습니다.</p>
			
			<h3><a href="${pageContext.request.contextPath}/walkPage/walk_index.jsp" class="a2">걷기</a></h3>
			<p>걷기 기록하기 버튼을 클릭!</p>
			<p>서울시에서 제공하는 두드림길 코스에 대한 검색을 통해 내가 마음에 드는 코스를 선택 후 시작 버튼을 눌러보세요!. 내가 얼마나 걸었는지 알 수 있습니다.</p>
			<p>걷기 페이지에서는 들어오시면 메인 페이지는 서울시 두드림길 코스 정보를 지도에 표시하고 있습니다.</p>
			<p>지도에서 표시되는 핀 클릭 시 등록된 간단 코스 정보가 제공됩니다.</p>
			<p>이용자들이 추천하는 다양하고 색다른 코스도 소개하고 있습니다.</p>
			<h3><a href="${pageContext.request.contextPath}/walkPage/walk_search.do" class="a3">코스목록</a></h3>
			<p>어디가 좋은 걷기 장소인지 궁금하십니까?</p>
			<p>내가 사는 곳에서 가깝고 걷기 좋은 장소를 찾으십니까?</p>
			<p>코스목록 페이지에서 나에게 맞는 코스를 직접 찾아보세요! 다양한 서울 두드림길 정보가 제공됩니다.</p>
			<h3><a href="${pageContext.request.contextPath}/walkPage/walk_log.do" class="a4">걷기 로그</a></h3>
			<p>아무 목적도 없이 걷기 싫으시다구요?</p>
			<p>다른 사람들과 비교하며 자신의 걷기 성과를 비교하고 싶으시다구요? </p>
			<p>걷기로그 페이지에서 목표 설정을 통해 커뮤니티의 가입된 크루원들과 나의 걷기 정보를 비교하고 자극 받아보세요!</p>
			<h3><a href="${pageContext.request.contextPath}/walkPage/walk_hallOfFame.do" class="a5">명예의 전당</a></h3>
			<p>나만 알기는 아쉬운 코스가 있다? 다른 사람들의 추천 코스도 걸어보고 싶다? 커뮤니티에서 많은 관심과 추천을 받으면 관리자 승인 후 명예의 전당 코스로 등록!!! 작성하여 명예의 전당에 도전하세요!</p>
			<h3><a href="${pageContext.request.contextPath}/casPage/cas_index.do" class="a6">문화체육</a></h3>
			<p>서울시에서 다양한 창의 체험, 공연, 전시, 문화, 자기 계발 프로그램, 체육 시설 등의 정보가 제공됩니다. </p>
			<h3><a href="${pageContext.request.contextPath}/commPage/comm_index.do" class="a7">커뮤니티</a></h3>
			<p>다양한 사람들과의 교류를 하고 싶으시다면 커뮤니티 페이지를 눌러보세요.</p>
			<p>나에게 맞는 크루를 선택하고 활동하며 소통을 해보세요.</p>
			<p>나에게 맞는 크루가 없다구요? 크루 페이지에서 크루를 개설하여 크루를 이끌어 보세요! 당신의 리더쉽을 보여줄 수 있는 기회!!</p>
			<p>마이크루 버튼은 클릭 시 내가 가입되어 있는 크루에 대한 정보 및 탈퇴를 할 수 있습니다.</p>
			<p>나만의 코스 게시판을 통해 명예의 전당에 도전하세요! </p>
			<h3><a class="a8">내가 쓴 글</a></h3>
			<p>내가 쓴 글을 통해 한번에 커뮤니티에서 작성한 글들을 모아서 볼 수 있습니다. </p>
			<h3><a class="a9">마이페이지</a></h3>
			<p>우측 상단에 있는 사람아이콘을 클릭해보세요.</p>
			<p>1:1 문의 및 계정 프로필 변경이 가능합니다.</p>
			<p>회원탈퇴 및 로그아웃이 가능합니다.</p>
			
		</div>
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
</body>
</html>