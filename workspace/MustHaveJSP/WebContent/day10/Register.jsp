<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	if(session.getAttribute("UserId") == null) {
	%>
	<script>
		function validateForm(form) {
			if(!form.user_id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			if(!form.user_pw.value == ""{
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
    <h1>회원가입</h1>
    <a href="LoginForm.jsp">[로그인창으로]</a>
    <form action="RegisterAction.jsp" method="post">
        <label><strong>ID</strong> 
            <input type="text" name="user_id" placeholder="ID를 입력하세요" required>
        </label> 
        <br>
        <label><strong>Password</strong> 
            <input type="password" name="user_pw" placeholder="비밀번호를 적어주세요" required>
        </label>
        <br>
        <label><strong>Name</strong>
            <input type="text" name="name" placeholder="이름을 적어주세요" required>
        </label>
        <br>
        <input type="submit" value="회원가입">
    </form>
    <%
	} else {
	}
	%>
	
</body>
</html>