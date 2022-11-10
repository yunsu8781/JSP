<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>Welcome</h1> <br/>

    <%=
    request.getAttribute("requestname")+
    "님 환영합니다"
    %>
    <br>
    <br />
    <a href="Login.jsp"><button>로그아웃</button></a>
</body>
</html>