<%@page import="dao.DocumentDao"%>
<%@page import="dto.Content"%>
<%@page import="dao.SpecialDao"%>
<%@page import="dto.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 사용자지정 css -->
<link href="/wiki/css/history.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<!-- 되돌리기 눌럿을때 뜨는 페이지 -->
	<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	//문서내용 가져오기
	Content content = DocumentDao.getdocumentDao().docuLoad(cid);
	//Document 가져오기
	Document document = SpecialDao.getSpecialDao().getDocument(content.getDno());
	%>
	<div class="container">
		<!-- 본문 -->
		<div><!-- 리스트 헤더 -->
			<!-- 문서내용번호 저장 -->
			<input id="dnohid2" type="hidden" value="<%=cid%>">
			<h2 class="history_title">
				<!-- 제목 -->
				<%=document.getDtitle()%>
				<span class="histsory_sub_title">(문서역사)</span>
			</h2>
			<a><button class="btn btn-outline-dark">편집</button></a> <a><button
					class="btn btn-outline-dark">역링크</button></a>
		</div><!-- 리스트 헤더 -->
		
		<!-- 문서내용 -->
		<textarea rows="10" cols="150">
		<%= content.getDcontent() %>
		</textarea>
		<!-- 문서내용 -->
		
		<button type="button" class="btn btn-success hisbtn">되돌리기</button>
		<a href="history.jsp?dno=<%=document.getDno()%>"><button type="button" class="btn btn-success hisbtn">취소</button></a> 
	
	</div><!-- 본문end -->
	
	<%@ include file="../footer.jsp"%>
	
	
</body>
</html>