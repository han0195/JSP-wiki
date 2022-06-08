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
	<%@ include file="../header.jsp"%>
	<%
	int dno = Integer.parseInt(request.getParameter("dno"));
	//Document 가져오기
	Document document = SpecialDao.getSpecialDao().getDocument(dno);

	String mids = (String) session.getAttribute("login");
	%>
	<div class="container history_wr">
		<!-- 본문 -->
		<input type="hidden" id="mid" value="<%=mids%>">
		<div>
			<!-- 리스트 헤더 -->
			<input id="dnohid" type="hidden" value="<%=dno%>">
			<h2 class="history_title">
				<!-- 제목 -->
				<%=document.getDtitle()%>
				<span class="history_sub_title">(문서역사)</span>
			</h2>

			<a><button class="btn btn-outline-dark">편집</button></a> <a><button
					class="btn btn-outline-dark">역링크</button></a>

		</div>
		<!-- 리스트 헤더 end -->

		<div style="background-color: #eeeeee; padding: 20px 10px;" class="historylistdiv">
			<!-- 역사 리스트-->
			<ul id="history_list_ul">
		
			</ul>
		</div>
		<!-- 역사리스트 end -->
		<select id="dataPerPage">
			<option value="10">10개씩보기</option>
			<option value="15">15개씩보기</option>
			<option value="20">20개씩보기</option>
		</select>
		<div>
			<!-- 페이징 -->
			<button type="button" class="btn btn-success hisbtn">이전</button>
			<ul id="pagingul">
			</ul>
			<button type="button" class="btn btn-success hisbtn">다음</button>
		</div>
		<!-- 페이징 end -->

	</div>
	<!-- 본문 div end -->

	<!-- 푸터 -->
	<%@ include file="../footer.jsp"%>
	<!-- 사용자 지정 js -->
	<script src="../js/history.js" type="text/javascript"></script>
</body>
</html>