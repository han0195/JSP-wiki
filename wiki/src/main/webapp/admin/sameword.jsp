<%@page import="dto.Synonys"%>
<%@page import="dao.DocumentDao"%>
<%@page import="dto.Document"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<%
	ArrayList<Document> list = DocumentDao.getdocumentDao().doculist();
	ArrayList<Synonys> slist = DocumentDao.getdocumentDao().synlist();
	%>
	<div class="container">
		<div class="text-center">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admindocument.jsp">최근 문서</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admindebate.jsp">최근 토론</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="sameword.jsp">동의어 등록</a></li>
			</ul>
		</div>
		<!-- 최근 문서 출력 -->
		<div class="col-md-12 py-3">
			<div class="row">
				<div class="col-md-2">
					<input type="text" id="sameword" class="form-control"
						placeholder="동의어를 입력하세요">
				</div>
				<div class="col-md-3">
					<button class="form-control" onclick="wordplus()">동의어 등록</button>
				</div>
				<div class="col-md-3 offset-1">
					<button type="button" class="form-control" data-bs-toggle="modal"
						data-bs-target="#exampleModal">동의어 관리</button>
				</div>
			</div>
			<table class="table">
				<tr class="table-info table-success">
					<th>문서 번호</th>
					<th>문서 제목</th>
					<th>작성자</th>
					<th></th>
				</tr>
				<%
				for (Document document : list) {
					int dno = document.getDno();
				%>
				<tr>
					<td><%=document.getDno()%></td>
					<td><a
						href="../debate/debateview.jsp?Deno=<%=document.getDno()%>"><%=document.getDtitle()%></a></td>
					<td><%=DocumentDao.getdocumentDao().getMid(document.getDno())%></td>
					<td><input class="form-check-input"
						onclick="check(<%=document.getDno()%>)" type="checkbox"
						name="debatecheck<%=document.getDno()%>"></td>
				</tr>
				<%
				}
				%>
			</table>
		</div>
		<!-- 동의어 등록 버튼 -->


	</div>
	<!-- 모달 구역 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true" >
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">동의어 관리</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<table class="table">
						<tr>
							<th>동의어 번호</th>
							<th>동의어로 등록된 문서들(문서번호)</th>
							<th>동의어</th>
							<th>비고</th>
						</tr>

						<%
						for (Synonys temp : slist) {
						%>
						<tr>
							<td><%=temp.getSno()%><input type="hidden"
								value="<%=temp.getSno()%>" class="snos"></td>
							<td><%=temp.getDno()%></td>
							<td><%=temp.getSynpage()%></td>
							<td><input class="form-check-input"
								onclick="check2(<%=temp.getDno()%>)" type="checkbox"
								value="<%=temp.getSno()%>"
								name="debatecheck2<%=temp.getDno()%>"></td>
							<td> 
							<button type="button" style="font-size: 4px;"
									onclick="rewordcss('<%=temp.getSno()%>')">동의어 수정</button>
							<button type="button"  style="font-size: 4px;"
									onclick="worddelete('<%=temp.getSno()%>')">동의어 삭제</button></td>
						</tr>
						<%
						}
						%>
					</table>
				</div>
				<div class="modal-footer">

					<input type="text" style="display: none;" id="reword"
						class="form-control">
					<button id="up" type="button" class="form-control"
						onclick="wordupdate()" style="display: none;">동의어 수정 완료</button>

					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


	<%@include file="../footer.jsp"%>
	<script src="/wiki/js/sameword.js" type="text/javascript"></script>
</body>
</html>