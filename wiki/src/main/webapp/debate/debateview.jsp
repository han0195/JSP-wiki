<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="dao.DebateDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Debate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="/wiki/css/debate.css" rel="stylesheet">
</head>
<body>
<%@include file="../header.jsp" %>
<%
int Deno=Integer.parseInt(request.getParameter("Deno"));	
String content = DebateDao.getDebateDao().debateIn(Deno);
Date date =new Date();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
String today=sdf.format(date);
%>
<input type="hidden" value="<%=today%>" id="today">
<div class="container">
	
	<!-- 토론주제 보여주기 -->
	<h1>토론주제</h1>
	<div class="row">
		<div class="col-md-5 py-5" id="debatetopic">
			<h4><%=content %></h4>
			</div>
		<div class="offset-2 col-md-5">
			<H3>광고위치</H3>
		</div>
	</div>
	
	<!-- 경계선 -->
	<hr>
	
	<!-- 토론 내용 간판 -->
	<div class="py-5 row">
		<div class="col-md-2 py-4">
			<h1>토론 내용</h1>
		</div>
		<div class="col-md-1 px-2">
			<img alt="debate" src="../img/debate.png" style="width: 80px; height: 80px;">
		</div>
	</div>
	
	<!-- 토론 내용  -->
	<div id="debatezone" class="col-md-12 py-5">
		
		<div id="debatecontent" class="col-md-9">
			<div class="row">
				<div id="did" class="col-md-5">
					아이디
				</div>
				<div id="ddate" class="offset-5 col-md-2">
					날짜
				</div>
			</div>
			<div id="content" class="col-md-12">
				내용
			</div>
		</div>
	</div>
	
	
	<!-- 경계선 -->
	<hr>	
	
	
	<!-- 토론 전송 -->
	<div class="col-md-12">
		<!-- 토론 참여 간판 -->
		<div class="col-md-4">
			<h1>토론에 참여할래요!</h1>
		</div>
		
		<!--토론작성 란 -->
		<div class="col-md-12">
			<textarea rows="5" cols="" class="form-control" onkeyup="enterkey()" id="dcontent"></textarea>
		</div>
		
		<!-- 토론 전송 버튼 -->
		<div class="offset-10 col-md-2 py-2">
			<button class="form-control py-2" onclick="sendbtn()">전송</button>
		</div>
	</div>


</div>






<script src="/wiki/js/debate.js" type="text/javascript"></script>
<%@include file="../footer.jsp" %>
</body>
</html>