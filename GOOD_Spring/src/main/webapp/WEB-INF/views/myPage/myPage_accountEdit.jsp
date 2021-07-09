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
                <h1>내 정보 수정</h1>
        </div>
		<!-- 수정폼 시작 -->
		 <form id="edit_form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/myPage/myPage_accountEdit_ok">
		
			<!-- 입력양식 -->
			<div class="form-group1">
				<label for='user_id' class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
                        
                            <input type="text" name="user_id" class="form-control" id="user_id" value="${login_info.getUser_id()}" disabled/>
                           
                      
			</div>
			</div>
			<!-- 닉네임 -->
			<div class="form-group1">
				<label for='user_nick' class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
                        
                            <input type="text" name="user_nick" class="form-control" id="user_nick" value="${login_info.getUser_nick()}">
                           
                      
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
                    <label for="user_pw_re" class="col-sm-2 control-label">수정된 비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw_re" class="form-control" id="user_pw_re" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div><!-- //비밀번호 확인 -->
              
              <!-- 이름 -->
			 <div class="form-group1">
                    <label for="user_name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_name" class="form-control" id="user_name" value="${login_info.getUser_name()}"/>
                    </div>
                </div><!-- //이름 -->
			
			<!-- 이메일 -->
			<div class="form-group1">
                    <label for="email" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-10">
                
                            <input type="email" name="email" class="form-control" id="email" value="${login_info.getEmail()}" />
                  
                    </div>
                </div><!-- //이메일 -->
            <!-- 연락처 -->
			<div class="form-group1">
                    <label for="tel" class="col-sm-2 control-label">연락처</label>
                    <div class="col-sm-10">
                        <input type="tel" name="tel" class="form-control" id="tel" value="${login_info.getTel()}" />
                    </div>
                </div><!-- //연락처 -->
                
             <div class="form-group1">
                    <label for="user_id" class="col-sm-2 control-label">주소</label>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <input type="text" name="postcode" class="form-control" id="postcode" maxlength="5" value="${login_info.getPost()}"readonly>
                            <span class="input-group-btn">
                                <button type="button" onclick="execDaumPostcode()" class="btn btn-info postcode-finder" data-postcode="#postcode" data-addr1="#addr1" data-addr2="#addr2" data-frame="#postcode-frame">우편번호검색</button>
                            </span>
                            
                        </div>
                    </div>
                    <label for="postcode" id="error2" class="error">우편번호를 검색하세요.</label>
                </div>
                <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" name="addr1" class="form-control" id="addr1" value="${login_info.getAddress1()}" readonly />
                    </div>
                </div>

                <div class="form-group1">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" name="addr2" class="form-control" id="addr2" value="${login_info.getAddress2()}" placeholder="나머지 주소" />
                    </div>
                </div>
                <div class="form-group1" style="margin-bottom: 0">
                    <div class="col-sm-10 col-sm-offset-2">
                        <div id="postcode-frame" style="display: none; border: 1px solid; width: 100%; height: 300px; margin: 5px 0; position: relative">
                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldPostcode(this)" alt="접기 버튼">
                        </div>
                    </div>
                </div>
				

         
			<!-- 버튼 -->	
			<div class="form-group1">
				<div class="col-sm-10 col-sm-offset-2 text-center">
					<button type='submit'class="btn btn-primary">수정하기</button>
					<button type="reset" class="btn btn-danger"
						onClick="location.href='${pageContext.request.contextPath}/myPage/myPage_index.do'">취소하기</button>
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
<script	src="${pageContext.request.contextPath}/assets/js/regex-edit.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>


	
</body>
</html>