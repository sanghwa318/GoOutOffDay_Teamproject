<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/accountoutlayout.css" />

<%@ include file="/WEB-INF/views/inc/head.jsp"%>

</head>
<body>
<div class="wrapper">
	<!-- 상단영역 -->
	<%@ include file="/WEB-INF/views/inc/Header.jsp"%>
	<!-- 본문영역 -->
	<div class="container">
		<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<div class="page-header">
                <h1>회원탈퇴</h1>
        </div>
		 <form  class="form-horizontal" >

			<!-- 아이디 -->
			<div class="form-group1">
				<label for='user_id' class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-10">
                   <input type="text" name="user_id" class="form-control" id="user_id" value="${login_info.getUser_id()}" readonly/>
			</div>
			</div>
			<!-- //아이디 -->
			
			<!-- 닉네임 -->
			<div class="form-group1">
				<label for='user_nick' class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-10">
                  <input type="text" name="user_nick" class="form-control" id="user_nick" value="${login_info.getUser_nick()}" readonly />
			</div>
			</div>
			<!-- //닉네임 -->
			  
              <!-- 이름 -->
			 <div class="form-group1">
                    <label for="user_name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_name" class="form-control" id="user_name" value="${login_info.getUser_name()}" readonly />
                    </div>
                </div>
                <!-- //이름 -->
			
			<!-- 이메일 -->
			<div class="form-group1">
                    <label for="email" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-10">
						<input type="text" name="email" class="form-control" id="email" value="${login_info.getEmail()}" readonly />
                    </div>
                </div>
                <!-- //이메일 -->
                
            <!-- 연락처 -->
			<div class="form-group1">
                    <label for="tel" class="col-sm-2 control-label">연락처</label>
                    <div class="col-sm-10">
						<input type="text" name="tel" class="form-control" id="tel" value="${login_info.getTel()}" readonly />
                    </div>
                </div><!-- //연락처 -->
                
            <!-- 우편번호 -->
			<div class="form-group1">
                    <label for="post" class="col-sm-2 control-label">우편번호</label>
                    <div class="col-sm-10">
						<input type="text" name="post" class="form-control" id="post" value="${login_info.getPost()}" readonly />
                    </div>
                </div>
                <!-- //우편번호 -->
			
			<!-- 도로명주소 -->
			<div class="form-group1">
                    <label for="address1" class="col-sm-2 control-label">도로명주소</label>
                    <div class="col-sm-10">
						<input type="text" name="address1" class="form-control" id="address1" value="${login_info.getAddress1()}" readonly />
                    </div>
                </div>
                <!-- //도로명주소 -->	
                
           <!-- 상세주소 -->
			<div class="form-group1">
                    <label for="address2" class="col-sm-2 control-label">도로명주소</label>
                    <div class="col-sm-10">
						<input type="text" name="address2" class="form-control" id="address2" value="${login_info.getAddress2()}" readonly />
                    </div>
                </div>
                <!-- //상세주소 -->	     
		</form>
		<div class="form-group1 text-center">
			<button class="btn btn-danger" id="del" onClick="location.href='${pageContext.request.contextPath}/myPage/myPage_accountOut_delete_ok.do?user_id=${login_info.getUser_id()}/'">탈퇴하기</button>
			<button class="btn btn-default" id ="cancel"onClick="location.href='${pageContext.request.contextPath}/myPage/myPage_index.do'">취소하기</button>
		</div>
		</div>
	</div>
</div>
</div>
	 

</body>



<%@ include file="/WEB-INF/views/inc/Footer.jsp"%>


<%@ include file="/WEB-INF/views/inc/plugin.jsp"%>
</body>
</html>