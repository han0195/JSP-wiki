<%@page import="dao.DocumentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../css/page.css">
</head>
<body>
	<%@include file="../header.jsp"%>
	<%if(request.getParameter("dno")!=null){
	int dno=Integer.parseInt(request.getParameter("dno"));%>
	<div class="container"> <!-- 페이지 전체 컨테이너 -->
		<div class="row"> <!-- 상단 제목, 버튼들 박스 -->
			<div class="col-sm-4"><h1>제목</h1></div> <!-- 제목 -->
			<div class="col-sm-4 offset-4"> <!-- 버튼 -->
				<table>
					<tr>
						<td onclick="good('<%=dno%>')">☆</td> <!-- 문서 좋아요 -->
						<td onclick="window.open('link.jsp?dno=<%=dno%>')">역링크</td>
						<td onclick="window.open('../debate/debateview.jsp?Deno=<%=dno%>')">토론</td>
						<td onclick="window.open('documentwrite.jsp?dno=<%=dno%>')">편집</td>
						<td onclick="window.open('../history.jsp?dno=<%=dno%>')">역사</td>
					</tr>
				</table>
			</div>
		</div>
		<div> <!-- 내용 -->
			<%=DocumentDao.getdocumentDao().docuLoad(dno)%>
		</div>
	</div>
	<%}else{ %>
	<h1>페이지 오류</h1>
	<%} %>
	<%@include file="../footer.jsp"%>

</body>
</html>