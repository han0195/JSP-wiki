<%@page import="dao.DebateDao"%>
<%@page import="dto.Debate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<%
	ArrayList<Debate> debateList=DebateDao.getDebateDao().getDebateList();

%>
<%@include file="../header.jsp" %>
	
	
	<div class="container">
		<div class="col-md-12 row">
		<!-- 토론 페이지 안내  -->	
			<div class="col-md-2 py-3">
				<h1>최근토론</h1>
			</div>
		<div>
		<!-- 토론 생성 버튼 -->
			<div class="offset-10 col-md-2 py-1">
					<a href="../debate/debatecrate.jsp"><button class="form-control">토론생성</button></a>
			</div>
		<!-- 토론 테이블 표  -->	
				<table class="table table-hover">
					<tr class="table-success"><th>항목</th><th>수정시간</th></tr>
					<!-- for문으로 진행중인 토론방 생성 -->
					<%
						for(Debate debate : debateList){
							int Deno=debate.getDeno();
							String updateTime=DebateDao.getDebateDao().getTime(Deno);
							
													
					%>
						<tr>
							<td><a href="../debate/debateview.jsp?Deno=<%=debate.getDeno()%>"><%=debate.getDetitle()%></a></td>
					<%
								if(updateTime==null){ 
					%>
									<td><%=debate.getDedate()%></td>
					<%		
								}else{
					%>
									<td><%=updateTime%></td>
					<% 				
								}
						}
					%>		
						</tr>
					
				</table>
			</div>
			
			 
		
		</div>
	</div>
	
	
	
	
	
	
	
			
<%@include file="../footer.jsp" %>
</body>
</html>