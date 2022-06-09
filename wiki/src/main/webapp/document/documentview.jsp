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
<link rel="stylesheet" href="/wiki/css/documentvies.css">
</head>
<body>
	<%@include file="../header.jsp"%>
	<h2 style="margin-left: 200px;">문서 리스트</h2>
	<table class="table" id="pageview" style="margin-top: 20px;">	</table>
	<div id="page">
	<select id="dataPerPage" style="margin-left: 600px;">
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
		<a href="/wiki/document/documentwrite.jsp" style="margin-left: 800px;"><button class="btn btn-success hisbtn"> 글 쓰기 </button></a>		
	</div>	

	<script src="/wiki/js/documentview.js" type="text/javascript"></script>
	<%@include file="../footer.jsp"%>
</body>
</html>