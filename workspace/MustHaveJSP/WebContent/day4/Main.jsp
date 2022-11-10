<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>
    <br>
    <form action=Auth.jsp method="post">
        <label>
        <strong>ID</strong>
        <input type="text" name="id" placeholder="ID를 입력하세요">
        </label>
        <br>
        <label>
        <strong>Password</strong>
        <input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
        </label>
        <br>
        <label>
        <strong>Name</strong>
        <input type="text" name="name" placeholder="영어 이름를 입력하세요">
        </label>
        <br>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>