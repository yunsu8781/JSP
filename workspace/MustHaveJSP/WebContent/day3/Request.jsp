<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request</title>
</head>
<body>
 	<form action = "RequestWebInfo.jsp" method = "get">
		<input type = "text" name = "id" />
		<input type = "password" name = "pw" />
		<input type = "submit" value = "GET 방식으로 로그인" />
	</form>
	
 	<form action = "RequestWebInfo.jsp" method = "post">
		<input type = "text" name = "id" />
		<input type = "password" name = "pw" />
		<input type = "submit" value = "POST 방식으로 로그인" />
	</form>
	
	<form action="RequestWebInfo.jsp" method = "post">
		<label>치킨<input type = "checkbox" name = "food" value = "chicken" /></label>
		<label>피자<input type = "checkbox" name = "food" value = "pizza" /></label>
		<label>햄버거<input type = "checkbox" name = "food" value = "hamburger" /></label>
		<input type = "submit" value = "~제출" />
	</form>
	
</body>
</html>