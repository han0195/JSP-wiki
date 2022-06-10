<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao"%>
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
		ArrayList<Member> memberList=MemberDao.getmemberDao().getMemberList();
		String searchId=request.getParameter("searchid");
	    ArrayList<Member>searchList=MemberDao.getmemberDao().getMemberSearch(searchId);
	%>
	<div class="container">
		<div class="col-md-12">
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
		<form action="/wiki/admin/membermanagement.jsp" method="get">
			<div class="offset-8 col-md-4 py-4">
			
				<div class="row">
					<div class="col-md-8">
						<input class="form-control"type="text" name="searchid" value="">
					</div>
					<div class="col-md-4">
						<button class="form-control">검색</button>
					</div>
				</div>
			</div>
		</form>
		<div class="col-md-12 py-3">
			<table class="table">
				<tr class="table-info"><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th></tr>
				
				
				<%
					if(searchList.isEmpty()==true){
						for(Member member : memberList){ 
							if(member.getMid().equals("admin")){
				%>
						<tr>
							<td><a href="/wiki/admin/memberprofile.jsp?mno=<%=member.getMno()%>"><%="<관리자>"+member.getMid()%></a></td>
							<td><%=member.getMpw()%></td>
							<td><%=member.getMname()%></td>
							<td><%=member.getMphone()%></td>
						</tr>
				<%
							}else{
				%>
						<tr>
							<td><a href="/wiki/admin/memberprofile.jsp?mno=<%=member.getMno()%>"><%=member.getMid()%></a></td>
							<td><%=member.getMpw()%></td>
							<td><%=member.getMname()%></td>
							<td><%=member.getMphone()%></td>
						</tr>
				<% 			
							}
						}
					}else{
						for(Member member : searchList){
							if(member.getMid().equals("admin")){
				%>
						<tr>
							<td><a href="/wiki/admin/memberprofile.jsp?mno=<%=member.getMno()%>"><%="<관리자>"+member.getMid()%></a></td>
							<td><%=member.getMpw()%></td>
							<td><%=member.getMname()%></td>
							<td><%=member.getMphone()%></td>
						</tr>
				<% 		
							}else{
				%>
							<tr>
								<td><a href="/wiki/admin/memberprofile.jsp?mno=<%=member.getMno()%>"><%=member.getMid()%></a></td>
								<td><%=member.getMpw()%></td>
								<td><%=member.getMname()%></td>
								<td><%=member.getMphone()%></td>
							</tr>
				<% 				
							}
						}
					}
					searchList.clear();
				%>
			</table>
			</div>
		</div>
	</div>
	
	<%@include file="../footer.jsp" %>
</body>
</html>