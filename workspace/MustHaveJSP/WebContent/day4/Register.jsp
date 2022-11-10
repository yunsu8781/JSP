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
    String Login_id = request.getParameter("Login_id");
    String Login_pwd = request.getParameter("Login_pwd");

    MemberDTO MemberDTO1 = (MemberDTO)application.getAttribute("requestMemberDTO"); 
    request.setAttribute("requestname", MemberDTO1.getName());
    //System.out.println(MemberDTO1.toString());

    if(Login_id.equalsIgnoreCase(MemberDTO1.getId()) && Login_pwd.equalsIgnoreCase(MemberDTO1.getPw())) {
        request.getRequestDispatcher("Welcome.jsp")
        .forward(request,response);
    } else {
        request.getRequestDispatcher("Login.jsp?LoginErr=1")
        .forward(request,response);
    }
%>
</body>
</html>