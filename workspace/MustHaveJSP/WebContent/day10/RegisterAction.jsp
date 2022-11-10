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
	<%
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String name = request.getParameter("name");
		
		MemberDAO dao = new MemberDAO(application);
		int isInsert = dao.newMemberCreate(id, pw, name);
		dao.close();
		
		if(isInsert == 1){
			response.sendRedirect("LoginForm.jsp"); 
		}else{
			request.setAttribute("LoginErrMsg", "이미 생성된 아이디 입니다.");   
			request.getRequestDispatcher("Register.jsp").forward(request, response);
		}
		
	%>
</body>
</html>