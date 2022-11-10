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
	<%= request.getAttribute("LoginErrMsg") == null ?
			"" : request.getAttribute("LoginErrMsg") %>
	<% 
	if(session.getAttribute("UserPw") == null) {
	%>
	<form action="deleteAction.jsp" method="post" onsubmit="return validateForm(this)">
		회원 탈퇴를 하려면 패스워드를 입력하세요. <br />
		패스워드 : <input type="password" name="user_pw" >
		<input type="submit" value="회원탈퇴">
	</form>
		<%
	} else {
	%>
	<%
	}
	%>
	
</body>
</html>