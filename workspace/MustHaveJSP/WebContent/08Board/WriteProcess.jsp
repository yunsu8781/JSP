<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1.board.BoardDAO" %>
<%@ page import="model1.board.BoardDTO" %>
<%@ include file="IsLoggedin.jsp" %> <!-- 로그인 여부 체크 -->



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
        // 유저가 입력한 title, content 값을 받아와서
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        // 유저의 id 값도 받아오자! -> session에 있겠구나~ session.getAttribute("UserId")
        String userId = session.getAttribute("UserId").toString();
        
        
        // boardDB에 넣을 수 있도록 BoardDTO 객체 생성하여 전달~!
        BoardDTO dto = new BoardDTO();
        
        dto.setTitle(title);
        dto.setContent(content);
        dto.setId(userId);
        
        // 글쓰기 작업을 하자! 그러려면 먼저 DB에 연결을 해야겠군 -> DAO 객체 사용했습니다~!
        BoardDAO dao = new BoardDAO(application);
        int result = dao.insertWrite(dto);
        dao.close(); // DB 사용이 끝나면 꼭 자원을 반납합시다~
        
        if(result == 1){
            response.sendRedirect("List.jsp");
        } else {
            JSFunction.alertBack("글쓰기에 실패하였습니다", out);
        }
        
        
    %>
    

</body>
</html>