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
	<div class="history_wr">
		<!-- 본문 -->
		<input type="hidden" id="mid" value="<%=mids%>">
		<div style="margin: 0 auto; text-align: center;">
			<!-- 리스트 헤더 -->
			<input id="dnohid" type="hidden" value="<%=dno%>">
			<h2 class="history_title">
				<!-- 제목 -->
				<%=document.getDtitle()%>
				<span class="history_sub_title">(문서역사)</span>
			</h2>
		</div>
		<!-- 리스트 헤더 end -->


		<!-- 역사 리스트-->
		<section class="timeline">
			<ul id="slom">
				<li>
					<div>
						<time>1687</time>
						<div class="discovery">
							<h3>기여자</h3>
							<p>sd</p>
						</div>
						<div class="scientist">
							<button style="width: 100px" class="btn btn-primary">추천</button>
							<button style="width: 100px" class="btn btn-danger">비추천</button>
						</div>
					</div>
				</li>

			</ul>
		</section>

		<!-- 역사리스트 end -->
		<div class="pagediv">
			<select id="dataPerPage">
				<option value="10">10개씩보기</option>
				<option value="15">15개씩보기</option>
				<option value="20">20개씩보기</option>
			</select>
			<div>
				<!-- 페이징 -->
				<ul id="pagingul">
				</ul>
			</div>
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