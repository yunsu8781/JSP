<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>쿠키 체크하기 - 새로운 페이지</h2>
	<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies ){
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			
			out.println(String.format("%s : %s<br />", cookieName, cookieValue));
		}
	}
	%>
</body>
</html>