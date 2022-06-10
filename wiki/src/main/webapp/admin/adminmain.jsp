<%@page import="dao.DocumentDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.DebateDao"%>
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
	Date date = new Date();
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
	String today=sdf.format(date);
	String decount=DebateDao.getDebateDao().findDayCount(today);
	String docount=DocumentDao.getdocumentDao().docuFindCount(today);
%>
		
		
	<div class="container">
		<div class="text-center">
			<ul class="nav nav-tabs">
			 	  <li class="nav-item position-relative">
				  		<a class="nav-link active" aria-current="page" href="/wiki/admin/adminmain.jsp">HOME</a>
				  </li>
				  <li class="nav-item position-relative">

				    <a class="nav-link active" aria-current="page" href="/wiki/admin/admindocument.jsp">최근 문서</a>
					<%
						if(docount==null){
					%>	
						 <span class="position-absolute top-0 start-95 translate-middle badge rounded-pill bg-danger">
					   		 0+
					 	 </span>
					<% 
						}else{
					%>
						<span class="position-absolute top-0 start-95 translate-middle badge rounded-pill bg-danger">
					   		 <%=docount%>+
					  	</span>
					<%		
						}
					%>			     
					  
				  </li>
				  <li class="nav-item  position-relative">
				    <a class="nav-link active" aria-current="page" href="/wiki/admin/admindebate.jsp">최근 토론</a>
				 	<%
				 		if(decount==null){
				 	%>
				 		<span class="position-absolute top-0 start-95 translate-middle badge rounded-pill bg-danger">
					   		 0+
					 	</span>
				 	<% 		
				 		}else{
				 	%>
				 		<span class="position-absolute top-0 start-95 translate-middle badge rounded-pill bg-danger">
					   		 <%=decount%>+
					 	</span>
				 	<%		
				 		}
				 	%>   
				  </li>
				   <li class="nav-item  position-relative">
				 	 <a class="nav-link active" aria-current="page" href="/wiki/admin/membermanagement.jsp">회원관리</a>
				  </li>
				   <li class="nav-item  position-relative px-1">
				    <a class="nav-link active" aria-current="page" href="/wiki/admin/sameword.jsp">동의어 등록</a>
				    </li>
			</ul>
		</div>
		<div class="text-center py-5 my-5">
			<img alt="" src="/wiki/img/mainlogo.png">
			<br>
			<h2>Hello. Admin!!</h2>
			<br>
			
		</div>
		
		<div id="chart_div" style="width: 100%; height: 500px;">
		
		</div>
	</div>
	
	
	
	
	
	
	
			
<%@include file="../footer.jsp" %>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="/wiki/js/admin.js" type="text/javascript"></script>
</body>
</html>