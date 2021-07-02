<%@page import="java.net.URLEncoder"%>
<%@page import="study.jsp.model1.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
WebHelper webHelper = WebHelper.getInstance(request, response);
request.setCharacterEncoding("UTF-8");

String cas = request.getParameter("cas");

String result = null;
String iconurl = null;

if (cas == null || cas.equals("")) {
	String script = "<script>";
	script += "alert('값이 없습니다. 이전페이지로 돌아갑니다.');";
	script += "history.back();";
	script += "</script>";

	out.print(script);
	webHelper.redirect("cas_index.jsp", null);
	return;
}

if (cas.equals("exp")) {
	result = "문화 창의 체험";
	iconurl = "'../icon_img/창의 체험 아이콘.png'";
} else if (cas.equals("showExh")) {
	result = "공연 전시";
	iconurl = "'../icon_img/공연전시문화 아이콘.png'";
} else if (cas.equals("imp")) {
	result = "교육 자기 계발";
	iconurl = "'../icon_img/자기계발 아이콘.png'";
} else if (cas.equals("sportsFac")) {
	result = "체육시설";
	iconurl = "'../icon_img/체육시설 아이콘.png'";
}
%>
<!doctype html>
<html>
<head>
<%@ include file="../inc/head.jsp"%>
<style type="text/css">
/** 공통 영역 **/
* {
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
	width: 100%;
}

.body a {
	text-decoration: none;
}

.body p {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.body .row {
	padding-bottom: 20px;
	width: auto;
	margin: auto;
}

.body .main_header {
	padding-bottom: 0;
}

.body h4 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	min-height: 38px;
	margin-top: 0;
}

.header h1 {
	position: relative;
}

.cas_list .header h1:after {
	content: "";
	background-image: url(<%=iconurl%>);
	background-size: 100% 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	margin-left: 10px;
	position: absolute;
	top: 2px;
}

.item .caption {
	border-top: 1px solid rgba(102, 109, 117, 0.32);
}

/** 태그 정렬 **/
.orderBy_tag {
	padding-bottom: 15px;
}

.orderBy_tag .cas_category {
	padding: 0 10px;
	font-size: 15px;
	color: #343a40;
}

.cas_category.active {
	color: #0098ed;
}

/** 호버 CSS **/
.item {
	position: relative;
	transition: all 0.3s ease;
	transform: translateY(0);
	padding: 0;
}

.item:hover {
	transform: translate(0, -2px);
	box-shadow: 0 2px 4px rgba(102, 109, 117, 0.4);
}

/** item부분 영역 **/
.casItem {
	padding-right: 10px;
	padding-left: 10px;
	padding-bottom: 30px;
}

.body .header {
	padding-bottom: 10px;
	padding-top: 20px;
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
	bottom: 5px;
}

.cas_item .item img {
	height: 180px;
	border-top-left-radius: 4px;
	border-top-right-radius: 4px;
	max-height: 100%;
	min-width: 100%;
}

.order_tag {
	padding-bottom: 10px;
	padding-left: 5px;
}

/*찜하기 버튼*/
.heart {
	z-index: 1000;
	cursor: pointer;
	width: 30px;
	height: 30px;
}

.heart i {
	margin-left: 8px;
}

.fa-heart-o {
	color: red;
	cursor: pointer;
}

.fa-heart {
	color: red;
	cursor: pointer;
}


/** 색상설정 **/
.body .cas_item .caption p {
	color: #848c94;
}

