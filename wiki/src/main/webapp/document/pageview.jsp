<%@page import="dao.SpecialDao"%>
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
	// 현재 문서 수정권한
	int ednum = SpecialDao.getSpecialDao().geteditnum(dno);
	if(pagedocument.contains("{{")){
		pagedocument=pagedocument.replaceAll("\\{\\{", "<h3>").replaceAll("\\}\\}", "</h3>");
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
						<% if(ednum != 1){%>
						<td onclick="window.open('documentupdate.jsp?dno=<%=dno%>')">편집</td>
						<%} %>			
						<td onclick="window.open('../history/history.jsp?dno=<%=dno%>')">역사</td>
						<% 
						String mid = (String) session.getAttribute("login"); // 세션 저장 아이디
						if(mid != null && mid.equals("admin")){// 만약 로그인한 아이디가 어드민이라면%>
						<td style="color: red;" data-bs-toggle="modal" data-bs-target="#exampleModal">수정금지</td>
						
						<%}%>
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
			<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">문서 수정 권한</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        정말 <span style="font-family: inherit;"> <%=DocumentDao.getdocumentDao().getTitle(dno) %></span> 문서의 수정을 금지하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button onclick="editben(<%=dno%>)" type="button" class="btn btn-primary">확인</button>
						      </div>
						    </div>
						  </div>
						</div>
	</div>
	<%}%>
						
	<%@include file="../footer.jsp"%>

<script src="/wiki/js/pageview.js" type="text/javascript"></script>	
</body>
</html>