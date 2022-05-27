<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<!-- 되돌리기 눌럿을때 뜨는 페이지 -->
<%
int dno = Integer.parseInt((String)session.getAttribute("dno"));
int cid = Integer.parseInt(request.getParameter("cid")); 
%>

<h3><%= dno%></h3>
<h3><%= cid %></h3>
<%@ include file="../footer.jsp" %>
</body>
</html>