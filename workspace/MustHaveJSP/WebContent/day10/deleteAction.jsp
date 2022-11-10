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
	String pw = request.getParameter("user_pw");
	String id = session.getAttribute("UserId").toString();
	
	MemberDAO dao = new MemberDAO(application);
	boolean isDeleted = dao.deleteUser(id, pw);
	
	if(isDeleted == true){
		session.invalidate();
		response.sendRedirect("LoginForm.jsp"); 
	}else{
		request.setAttribute("LoginErrMsg", "비밀번호를 다시 확인해주세요");   
		request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
	}
	%>
</body>
</html>