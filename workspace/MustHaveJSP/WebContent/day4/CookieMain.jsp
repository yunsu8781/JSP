<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2> 쿠키 굽기</h2>
	<%
		Cookie c = new Cookie("myName", "내가만든쿠키");
		c.setPath(request.getContextPath());
		c.setMaxAge(3600); // 유효기간 : 1시간
		response.addCookie(c); // 중요!!!!!
	%>
	
	<h2>쿠키 체크하기</h2>
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
	
	<a href="CookieTest.jsp">이동하기</a>
</body>
</html>