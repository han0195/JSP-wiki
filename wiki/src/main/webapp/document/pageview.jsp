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
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../css/page.css">
</head>
<body>
	<%@include file="../header.jsp"%>
	<%if(request.getParameter("dno")!=null){
	int dno=Integer.parseInt(request.getParameter("dno"));
	Content c=DocumentDao.getdocumentDao().docuLoad(dno);
	String linkTitle="";
	String pagedocument="";
	System.out.println("정규식 일치여부 확인 : "+c.getDcontent().matches("(.*)(\\[\\[)(.*?)(\\]\\])(.*)"));
	if(c.getDcontent().matches("(.*)(\\[\\[)(.*?)(\\]\\])(.*)")) {
		//있을경우 [[ ]] 내부의 단어 추출
		Pattern pattern=Pattern.compile("(.*)(\\[\\[)(.*?)(\\]\\])(.*)");
		Matcher matcher=pattern.matcher(c.getDcontent());
		while(matcher.find()) {
			linkTitle=matcher.group(3).trim();
			// 추출한 단어를 넣어서 해당하는 링크할 제목의 문서 번호 호출
			int tno=DocumentDao.getdocumentDao().getdno(linkTitle);
			if(tno==-1) { // 해당하는 제목의 문서가 없다면
			String temp=c.getDcontent().replaceAll("\\[\\[", "<a href=\"pageview.jsp?dno=#\">");
			pagedocument=temp.replaceAll("\\]\\]", "</a>");
			}else { // 해당하는 제목의 문서가 있다면
			String temp=c.getDcontent().replaceAll("\\[\\[", "<a href=\"pageview.jsp?dno="+tno+"\">");
			pagedocument=temp.replaceAll("\\]\\]", "</a>");
			}
			if(matcher.group(3)==null) { // 정규표현식에 해당하는 문자열이 더이상 없다면
				break;
			}
		} // while e
	} //if e
	%>
	<div class="container"> <!-- 페이지 전체 컨테이너 -->
		<div class="row"> <!-- 상단 제목, 버튼들 박스 -->
			<div class="col-sm-4"><h1>제목</h1></div> <!-- 제목 -->
			<div class="col-sm-4 offset-4"> <!-- 버튼 -->
				<table class="table">
					<tr>
						<td onclick="good('<%=dno%>')">☆<%=DocumentDao.getdocumentDao().getGood(dno)%></td> <!-- 문서 좋아요 -->
						<td onclick="window.open('link.jsp?dno=<%=dno%>')">역링크</td>
						<td onclick="window.open('../debate/debatemain.jsp?dno=<%=dno%>')">토론</td>
						<td onclick="window.open('documentwrite.jsp?dno=<%=dno%>')">편집</td>
						<td onclick="window.open('../history/history.jsp?dno=<%=dno%>')">역사</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row"> <!-- 최근 수정 시각 출력 박스 -->
			<div class="col-sm-3 offset-9">
				<span>최근 수정 시각 : <%=c.getUpdatetime()%></span>
			</div>
		</div>
		<div> <!-- 내용 -->
			<%if(!pagedocument.equals("")){ %>
			<%=pagedocument%>
			<%}else{ %>
			<%=c.getDcontent()%>
			<%} %>
		</div>
	</div>
	<%}else{ %>
	<h1>페이지 오류</h1>
	<%} %>
	<%@include file="../footer.jsp"%>

</body>
</html>