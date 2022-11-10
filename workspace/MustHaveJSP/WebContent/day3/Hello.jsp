<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces = "true"%>
<%@ include file = "Footer.jsp" %>
<%!
String str1 = "JSP";
String str2 = "안녕하세요..";
public int add(int a, int b){
	 return a + b;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>HelloJSP</title>
</head>
<body>
	<h2>처음 만들어보는 <%= str1 %></h2>
	<p>
	<%
	out.println(str2 + str1 + "입니다. 열공합시다. ^^" + add(3, 4));
	%>
	</p>
	<p>
	<% 
	out.println(today);
	out.println(footerStr);
	%>
	</p>
</body>
</html>