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
							<th class='text-center'>가입일시</th>
							<th class='text-center'>방문수</th>
							<th class='text-center'>최종접속일</th>
						</tr>
					</thead>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#">  </a></td>
						<td class='text-center' rowspan="1">김아무개</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 2 </a></td>
						<td class='text-center' rowspan="1">동해물과</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 3 </a></td>
						<td class='text-center' rowspan="1">백두산이</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 4 </a></td>
						<td class='text-center' rowspan="1">마르고</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 5 </a></td>
						<td class='text-center' rowspan="1">닳도록</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 6 </a></td>
						<td class='text-center' rowspan="1">하느님이</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 7 </a></td>
						<td class='text-center' rowspan="1">보우하사</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
					<tr class="member-item member-item-001">
						<td class='text-center' rowspan="1"><input type='checkbox'
							name='member_id[]' class="member_id" value="001" checked /></td>
						<td class='text-center' rowspan="1"><a href="#"> 8 </a></td>
						<td class='text-center' rowspan="1">우리나라</td>
						<td class='text-center'>kim</td>
						<td class='text-center'>2021-06-11</td>
						<td class='text-center text-primary'><span class='visit'
							data-value=""> 300</span></td>
						<td class='text-center'><span class='regdate' data-value="">
								2021-06-23</span></td>
					</tr>
				</table>
				<hr />
				<div class="text-center">
					<button type="button" class="btn btn-danger" id="check-delete">회원
						추방</button>
						<button type="button" class="btn btn-info" id="check-back" 	
					onClick="history.back(); return false;">뒤로가기</button>
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
</body>
</html>