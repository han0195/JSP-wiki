<%@page import="dao.DebateDao"%>
<%@page import="java.util.ArrayList"%>
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
	session.getAttribute("login");
	
%>
	<div class="container">
		<div class="col-md-12 row">
		
		<!-- 토론 페이지 헤더글  -->	
			<div class="col-md-2 py-3">
				<h1>토론생성</h1>
			</div>
			
		<!-- 토론 생성 안내문-->
		<div class="col-md-12  text-center py-5">
			<div class="text-center py-5">
				<img src="/wiki/img/멈춰.png" id="stop">
			</div>
			
			<div class="offset-3 col-md-6 bg-warning" id="debateinfo">
				<div class="col-md-12 bg-success">이렇게 하시면 안돼요!　　   2022-05-25 </div>
				[경고!] 이 토론은 위키:대문 문서의 토론입니다. <br>위키:대문 문서와 관련 없는 토론은 각 문서의 토론에서 진행해 주시기 바랍니다. <br>위키:대문 문서와 관련 없는 토론은 삭제될 수 있습니다.
				<br>
				<br>
				이 토론은 위키:대문 문서의 대문의 디자인이나, 내용에 대해서 논의를 하는 공간입니다.<br>
				위키의 문서와 관련된 토론이라면, 해당 문서의 토론란에서 토론을 하시기 바라며,<br> 
				자신이 작성한 문서의 내용 보충등을 요청하는 경우라면,<br>
				 게시판 그루터기에서 요청을 하시기 바랍니다.<br>
				위키의 토론은 문서의 방향성을 바로잡기 위한 것이며,<br>
				 단순히 토론을 위한 공간이 아닙니다.<br>
				이와 관련되지 않은 토론은 임의로 종료될 수 있습니다. 이 점 참고하시기 바랍니다.
			</div>
		</div>	
		
		<!-- 토론 작성 헤더글  -->
		<div class="col-md-12 text-center">
			<h1>토론 작성</h1>
		</div>
		<!-- 토론 작성 폼 -->
		<form action="../debate/CreateDebate" method="get">
			<input type="hidden" value="<%=login%>" name="id">
			<!-- 토론 제목 -->
			<span>토론 신청 제목</span>
			<textarea class="form-control" name="debatetitle"></textarea>
			<!-- 토론 내용 작성 -->
			<span>토론 신청 내용</span>
			<textarea class="form-control" rows="10" cols="10" name="debatecontent"></textarea>
			<div class="row">
				<div class="offset-6 col-md-3 py-3">
					<button class="form-control" type="submit">토론 신청 하기 </button>
				</div>
				<div class="col-md-3 py-3">
					<button class="form-control" type="reset"> 취소 </button>
				</div>
			</div>
		</form>

	</div>
	</div>
	
	
	
	
	
	
	
			
<%@include file="../footer.jsp" %>
</body>
</html>