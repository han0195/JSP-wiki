<%@page import="dao.SpecialDao"%>
<%@page import="dao.DocumentDao"%>
<%@page import="dto.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>history</title>
<!-- 사용자지정 css -->
<link href="/wiki/css/history.css" rel="stylesheet">
</head>
<body>
	<!-- 헤더 -->
	<%@ include file="../header.jsp" %>
	<% int dno = Integer.parseInt(request.getParameter("dno")); 
		//Document 가져오기
		Document document = SpecialDao.getSpecialDao().getDocument(dno);
	%>
	<div class="container history_wr"><!-- 본문 -->
	
	<div><!-- 리스트 헤더 -->
		<input id="dnohid" type="hidden" value="<%=dno%>">
		<h2 class="history_title"><!-- 제목 -->
			<%=document.getDtitle()%> <span class="history_sub_title">(문서역사)</span>
		</h2>
		
		<a><button class="btn btn-outline-dark">편집</button></a>
		<a><button class="btn btn-outline-dark">역링크</button></a>
		
	</div><!-- 리스트 헤더 -->
			
		<div class="historylistdiv"><!-- 역사 리스트-->
			<ul id="history_list_ul">
				<!-- 테스트 li -->
				<li>0000-00-00 00:00:00 [ <a onclick="paging(dcoumentcodeview.jsp)"> 보기</a> | <a href="#">
						비교</a> | <a href="#"> 추천 </a> | <a href="#" onclick=""> 비추천 </a> | <a href="#">
						되돌리기 </a> ] 수정순서 ( ) 테스트글()
				</li>
			</ul>
		</div><!-- 역사리스트 end -->
		
		<!-- 페이징 -->
		<select id="dataPerPage">
	        <option value="10">10개씩보기</option>
	        <option value="15">15개씩보기</option>
	        <option value="20">20개씩보기</option>
		</select>	
		<ul id="pagingul">
		</ul>	
		<!-- 페이징 -->
		<br>
		<button type="button" class="btn btn-success hisbtn">이전</button>
		<button type="button" class="btn btn-success hisbtn">다음</button>

	</div><!-- 본문 div end -->
	
	<!-- 푸터 -->
	<%@ include file="../footer.jsp" %>
	<!-- 사용자 지정 js -->
	<script src="../js/history.js" type="text/javascript"></script>
</body>
</html>