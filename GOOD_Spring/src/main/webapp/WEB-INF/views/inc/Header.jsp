<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@page import="study.spring.goodspring.model.adminMember"%>
<%
adminMember loginInfo = (adminMember) session.getAttribute("login_info");
%>

<header>
	<div class="navbar navbar-default clearfix" role="navigation"
		id="header"
		style="background: #ffffff !important; min-height: 80px; border-color: #ffffff !important;">
		<div class="container clearfix">
			<div class="row clearfix" style="padding-bottom: 0 !important">
				<div class="col-md-3 col-xs-3 pull-left">
					<div
						style="padding: 30px 10px; padding-left: 0; padding-bottom: 0;"
						id="logo">
						<a href="<%=request.getContextPath()%>/mainPage/index.jsp"
							style="position: relative; z-index: 999999;"><img
							src="<%=request.getContextPath()%>/assets/icon_img/logo.png"
							style="width: 250px; height: 53px;"></a>
					</div>
				</div>
				<div class="col-md-9">
					<!--로그인 회원가입 프로필-->
					<%
					if (loginInfo == null) {
					%>
					<div class="row clearfix"
						style="padding-top: 30px; padding-bottom: 5px;"
						id="login_join_box">
						<div class="pull-right" id="login_join">
							<div class="pull-left">
								<button class="btn btn-link"
									style="color: #0098ed; text-decoration: none; border: 0; outline: 0;"
									onclick="location.href='${pageContext.request.contextPath}/mainPage/login.jsp'">
									<i class="glyphicon glyphicon-log-in"></i> <strong>
										로그인</strong>
								</button>
								<button class="btn btn-link"
									style="color: #0069a6; text-decoration: none; border: 0; outline: 0;"
									onclick="location.href='${pageContext.request.contextPath}/mainPage/join.jsp'">
									<i class="glyphicon glyphicon-link"></i> <strong> 회원가입</strong>
								</button>
							</div>
						</div>
					</div>
					<%
					} else if (loginInfo.getUserId() == "user") {
					%>
					<div class="row clearfix"
						style="padding-top: 30px; padding-bottom: 5px;"
						id="login_join_box">
						<div class="pull-right" id="login_join">
							<div class="pull-right" style="padding: 0 10px 0 10px;">
								<div>
									<a id="account" href="#" role="button"><img
										style="border-radius: 20px"
										onerror="this.src='<%=request.getContextPath()%>/img/profile_default.png'"
										src="${sessionScope.principal.userProfile}" width="30px"
										height="30px"></img><span class="hidden">myPage</span></a>
								</div>
							</div>
							<!-- 계정 정보 모달 -->
							<div class="account_modal" aria-label="계정 정보" aria-hidden="true"
								style="overflow: hidden; display: none; position: absolute; top: 0px; right: -127px; width: 300px; z-index: 1000001; margin-top: 67px; background-color: #fff; border: 1px solid #ccc; border-radius: 10px; box-shadow: 0.1px 0.1px 2px rgba(0, 0, 0, 0.5);">
								<div class="text-center" style="padding: 30px 0;">
									<img style="border-radius: 60px"
										onerror="this.src='<%=request.getContextPath()%>/img/profile_default.png'"
										src="${sessionScope.principal.userProfile}" width="120px"
										height="120px"></img><span class="hidden">myPage</span>
								</div>
								<div class="account-info text-center">이름: <%=loginInfo.getUserName() %></div>
								<div class="account-info text-center">닉네임: <%=loginInfo.getUserName() %></div>
								<div class="account-info text-center"
									style="padding-bottom: 30px;">ID: <%=loginInfo.getUserId() %></div>
								<div class="account-info btn-group"
									style="padding: 0; width: 100%;">
									<a
										href="<%=request.getContextPath()%>/myPage/myPage_bookmark.jsp"
										type="button" id="bookmarkPage" class="btn btn-link"
										style="border-radius: 0; border: 0; width: 33.3%;"> <i
										class="fa fa-heart" aria-hidden="true" role="button"
										style="color: black;"></i> 찜 목록
									</a> <a
										href="<%=request.getContextPath()%>/myPage/myPage_index.jsp"
										type="button" id="myPage" class="btn btn-link"
										style="border-radius: 0; width: 33.3%; border: 0;"><i
										class="glyphicon glyphicon-cog"></i>My Page</a>
									<button type="button" id="logout" class="btn btn-link"
										style="border-radius: 0; border: 0; width: 33.3%;"
										onclick="location.href='<%=request.getContextPath()%>/mainPage/logout.jsp'">
										<i class="glyphicon glyphicon-log-out"></i>로그아웃
									</button>
								</div>
							</div>
							<!-- 계정정보모달 활성화시 뒷배경 -->
							<div class="gray_layer"></div>
						</div>
					</div>
					<!--//로그인 회원가입 프로필-->
					<%
					} else if (loginInfo.getUserId() == "admin") {
					%>
					<div class="row clearfix"
						style="padding-top: 30px; padding-bottom: 5px;"
						id="login_join_box">
						<div class="pull-right" id="login_join">
							<div class="pull-left">
								<button class="btn btn-link"
									style="color: #0098ed; text-decoration: none; border: 0; outline: 0;"
									onclick="location.href='<%=request.getContextPath()%>/adminPage/admin_index.jsp'">
									<i class="glyphicon glyphicon-log-in"></i> <strong>
										관리자페이지</strong>
								</button>
								<button class="btn btn-link"
									style="color: #0069a6; text-decoration: none; border: 0; outline: 0;"
									onclick="location.href='<%=request.getContextPath()%>/mainPage/logout.jsp'">
									<i class="glyphicon glyphicon-link"></i> <strong> 로그아웃</strong>
								</button>
							</div>
						</div>
					</div>
					<%
					}
					%>

					<!--네비게이션, 검색바-->
					<div class="row" style="padding-bottom: 0 !important;">
						<!-- 반응형 햄버거 -->
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target="#navi_search">
								<span class="sr-only">메뉴열기</span> <span class="icon-bar"></span>
								<span class="icon-bar"></span> <span class="icon-bar"></span>
							</button>
						</div>
						<!-- //반응형 햄버거 -->
						<!-- 네비게이션(서브메뉴) -->
						<div class="collapse navbar-collapse clearfix " id="navi_search">
							<!-- 반응형 햄버거 아코디언 -->
							<div class="panel-group visible-xs" id="accodian"
								style="border-bottom: 0; margin-bottom: 0 !important; margin-top: 10px; font-size: 20px">
								<div class="panel panel-default">
									<div class="panel-heading" style="background: #fff;">
										<div class="panel-title">
											<button class="accordian-toggle btn btn-link btn-block"
												style="border: 0; outline: 0; text-decoration: none; font-size: 20px; text-align: left;"
												onclick="location.href='../bicyclePage/bicycle_index.jsp'">
												<img
													src="<%=request.getContextPath()%>/assets/icon_img/자전거 아이콘 1.png"
													style="width: 30px; height: 24px; padding: 0 3px;" />자전거
											</button>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" style="background: #fff;">
										<div class="panel-title">
											<button class="accordian-toggle btn btn-link btn-block"
												data-toggle="collapse" data-parent="#accordion"
												data-target="#collapseOne"
												style="border: 0; outline: 0; text-decoration: none; font-size: 20px; text-align: left;">
												<img src="<%=request.getContextPath()%>/assets/icon_img/걷기 아이콘.png"
													style="width: 30px; height: 24px; padding: 0 3px;" />걷기
											</button>
										</div>
									</div>
									<div id="collapseOne" class="panel-collapse collapse">
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/walkPage/walk_index.jsp">걷기
												메인</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/walkPage/walk_search.jsp">코스목록</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/walkPage/walk_log.jsp">걷기로그</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/walkPage/walk_hallOfFame.jsp">명예의전당</a>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" style="background: #fff;">
										<div class="panel-title">
											<button class="accordian-toggle btn btn-link btn-block"
												data-toggle="collapse" data-parent="#accordion"
												data-target="#collapseTwo"
												style="border: 0; outline: 0; text-decoration: none; font-size: 20px; text-align: left;">
												<img
													src="<%=request.getContextPath()%>/assets/icon_img/문화체육 아이콘.png"
													style="width: 30px; height: 24px; padding: 0 3px;" />문화체육
											</button>
										</div>
									</div>
									<div id="collapseTwo" class="panel-collapse collapse">
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/casPage/cas_index.jsp">문화체육
												메인</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=exp">문화
												창의 체험</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=showExh">공연
												전시</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=imp">교육
												자기 계발</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=sportsFac">체육시설</a>
										</div>
									</div>
								</div>
								<div class="panel panel-default">
									<div class="panel-heading" style="background: #fff;">
										<div class="panel-title">
											<button class="accordian-toggle btn btn-link btn-block"
												data-toggle="collapse" data-parent="#accordion"
												data-target="#collapseThree"
												style="border: 0; outline: 0; text-decoration: none; font-size: 20px; text-align: left;">
												<img
													src="<%=request.getContextPath()%>/assets/icon_img/커뮤니티 아이콘.png"
													style="width: 30px; height: 24px; padding: 0 3px;" />커뮤니티
											</button>
										</div>
									</div>
									<div id="collapseThree" class="panel-collapse collapse">
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/commPage/comm_index.jsp">커뮤니티
												메인</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/commPage/comm_crew.jsp">크루</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/commPage/comm_myCourse.jsp?pageNo=1">나만의
												코스</a>
										</div>
										<div class="panel-body">
											<a class="btn-block"
												href="<%=request.getContextPath()%>/commPage/comm_myPost.jsp">내가
												쓴 글</a>
										</div>
									</div>
								</div>
							</div>
							<!-- //반응형 햄버거 아코디언 -->
							<ul class="nav navbar-nav navbar-left hidden-xs" id="cbp-tm-menu">
								<!--자전거메뉴-->
								<li><a
									href="<%=request.getContextPath()%>/bicyclePage/bicycle_index.jsp"><img
										src="<%=request.getContextPath()%>/assets/icon_img/자전거 아이콘 1.png"
										style="width: 30px; height: 24px; padding: 0 3px;" />자전거</a></li>
								<!--걷기메뉴-->
								<li onclick="location.href='../walkPage/walk_index.jsp'"
									style="cursor: pointer;"><a><img
										src="<%=request.getContextPath()%>/assets/icon_img/걷기 아이콘.png"
										style="width: 30px; height: 24px; padding: 0 3px;" />걷기</a>
									<ul class="cbp-tm-submenu" style="z-index: 1000;">
										<li><a href="../walkPage/walk_search.jsp"
											class="cbp-tm-icon-archive">코스목록</a></li>
										<li><a href="../walkPage/walk_log.jsp"
											class="cbp-tm-icon-clock">걷기로그</a></li>
										<li><a href="../walkPage/walk_hallOfFame.jsp"
											class="cbp-tm-icon-earth">명예의전당</a></li>
									</ul></li>
								<!--문화체육 메뉴-->
								<li onclick="location.href='../casPage/cas_index.jsp'"
									style="cursor: pointer;"><a><img
										src="<%=request.getContextPath()%>/assets/icon_img/문화체육 아이콘.png"
										style="width: 30px; height: 24px; padding: 0 3px;" />문화 체육</a>
									<ul class="cbp-tm-submenu" style="z-index: 1000;">
										<li><a
											href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=exp"
											class="cbp-tm-icon-pencil">문화 창의 체험</a></li>
										<li><a
											href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=showExh"
											class="cbp-tm-icon-pictures">공연 전시</a></li>
										<li><a
											href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=imp"
											class="cbp-tm-icon-contract">교육 자기 계발</a></li>
										<li><a
											href="<%=request.getContextPath()%>/casPage/cas_themeList.jsp?cas=sportsFac"
											class="cbp-tm-icon-location">체육시설</a></li>
									</ul></li>
								<!--커뮤니티 메뉴-->
								<li onclick="location.href='../commPage/comm_index.jsp'"
									style="cursor: pointer;"><a><img
										src="<%=request.getContextPath()%>/assets/icon_img/커뮤니티 아이콘.png"
										style="width: 30px; height: 24px; padding: 0 3px;" />커뮤니티</a>
									<ul class="cbp-tm-submenu" style="z-index: 1000;">
										<li><a
											href="<%=request.getContextPath()%>/commPage/comm_crew.jsp"
											class="cbp-tm-icon-users">크루</a></li>
										<li><a
											href="<%=request.getContextPath()%>/commPage/comm_myCourse.jsp?pageNo=1"
											class="cbp-tm-icon-location">나만의 코스</a></li>
										<li><a
											href="<%=request.getContextPath()%>/commPage/comm_myPost.jsp"
											class="cbp-tm-icon-pencil">내가 쓴 글</a></li>
									</ul></li>
							</ul>
							<!-- 검색바 -->
							<form class="navbar-form navbar-right" role="search"
								style="border-bottom: 0 !important;">
								<div class="form-group input-group">
									<input type="text" class="form-control" placeholder="검색">
									<span class="input-group-btn"> <a class="btn btn-blue"
										style="outline: 0;"
										href="<%=request.getContextPath()%>/mainPage/search.jsp">
											<i class="glyphicon glyphicon-search" style="color: #eeffff"></i>
									</a>
									</span>
								</div>
							</form>
							<!-- //검색바 -->
						</div>
						<!-- //네비게이션(서브메뉴) -->
					</div>
					<!--//네비게이션, 검색바-->
				</div>
			</div>
		</div>
	</div>
</header>
<script type="text/javascript">
	$(function() {
		//계정정보버튼 누르면-->모달 on,off  모바일 환경에서 회색창 생김.
		$("#account").click(function() {
			if ($('.account_modal').css("display") == "none") {
				$('.account_modal').fadeIn(300);
				if ($(window).width() < 992) {
					$('.gray_layer').fadeIn(300);
				}
			} else if ($('.account_modal').css("display") == "block") {
				$('.account_modal').fadeOut(300);
				if ($(window).width() < 992) {
					$('.gray_layer').fadeOut(300);
				}
			}
		});
		//회색배경창 누르면 모달,회색창 꺼짐.
		$(".gray_layer").click(function() {
			if ($(window).width() < 992) {
				$('.gray_layer').fadeOut(300);
			}
			$('.account_modal').fadeOut(300);
		});

		$(window).resize(
				function(e) {
					if ($(window).width() >= 992
							&& $('.account_modal').css("display") == "block") {
						$('.gray_layer').fadeOut(300);
					}
					if ($(window).width() < 992
							&& $('.account_modal').css("display") == "block") {
						$('.gray_layer').fadeIn(300);
					}
				});
	});
</script>