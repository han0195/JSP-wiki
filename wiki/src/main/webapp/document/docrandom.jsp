<%@page import="dto.Document"%>
<%@page import="dao.DocumentDao"%>
<%@page import="dto.Content"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../header.jsp"%>

<h3 style="text-align: center;">랜덤으로 10개의 문서를 추첨하여 출력하는 리스트</h3>
<table class="table" style="margin-left: 300px; margin-top: 20px;">
<tr>
<th style="text-align: center;">문서 번호</th><th style="text-align: left;"> 문서 제목</th>
</tr>

<%ArrayList<Document> list = DocumentDao.getdocumentDao().docrandomlist(); 
if(list != null) {
for(Document temp : list) {
%>
<tr>
<td style="text-align: center;"><%=temp.getDno() %></td>
<td><a href="/wiki/document/pageview.jsp?dno=<%=temp.getDno()%>"><%=DocumentDao.getdocumentDao().getTitle(temp.getDno())%></a></td>
</tr>
<%} } else {%>
<tr><td>검색 결과가 존재하지 않습니다.</td></tr>
<%} %>
</table>
<br><br><br><br><br><br>
<%@include file="../footer.jsp"%>
</body>
</html>