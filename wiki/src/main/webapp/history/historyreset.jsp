<%@page import="dto.Content"%>
<%@page import="dao.SpecialDao"%>
<%@page import="dao.DocumentDao"%>
<%@page import="dto.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	//int cid = Integer.parseInt(request.getParameter("cid")); // 해당 문서내용번호 리퀘스트
	//Content content = SpecialDao.getSpecialDao().getcontent(cid); // 해당문서내용 가져오기
	%><!--  문서 내용 가져오기 -->
	<h3></h3> <!-- 테스트제목 -->
	<textarea rows="20" cols="10"></textarea> <!-- 테스트내용 -->
	<button type="button" class="btn btn-success hisbtn">이버전으로 되돌리기</button> <!-- 이버전으로되돌리기 -->
</body>
</html>