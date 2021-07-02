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
		<!-- 공통 헤더 -->
		<%@ include file="../inc/Header.jsp"%>
		<!-- //공통 헤더 -->
		<!-- 컨테이너 -->
		<div class="container">
		<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../adminPage/admin_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">관리자페이지 </span>
				</h1>
			</div>
			<h1>1:1 문의 관리</h1>
			<hr />
			<!-- 카테고리 검색 -->
			<div class="container">
				<form class="form-horizontal" role="form">
					<fieldset>
						<div class="row">
							<div class="form-group col-sm-5">
								<label for="answer" class="col-sm-4 col-xs-3 control-label">답변상태
									: </label>
								<div class="col-sm-8 col-xs-9">
									<select class="form-control" id="answer">
										<option value="">완료/미완료</option>
										<option value="complete">완료</option>
										<option value="incomplete">미완료</option>
									</select>
								</div>
							</div>
							<div class="form-group col-sm-5">
								<label for="category" class="col-sm-4 col-xs-3 control-label">카테고리
									: </label>
								<div class="col-sm-8 col-xs-9">
									<select class="form-control" id="category">
										<option value="">전체</option>
										<option value="bicycle">자전거</option>
										<option value="walking">걷기</option>
										<option value="cultural_sports">문화체육</option>
										<option value="community">커뮤니티</option>
									</select>
								</div>
							</div>
							<div class="col-sm-2">
								<button
									class="btn btn-primary col-sm-offset-4 col-sm-8 col-xs-12"
									type="submit">검색</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
			<!-- //카테고리 검색 -->
			<!-- 문의글 목록 -->
			<div style="margin: 20px 0; border: 1px solid #eee;">
				<h2 class="text-center">-문의글목록-</h2>
				<table class="table table-bordered"
					style="width: 94% !important; margin: auto;">
					<thead>
						<tr>
							<th class="text-center">#</th>
							<th class="text-center">답변상태</th>
							<th class="text-center">카테고리</th>
							<th class="text-center">제목</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center">1</td>
							<td class="text-center">완료</td>
							<td class="text-center">걷기</td>
							<td class="text-center">코스등록 문의드립니다.</td>
						</tr>
						<tr>
							<td class="text-center">2</td>
							<td class="text-center">미완료</td>
							<td class="text-center">문화체육</td>
							<td class="text-center">행사정보가 잘못되었습니다.</td>
						</tr>
						<tr>
							<td class="text-center">3</td>
							<td class="text-center">완료</td>
							<td class="text-center">커뮤니티</td>
							<td class="text-center">정채원입니다.</td>
						</tr>
					</tbody>
				</table>
				<!-- 페이지네이션 -->
				<div class="text-center">
					<ul class="pagination">
						<li class="page-item disabled"><a href="#">&laquo;</a></li>
						<li class="page-item active"><span>1<span
								class="sr-only">(current)</span></span></li>
						<li class="page-item"><a href="#">2</a></li>
						<li class="page-item"><a href="#">3</a></li>
						<li class="page-item"><a href="#">4</a></li>
						<li class="page-item"><a href="#">5</a></li>
						<li class="page-item"><a href="#">&raquo;</a></li>
					</ul>
				</div>
				<!-- //페이지네이션 -->
			</div>
			<!-- //문의글 목록 -->
		</div>
		<!-- //컨테이너 -->
	</div>
	<!-- //푸터빼고 감싸주세요 -->
	<!-- 공통 푸터 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- //공통 푸터 -->
	<!-- js -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- // js -->
</body>
</html>