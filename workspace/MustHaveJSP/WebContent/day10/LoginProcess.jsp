<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>
<%@ page import="common.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String userId = request.getParameter("user_id");
	String userPw = request.getParameter("user_pw");
	
	MemberDAO dao = new MemberDAO(application);
	MemberDTO memberDTO = dao.getMemberDTO(userId, userPw);
	dao.close();
	
	if (memberDTO.getId() != null) {    
		session.setAttribute("UserId", memberDTO.getId());   
		session.setAttribute("UserName", memberDTO.getName());   
		response.sendRedirect("LoginForm.jsp"); 
	} 
	else {    
			request.setAttribute("LoginErrMsg", "로그인 오류입니다.");   
			request.getRequestDispatcher("LoginForm.jsp").forward(request, response); 
	}
	%>
</body>
</html>