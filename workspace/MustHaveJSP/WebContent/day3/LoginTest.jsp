<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>복습</title>
</head>  
<body>
	<h2>로그인</h2>
	<%
	String loginErr = request.getParameter("loginErr");
	if (loginErr != null) {
		out.print("아이디나 비밀번호를 확인해주세요");
	}
	%>
	<form action="Auth.jsp" method="post">
		<label>아이디<br />
		<input type="text" name="user_id" placeholder="아이디를 입력하세요" /><br />
		</label>
		<label>비밀번호<br />
		<input type="password" name="user_pw" placeholder = "비밀번호를 입력하세요" /><br /> 
		</label>
		<input type="submit" value="로그인">
	</form>
</body>
</html>