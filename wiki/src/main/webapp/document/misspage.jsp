<%@page import="dao.SpecialDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성이 필요한 문서 목록</title>
</head>
<body>
<%ArrayList<String> l=SpecialDao.getSpecialDao().listNeedWrite();%>
<%@include file="../header.jsp"%>
	<h3>작성이 필요한 제목들의 목록입니다.</h3>
	<table style="margin: 20px;">
		<%for(int i=0; i<l.size(); i++){ %>
		<tr><td>
		<%=l.get(i)%>
		</td></tr>
		<%} %>
	</table>
<%@include file="../footer.jsp"%>
</body>
</html>