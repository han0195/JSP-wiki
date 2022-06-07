<%@page import="dao.DocumentDao"%>
<%@page import="dto.Content"%>
<%@page import="dao.SpecialDao"%>
<%@page import="dto.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 사용자지정 css -->
<link href="/wiki/css/history.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<!-- 되돌리기 눌럿을때 뜨는 페이지 -->
	<%
	int cid = Integer.parseInt(request.getParameter("cid"));
	//문서내용 가져오기
	Content content = SpecialDao.getSpecialDao().getcontent(cid);
	//Document 가져오기
	Document document = SpecialDao.getSpecialDao().getDocument(content.getDno());
	%>
	<div class="container">
		<!-- 본문 -->
		<div><!-- 리스트 헤더 -->
			<!-- 문서내용번호 저장 -->
			<input id="dnohid2" type="hidden" value="<%=cid%>">
			<h2 class="history_title">
				<!-- 제목 -->
				<%=document.getDtitle()%>
				<span class="histsory_sub_title">(문서역사)</span>
			</h2>
			<a><button class="btn btn-outline-dark">편집</button></a> <a><button
					class="btn btn-outline-dark">역링크</button></a>
		</div><!-- 리스트 헤더 -->
		
		<!-- 문서내용 -->
		<textarea rows="10" cols="150" disabled>
		<%= content.getDcontent() %>
		</textarea>
		<!-- 문서내용 -->
		
		<!-- 모달 버튼 --><br>
		<button type="button" class="btn btn-success hisbtn" data-bs-toggle="modal" data-bs-target="#exampleModal">
  		되돌리기
		</button>
		<!-- 모달 페이지 -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">현재문서로 되돌리기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="color: red">
		       	[주의]문서를 되롤리지 회원아이디 또는 아이피는 역사의 기록됩니다!
		      </div>
		      <div class="modal-footer">
		        <button onclick="revert(<%=cid%>)" type="button" class="btn btn-primary">되돌리기</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
		      </div>
		    </div>
		  </div>
		</div>
		
		
		<a href="history.jsp?dno=<%=document.getDno()%>"><button type="button" class="btn btn-success hisbtn">취소</button></a> 
		<span>* 되돌리기 선택할시 역사가 기록됩니다.</span>
	</div><!-- 본문end -->
	
	<!-- 사용자 지정 js -->
	<script type="text/javascript" src="../js/historyview.js"></script>
	<%@ include file="../footer.jsp"%>
	
	
</body>
</html>