.body .cas_item .caption h4 {
	color: #495056;
}
</style>
</head>
<body>
	<!-- 상단영역 시작 -->
	<%@ include file="../inc/Header.jsp"%>
	<!-- // 상단영역 끝 -->
	<!-- 본문영역 시작 -->
	<div class="container">
		<div class="body">
			<!-- 대제목 -->
			<div class="row main_header">
				<h1 class="page-header page-title" id="cas_header"
					onclick="location.href='../casPage/cas_index.jsp'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">문화 체육<img
						src="../icon_img/문화체육 아이콘.png;" />
					</span>
				</h1>
			</div>
			<!-- 본문 게시판 시작 -->
			<div class="row cas_list">
				<!-- cas 최상단 제목 -->
				<div class="header">
					<h1 style="color: #343a40;"><%=result%></h1>
				</div>
				<div class="orderBy_tag">
					<!-- 창의 체험 -->
					<%
					if (cas.equals("exp")) {
					%>
					<a href='../casPage/cas_themeList.jsp?cas=<%=cas%>'
						class='cas_category active' data-filter='전체'>전체</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=교육체험'
						id='orderby' class='cas_category' data-filter='교육체험'>교육체험</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=농장체험'
						id='orderby' class='cas_category' data-filter='농장체험'>농장체험</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=문화행사'
						id='orderby' class='cas_category' data-filter='문화행사'>문화행사</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=전시관람'
						id='orderby' class='cas_category' data-filter='전시/관람'>전시/관람</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=기타'
						id='orderby' class='cas_category' data-filter='기타'>기타</a>
					<%
					}
					%>

					<!-- 공연 전시 문화 -->
					<%
					if (cas.equals("showExh")) {
					%>
					<a href='../casPage/cas_themeList.jsp?cas=<%=cas%>'
						class='cas_category active' data-filter='전체'>전체</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=대중음악'
						id='orderby' class='cas_category' data-filter='대중음악'>대중음악</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=기획전시'
						id='orderby' class='cas_category' data-filter='기획전시'>기획전시</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=오페라'
						id='orderby' class='cas_category' data-filter='오페라'>오페라</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=연극'
						id='orderby' class='cas_category' data-filter='연극'>연극</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=기타'
						id='orderby' class='cas_category' data-filter='기타'>기타</a>
					<%
					}
					%>

					<!-- 자기 계발  -->
					<%
					if (cas.equals("imp")) {
					%>
					<a href='../casPage/cas_themeList.jsp?cas=<%=cas%>'
						class='cas_category active' data-filter='전체'>전체</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=공예취미'
						id='orderby' class='cas_category' data-filter='공예/취미'>공예/취미</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=교양어학'
						id='orderby' class='cas_category' data-filter='교양/어학'>교양/어학</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=스포츠'
						id='orderby' class='cas_category' data-filter='스포츠'>스포츠</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=전문자격증'
						id='orderby' class='cas_category' data-filter='전문/자격증'>전문/자격증</a>
					<a href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=기타'
						id='orderby' class='cas_category' data-filter='기타'>기타</a>
					<%
					}
					%>

					<!-- 체육시설  -->
					<%
					if (cas.equals("sportsFac")) {
					%>
					<a href='../casPage/cas_themeList.jsp?cas=<%=cas%>'
						class='cas_category active' data-filter='전체'>전체</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=체육관'
						id='orderby' class='cas_category' data-filter='체육관'>체육관</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=축구장'
						id='orderby' class='cas_category' data-filter='축구장'>축구장</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=풋살장'
						id='orderby' class='cas_category' data-filter='풋살장'>풋살장</a> <a
						href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=다목적경기장'
						id='orderby' class='cas_category' data-filter='다목적경기장'>다목적경기장</a>
					<a href='../casPage/cas_themeList_order.jsp?cas=<%=cas%>&order=기타'
						id='orderby' class='cas_category' data-filter='기타'>기타</a>
					<%
					}
					%>
				</div>
				<div class="row cas_item">
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 1번"
								src="https://www.sejongpac.or.kr:443/upload/2021/02/20210208_161151105_59967.jpg"
								onclick="location.href='../casPage/cas_detail.jsp'"
								style="cursor: pointer;">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 2번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 3번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 4번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 5번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 6번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 7번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 8번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 9번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 10번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 11번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-sm-4 col-md-3 casItem">
						<div class="thumbnail item">
							<img alt="테스트이미지 12번" src="#"
								style="max-height: 100%; max-width: 100%; cursor: pointer;"
								onclick="location.href='#'">
							<div class="caption clearfix">
								<p>
									<%=result%>
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan"><%=result%>
									제목 OR 간단설명
								</h4>
								<p class="pull-left">장소</p>
								<p class="pull-right">서비스 상태</p>
							</div>
						</div>
					</div>
				</div>
			</div>
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
		</div>
		<!-- // 본문영역 끝 -->
	</div>
	<!-- 하단영역 시작 -->
	<%@ include file="../inc/Footer.jsp"%>
	<!-- // 하단영역 끝 -->
	<%@ include file="../inc/plugin.jsp"%>
	<!-- 찜하기 버튼 -->
	<script>
		$(".heart")
				.on(
						"click",
						function() {
							if ($(this).hasClass("liked")) {
								$(this)
										.html(
												'<i class="fa fa-heart-o" aria-hidden="true"></i>');
								$(this).removeClass("liked");
							} else {
								$(this)
										.html(
												'<i class="fa fa-heart" aria-hidden="true"></i>');
								$(this).addClass("liked");
							}
						});
	</script>
	<script>
		$(".cas_category").on('click', function() {
			$(".cas_category").removeClass('active');
			$(this).addClass('active');
		});
	</script>
</body>
</html>