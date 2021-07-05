<%@page import="java.net.URLEncoder"%>
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
	background-image: url(${iconurl});
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
					onclick="location.href='${pageContext.request.contextPath}/casPage/cas_index.do'"
					style="cursor: pointer; color: #343a40;">
					<span class="test01">문화 체육<img
						src="${pageContext.request.contextPath }/assets/icon_img/문화체육 아이콘.png;" />
					</span>
				</h1>
			</div>
			<!-- 본문 게시판 시작 -->
			<div class="row cas_list">
				<!-- cas 최상단 제목 -->
				<div class="header">
					<h1 style="color: #343a40;">${result }</h1>
				</div>
		 		<div class="orderBy_tag"> 
					<!-- 창의 체험 -->
					<c:if test="${cas eq 'exp'}">
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
						class="cas_category <c:if test="${order eq ''}">active</c:if>" data-filter="전체">전체</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=교육체험"
						class="cas_category <c:if test="${order eq '교육체험'}">active</c:if>" data-filter="교육체험">교육체험</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=농장체험"
						class="cas_category <c:if test="${order eq '농장체험'}">active</c:if>" data-filter="농장체험">농장체험</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=문화행사"
						class="cas_category <c:if test="${order eq '문화행사'}">active</c:if>" data-filter="문화행사">문화행사</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=전시관람"
						class="cas_category <c:if test="${order eq '전시관람'}">active</c:if>" data-filter="전시/관람">전시/관람</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
						class="cas_category <c:if test="${order eq '기타'}">active</c:if>" data-filter="기타">기타</a>
					</c:if>
					
					<!-- 공연 전시 문화 -->
					<c:if test="${cas eq 'showExh'}">
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
						class="cas_category <c:if test="${order eq ''}">active</c:if>" data-filter="전체">전체</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=대중음악"
						class="cas_category <c:if test="${order eq '대중음악'}">active</c:if>" data-filter="대중음악">대중음악</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기획전시"
						class="cas_category <c:if test="${order eq '기획전시'}">active</c:if>" data-filter="기획전시">기획전시</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=오페라"
						class="cas_category <c:if test="${order eq '오페라'}">active</c:if>" data-filter="오페라">오페라</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=연극"
						class="cas_category <c:if test="${order eq '연극'}">active</c:if>" data-filter="연극">연극</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
						class="cas_category <c:if test="${order eq '기타'}">active</c:if>" data-filter="기타">기타</a>
					</c:if>
					
					<!-- 자기 계발  -->
					<c:if test="${cas eq 'imp'}">
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
						class="cas_category <c:if test="${order eq ''}">active</c:if>" data-filter="전체">전체</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=공예취미"
						class="cas_category <c:if test="${order eq '공예취미'}">active</c:if>" data-filter="공예/취미">공예/취미</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=교양어학"
						class="cas_category <c:if test="${order eq '교양어학'}">active</c:if>" data-filter="교양/어학">교양/어학</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=스포츠"
						class="cas_category <c:if test="${order eq '스포츠'}">active</c:if>" data-filter="스포츠">스포츠</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=전문자격증"
						class="cas_category <c:if test="${order eq '전문자격증'}">active</c:if>" data-filter="전문/자격증">전문/자격증</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
						class="cas_category <c:if test="${order eq '기타'}">active</c:if>" data-filter="기타">기타</a>
					</c:if>
		
					<!-- 체육시설  -->
					<c:if test="${cas eq 'sportsFac'}">
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}"
						class="cas_category <c:if test="${order eq ''}">active</c:if>" data-filter="전체">전체</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=체육관"
						class="cas_category <c:if test="${order eq '체육관'}">active</c:if>" data-filter="체육관">체육관</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=축구장"
						class="cas_category <c:if test="${order eq '축구장'}">active</c:if>" data-filter="축구장">축구장</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=풋살장"
						class="cas_category <c:if test="${order eq '풋살장'}">active</c:if>" data-filter="풋살장">풋살장</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=다목적경기장"
						class="cas_category <c:if test="${order eq '다목적경기장'}">active</c:if>" data-filter="다목적경기장">다목적경기장</a>
						<a href="${pageContext.request.contextPath }/casPage/cas_themeList.do?cas=${cas}&order=기타"
						class="cas_category <c:if test="${order eq '기타'}">active</c:if>" data-filter="기타">기타</a>
					</c:if>
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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
									${result }
									태그<span class="heart pull-right"><i
										class="fa fa-heart-o" aria-hidden="true" role="button"></i></span>
								</p>
								<h4 class="explan">${result }
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