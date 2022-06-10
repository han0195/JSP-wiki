<%@page import="dao.SpecialDao"%>
<%@page import="dto.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DocumentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%@include file="../header.jsp" %>
<%
	ArrayList<Document> list= DocumentDao.documentDao.doculist(); 
%>
			<div class="container">
				<div class="text-center">
					<ul class="nav nav-tabs">
					   <li class="nav-item position-relative">
				  		<a class="nav-link active" aria-current="page" href="/wiki/admin/adminmain.jsp">HOME</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="admindocument.jsp">최근 문서</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="admindebate.jsp">최근 토론</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="sameword.jsp">동의어 등록</a>
					  </li>
					</ul>
					
				</div>
				<!-- 최근 문서 출력 -->
				<div class="col-md-12 py-3">
					
					<table class="table">
						<tr class="table-info table-success"><th>문서 번호</th><th>문서 제목</th><th>수정권한</th><th>작성자</th><th></th></tr>
					<%
						for(Document document : list){
							int dno=document.getDno();
					%>
							<tr>
								<td><%=document.getDno()%></td>
								<td><a href="../document/pageview.jsp?dno=<%=document.getDno()%>"><%=document.getDtitle()%></a></td>
								<td><%=DocumentDao.getdocumentDao().getMid(document.getDno()) %></td>
								<td><input class="form-check-input" onclick="check(<%=document.getDno()%>)" type="checkbox" name="debatecheck<%=document.getDno()%>"></td>
							</tr>
					<%	
						}
					%>
					</table>
				</div>
				<!-- 삭제 버튼 -->
				<div class="offset-10 col-md-2">
					<button class="form-control" onclick="dodelete()">삭제</button>
				</div>
					
			</div>
			
<%@include file="../footer.jsp" %>
<script src="/wiki/js/admin.js" type="text/javascript"></script>
</body>
</html>