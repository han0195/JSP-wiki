<%@page import="dto.Member"%>
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
	int mno=Integer.parseInt(request.getParameter("mno"));
	Member member=MemberDao.getmemberDao().myInfo(mno);
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
		</div>
		<div class="col-md-4 py-5">
			<h3>회원정보</h3>
			<hr>
		</div>
		
		<div class="col-md-12">
			
			<strong>아이디 ( ID ) :</strong> <%=member.getMid() %>
			<hr>
			<strong>비밀번호 ( PASSWORD ) :</strong> <%=member.getMpw() %>
			<hr>
			<strong>이름  ( NAME )  :</strong> <%=member.getMname() %>
			<hr>
			<strong>전화번호 ( PHONE ) :</strong> <%=member.getMphone() %>
 		
 		</div>
 		
 		<div class="offset-10 col-md-2">
 			<button class="form-control" onclick="memberDelete(<%=mno%>)">회원탈퇴</button>
 		</div>
	</div>
	<%@include file="../footer.jsp" %>
	<script src="/wiki/js/admin.js" type="text/javascript"></script>
</body>
</html>