<%@page import="dao.DebateDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Debate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%@include file="../header.jsp" %>
<%
int Deno=Integer.parseInt(request.getParameter("Deno"));	
String content = DebateDao.getDebateDao().debateIn(Deno);
%>
<div class="container">
	<h1>토론내용</h1>
	<br>
	<div class="col-md-5" id="debatecontent">
		<h4><%=content %></h4>
	</div>
</div>







<%@include file="../footer.jsp" %>
</body>
</html>