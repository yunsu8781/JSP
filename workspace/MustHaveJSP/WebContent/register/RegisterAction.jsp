<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String name = request.getParameter("user_name");
		
		session.setAttribute("UserId", id);
		session.setAttribute("UserName", name);
		
		response.sendRedirect("RegisterForm.jsp");
	%>
</body>
</html>