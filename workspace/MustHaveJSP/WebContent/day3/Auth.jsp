<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복습</title>
</head>
<body>
	<%
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_pw");
	if (id.equalsIgnoreCase("KimWall_su") && pw.equalsIgnoreCase("1234")) {
		response.sendRedirect("WelcomeTest.jsp?id=" + id);
	%>
	
	<%
	} else {
		request.getRequestDispatcher("LoginTest.jsp?loginErr=1").forward(request, response);
	}
	%>
</body>
</html>