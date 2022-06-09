<%@page import="com.mysql.cj.x.protobuf.MysqlxResultset.ContentType_DATETIME"%>
<%@page import="dao.SpecialDao"%>
<%@page import="dto.Content"%>
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
			<th>작성자</th>
		</tr>
		<%
		for (Document temp : dlist) {
		%>
		<tr>
			<td><%=temp.getDno()%></td>
			<td><a href="/wiki/document/pageview.jsp?dno=<%=temp.getDno()%>"><%=temp.getDtitle()%></a></td>
			<td><%=DocumentDao.getdocumentDao().getMid(temp.getDno() ) %></td>
		</tr>
		<%
		}
		%>
	</table>
	<select id="dataPerPage">
			<option value="10">10개씩보기</option>
			<option value="15">15개씩보기</option>
			<option value="20">20개씩보기</option>
		</select>
		<div>
			<!-- 페이징 -->
			<button type="button" class="btn btn-success hisbtn">이전</button>
			<ul id="pagingul">
			</ul>
			<button type="button" class="btn btn-success hisbtn">다음</button>
		</div>

	<%@include file="../footer.jsp"%>
</body>
</html>