<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="dto.Content"%>
<%@page import="dao.DocumentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 보기 페이지</title>
	<link rel="stylesheet" type="text/css" href="../css/page.css">
</head>
<body>
	<%@include file="../header.jsp"%>
	<%if(request.getParameter("dno")!=null){
	int dno=Integer.parseInt(request.getParameter("dno"));
	Content c=DocumentDao.getdocumentDao().docuLoad(dno);
	String linkTitle="";
	String pagedocument="";
	   Matcher m = Pattern.compile("(?<=\\[\\[)[^]]+(?=\\]\\])").matcher(c.getDcontent());
	   while (m.find()) {
		 linkTitle=m.group().replace("[[", "").replace("]]", "");
		 int tno=DocumentDao.getdocumentDao().getdno(linkTitle);
	     if(tno==-1){
	         c.setDcontent( c.getDcontent().replace( "[["+m.group()+"]]", "<a href=\"#\">"+m.group()+"</a>") );
	     }else{
	         c.setDcontent( c.getDcontent().replace( "[["+m.group()+"]]", "<a href=\"pageview.jsp?dno="+tno+"\">"+m.group()+"</a>") );
	     }
	   }
	   pagedocument = c.getDcontent();
	   if(pagedocument.contains("==")) {
			pagedocument = pagedocument.replaceAll("==", "<p>");
			}
	if(pagedocument.contains("++")) {
	pagedocument = pagedocument.replaceAll("\\+\\+", "</p><br>");
	}
	%>
	<input type="hidden" value="<%=dno%>" id="dno">
	<div class="container"> <!-- 페이지 전체 컨테이너 -->
		<div class="row"> <!-- 상단 제목, 버튼들 박스 -->
			<div class="col-sm-4"><h1><%=DocumentDao.getdocumentDao().getTitle(dno) %></h1></div> <!-- 제목 -->
			<div class="col-sm-4 offset-4"> <!-- 버튼 -->
				<table class="table">
					<tr>
						<td onclick="good('<%=dno%>')">☆<%=DocumentDao.getdocumentDao().getGood(dno)%></td> <!-- 문서 좋아요 -->
						<td onclick="window.open('link.jsp?dno=<%=dno%>')">역링크</td>
						<td onclick="window.open('../debate/debatemain.jsp?dno=<%=dno%>')">토론</td>
						<td onclick="window.open('documentupdate.jsp?dno=<%=dno%>')">편집</td>
						<td onclick="window.open('../history/history.jsp?dno=<%=dno%>')">역사</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row"> <!-- 최근 수정 시각 출력 박스 -->
			<div class="col-sm-4 offset-8">
				<span>최근 수정 시각 : <%=c.getUpdatetime()%></span> 
			</div>
		</div>

		<div> <!-- 내용 -->
			<%=pagedocument%>

		</div>
		
		<br><br><br>
	</div>
	<%}%>
	<%@include file="../footer.jsp"%>

<script src="/wiki/js/pageview.js" type="text/javascript"></script>	
</body>
</html>