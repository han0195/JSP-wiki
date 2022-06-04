<%@page import="dto.Document"%>
<%@page import="dao.DocumentDao"%>
<%@page import="dao.SpecialDao"%>
<%@page import="dto.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title> 비교 페이지 </title>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<%
	 int dno = Integer.parseInt(request.getParameter("dno"));
	 int cid = Integer.parseInt(request.getParameter("cid"));
	 /* 문서 */
	Document title = SpecialDao.getSpecialDao().getDocument(dno);
	 /* 최신문서 */
	Content newcontent = DocumentDao.getdocumentDao().docuLoad(dno);
	 /* 선택문서 */
	Content oldcontent = SpecialDao.getSpecialDao().getcontent(cid);
	%>
	<!-- js 날리기 전용 -->
	<input type="hidden" id="dno" value="<%= dno %>">
	<input type="hidden" id="cid" value="<%= cid %>">
	
	<div class="container">
		<div><!-- 리스트 헤더 -->	
			<h2 class="history_title">
				<!-- 제목 -->
				<%=title.getDtitle()%>
				<span class="history_sub_title">(문서역사)</span>
			</h2>
		</div>
		<div class="row"><!-- 문서 content 구역 -->
			<div class="col-6"><!-- 최신문서뷰 구역 -->
				<h3>최신문서</h3>
				<div> <!-- 문서내용 출력구역 -->
				
				</div>
			</div>
			<div class="col-6"><!-- 선택문서뷰 구역 -->
				<h3>선택문서</h3>
				<div> <!-- 문서내용 출력구역 -->
				
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="../js/comparison.js"></script>
</body>
</html>