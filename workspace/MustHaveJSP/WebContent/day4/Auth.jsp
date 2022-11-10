<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="common.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");
    String name =request.getParameter("name");
    
    MemberDTO m1 = new MemberDTO();
    application.setAttribute("memberInfo", m1);

    application.setAttribute("requestMemberDTO", new MemberDTO(id, pwd, name));

    request.getRequestDispatcher("../day10/LoginForm.jsp").forward(request,response);
%>
</body>
</html>