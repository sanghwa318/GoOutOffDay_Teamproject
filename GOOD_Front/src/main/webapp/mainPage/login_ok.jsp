<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ page import="ezen05.good.model.adminMember"%>
<%
request.setCharacterEncoding("UTF-8");

adminMember member = new adminMember();
member.setUserId("admin");
member.setUserPw("admin");
member.setUserName("관리자");

adminMember member1 = new adminMember();
member1.setUserId("user");
member1.setUserPw("user");
member1.setUserName("사용자");

String userId = request.getParameter("user_id");
String userPw = request.getParameter("user_pw");

if ((!userId.equals(member.getUserId()) || !userPw.equals(member.getUserPw()))
		&& (!userId.equals(member1.getUserId()) || !userPw.equals(member1.getUserPw()))) {
	out.print("<script>alert('아이디나 비밀번호가 잘못되었습니다.');history.back();</script>");
	return;

}

if (userId.equals(member.getUserId()) && userPw.equals(member.getUserPw())) {
	session.setAttribute("login_info", member);
	response.sendRedirect("../adminPage/admin_index.jsp");
} else if (userId.equals(member1.getUserId()) && userPw.equals(member1.getUserPw())) {
	session.setAttribute("login_info", member1);
	response.sendRedirect("index.jsp");
}
%>