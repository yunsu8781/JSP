<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>로그인</h1>

    <%
        String LoginErr = request.getParameter("LoginErr");
        if(LoginErr != null) {
            out.println("비밀번호를 다시 확인해 주세요");
        }
    %>

    <form action="Register.jsp" method="post">
        <label>
            <strong>아이디</strong> 
            <input type="text" name="Login_id" placeholder="아이디를 입력하세요"> <br />
        </label>
        <label>
            <strong>비밀번호</strong> 
            <input type="password" name="Login_pwd" placeholder="비밀번호를 입력하세요"> <br />
        </label>
        <input type="submit" value="로그인">
    </form>
</body>
</html>