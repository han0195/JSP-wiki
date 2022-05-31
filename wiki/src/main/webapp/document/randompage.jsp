<%@page import="dao.SpecialDao"%>
<%@page import="dto.Document"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>랜덤페이지</title>
</head>
<body>
<%@ include file="../header.jsp" %>
<!-- 랜덤 눌럿을때 뜨는 페이지 -->
<%
ArrayList<Document> list=new ArrayList<Document>(SpecialDao.getSpecialDao().randomPage());
	for(Document d:list){
%>
	<div class="container">
		<h3>랜덤으로 10개의 문서가 표시됩니다. 클릭시 이동합니다.</h3>
		<a href="pageview.jsp?dno=<%=d.getDno()%>"><%=d.getDtitle()%></a>
	</div>
	<%} %>
<%@ include file="../footer.jsp" %>
</body>
</html>