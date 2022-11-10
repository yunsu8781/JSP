<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복습</title>
</head>
<body>
	<h2>Welcome</h2>
	<%
	String id = request.getParameter("id");
	out.println(id+"님 환영합니다."); 
	%>
	<br />
	<a href ="LoginTest.jsp"><button>로그아웃</button></a>
</body>
</html>