<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" errorPage = "Hello.jsp"
	trimDirectiveWhitespaces = "true"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>import ����</title>
</head>
<body>
	<%
		int myAge = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("10�� �� ����� ���̴� " + myAge + "�Դϴ�.");
	%>
</body>
</html>