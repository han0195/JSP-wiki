<%@page import="dto.Debate"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DebateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<%
	 ArrayList<Debate> list=DebateDao.getDebateDao().getDebateList();
	%>
	<%@include file="../header.jsp" %>
			<!-- 리스트 -->
			<div class="container">
				<div class="text-center">
					<ul class="nav nav-tabs">
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="admindocument.jsp">최근 문서</a>
					  </li>
					  <li class="nav-item">
					    <a class="nav-link active" aria-current="page" href="admindebate.jsp">최근 토론</a>
					  </li>
					   <li class="nav-item  position-relative">
				 	 <a class="nav-link active" aria-current="page" href="/wiki/admin/membermanagement.jsp">회원관리</a>
				  	</li>
					</ul>
				</div>
				<!-- 최근 토론 출력 -->
				<div class="col-md-12 py-3">
					<table class="table">
						<tr class="table-info table-success"><th>번호</th><th>항목</th><th>수정시간</th><th></th></tr>
					<%
						for(Debate debate : list){
							int deno=debate.getDeno();
							DebateDao.getDebateDao().timeUpdate(deno);
							if(debate.getDestate().equals("1")){
					%>
					
							<tr>
								<td><%=debate.getDeno() %></td>
								<td><a href="../debate/debateview.jsp?Deno=<%=debate.getDeno()%>"><%=debate.getDetitle()%></a></td>
								<td><%=debate.getDedate()%></td>
								<td><input class="form-check-input" onclick="check(<%=debate.getDeno() %>)" type="checkbox" name="debatecheck<%=debate.getDeno()%>"></td>
							</tr>
					<%
							}
						}
					%>
					</table>
				</div>
				<!-- 삭제 버튼 -->
				<div class="offset-10 col-md-2">
					<button class="form-control" onclick="dedelete()">삭제</button>
				</div>
				
			</div>
	<%@include file="../footer.jsp" %>
	<script src="/wiki/js/admin.js" type="text/javascript"></script>
</body>
</html>