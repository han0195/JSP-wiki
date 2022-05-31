<%@page import="dto.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DocumentDao"%>
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

	<%
	ArrayList<Document> dlist = DocumentDao.getdocumentDao().doculist();
	%>
	<table class="table">
		<tr>
			<th>문서 번호</th>
			<th>문서 제목</th>
		</tr>
		<%
		for (Document temp : dlist) {
		%>
		<tr>
			<td><%=temp.getDno()%></td>
			<td><a href="/wiki/document/pageview.jsp?dno=<%=temp.getDno()%>"><%=temp.getDtitle()%></a></td>
		</tr>
		<%
		}
		%>
	</table>

	<%@include file="../footer.jsp"%>
</body>
</html>