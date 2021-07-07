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

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.js" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/Joinlayout.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js" />
</head>
<body>
   <div class="wrapper">

	<!-- 상단영역 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp" %>

	<!-- 본문영역 -->
	<div class="container">
	<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="page-header">
                <h1>회원가입</h1>
        </div>
		<!-- 가입폼 시작 -->
		 <form id="join_form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/mainPage/join">
		
			<!-- 입력양식 -->
			<!-- 아이디 -->
			<div class="form-group1">
				<label for='user_id' class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="user_id" class="form-control" id="user_id" placeholder="영문,숫자조합 최대 30글자">
                            <span class="input-group-btn">
                                <button type="button" id="id_unique_check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
			</div>
			</div><!-- //아이디 -->
			<!-- 닉네임 -->
			<div class="form-group1">
				<label for='user_nickname' class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="user_nickname" class="form-control" id="user_nickname" placeholder="한굴,영문,숫자조합 최대 30글자">
                            <span class="input-group-btn">
                                <button type="button" id="nickname_unique_check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
			</div>
			</div><!-- //닉네임 -->
			
			<!-- 비밀번호 -->
			<div class="form-group1">
                    <label for="user_pw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div><!-- //비밀번호 -->
                <!-- 비밀번호 확인 -->
                <div class="form-group1">
                    <label for="user_pw_re" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw_re" class="form-control" id="user_pw_re" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div><!-- //비밀번호 확인 -->
              
              <!-- 이름 -->
			 <div class="form-group1">
                    <label for="user_name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_name" class="form-control" id="user_name" placeholder="한글, 최대 30글자" />
                    </div>
                </div><!-- //이름 -->
			
			<!-- 이메일 -->
			<div class="form-group1">
                    <label for="email" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" id="email" placeholder="예시 : example@example.com" />
                            <span class="input-group-btn">
                                <button type="button" id="email_unique_check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
                    </div>
                </div><!-- //이메일 -->
            <!-- 연락처 -->
			<div class="form-group1">
                    <label for="tel" class="col-sm-2 control-label">연락처</label>
                    <div class="col-sm-10">
                        <input type="text" name="tel" class="form-control" id="tel" placeholder="`-`없이 숫자만 입력" />
                    </div>
                </div><!-- //연락처 -->
                
             <!-- 주소 우편번호 -->
			<div class="form-group1">
			<label for="user_id" class="col-sm-2 control-label">주소</label>
				<div class="col-sm-4">
                        <div class="input-group">
                        <input type="text" name="postcode" class="form-control" id="postcode" maxlength="5" readonly>
                            <span class="input-group-btn">
                            <button type="button" onclick="execDaumPostcode()" class="btn btn-info postcode-finder" data-postcode="#postcode" data-addr1="#addr1" data-addr2="#addr2" data-frame="#postcode-frame">우편번호검색</button>
                        	</span>
                        </div>
                    </div>
                    </div><!-- //주소 우편번호 -->
                  <!-- 주소 도로명 -->  
                 <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" class="form-control" id="roadAddress" readonly />
                    </div><!-- //주소 도로명 -->
                 </div>
     
                 <!-- 주소 나머지 -->
                <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" name="detailAddress" class="form-control" id="detailAddress" placeholder="나머지 주소" />
                    </div>
                </div><!-- 주소 나머지 -->
				
          <!-- 성별 -->
          <div class="form-group1">
                    <label for="gender" class="col-sm-2 control-label">성별</label>
                    <div class="col-sm-10">
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender" value="M"> 남자
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender" value="F"> 여자
                        </label>
                    </div>
                </div><!-- //성별 -->
         
			<!-- 버튼 -->	
			<div class="form-group1">
				<div class="col-sm-10 col-sm-offset-2 text-center">
					<button type='submit'class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-danger"
						onClick="location.href='${pageContext.request.contextPath}/'">취소하기</button>
				</div>
			</div><!-- //버튼 끝 -->

		</form>
		<!-- //가입폼 끝 -->
		</div>
</div>
</div>
	</div>
	<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>
<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
<script	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/post-join.js"></script>
<script	src="${pageContext.request.contextPath}/assets/js/regex-join.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>


	
</body>
</html>