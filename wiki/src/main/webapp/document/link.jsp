<%@page import="dto.Document"%>
<%@page import="dao.SpecialDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>역링크 페이지</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<%int dno=0;
if(request.getParameter("dno")!=null){
	dno=Integer.parseInt(request.getParameter("dno"));
	int[] links=SpecialDao.getSpecialDao().getLink(dno);
%><div class="container">
	<h3>이 페이지를 링크하고 있는 문서들의 목록입니다.</h3>
	<%if(links==null){
		%><h4>링크하고 있는 페이지가 없습니다.</h4><%
	}else{for(int i:links){ %>
		<%Document d=SpecialDao.getSpecialDao().getDocument(i);%>
		<div><a href="pageview.jsp?dno=<%=d.getDno()%>"><%=d.getDtitle()%></a></div>
	<%} }%>
	</div>
	<%}else{
	%><h1>페이지 오류</h1><%}
	%>
<%@ include file="../footer.jsp" %>
</body>
</html>