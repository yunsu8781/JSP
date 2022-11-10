<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.JSFunction" %>
<%@ page import="utils.CookieManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 & 아이디 저장(쿠키)</title>
</head>
<body>

	<%
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String save_check = request.getParameter("save_check");
		
		if(user_id.equals("must") && user_pw.equals("1234")){
			
			if(save_check != null && save_check.equals("Y")) {
				/* Cookie c = new Cookie("loginId", user_id);
				c.setPath("/");
				c.setMaxAge(86400);
				response.addCookie(c); */
				CookieManager.makeCookie(response, "loginId", user_id, 86400);
			} else{
				/* Cookie c = new Cookie("loginId", "");
				c.setPath("/");
				c.setMaxAge(0);
				response.addCookie(c); */
				CookieManager.deleteCookie(response, "loginId");
			}
			JSFunction.alertLocation("로그인에 성공했습니다.", "IDSaveMain.jsp", out);
		}
		else{
			JSFunction.alertBack("로그인에 실패했습니다.", out);
		}
	%>

</body>
</html>