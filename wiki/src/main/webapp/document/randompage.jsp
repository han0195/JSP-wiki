<%@page import="dao.SpecialDao"%>
<%@page import="dto.Document"%>
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
<%@ include file="../header.jsp" %>
<!-- 되돌리기 눌럿을때 뜨는 페이지 -->
<%
ArrayList<Document> list=new ArrayList<Document>(SpecialDao.getSpecialDao().randomPage());
	for(Document d:list){
%>
	<div class="container">
		<input type="text" hidden="hidden" value="<%=d.getDno()%>"> <!-- 문서번호 숨겨서 넣기 -->
		<span onclick=""><%=d.getDtitle()%></span> <!-- 제목 출력 -->
	</div>
	<%} %>
<%@ include file="../footer.jsp" %>
</body>
</html>