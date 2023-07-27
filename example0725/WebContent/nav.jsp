<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	nav{
		position:fixed;
		top:50px;
		width:100%;
		height:30px;
		background-color:lightgreen;
		color:black;
		font-size: 20px;
	}
	a{
		text-decoration: none;
	}
	a:hover{
		color:white;
	}
</style>
<nav>
	<a href="member_insert.jsp">회원등록</a> &nbsp; &nbsp;
	<a href="member_list.jsp">회원목록조회/수정</a> &nbsp;&nbsp;
	<a href="sale_list.jsp">회원매출조회</a> &nbsp;&nbsp;
	<a href="index.jsp">홈으로</a> &nbsp;&nbsp;
</nav>