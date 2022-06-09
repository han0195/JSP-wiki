<%@page import="java.util.ArrayList"%>
<%@page import="dto.Document"%>
<%@page import="dao.DocumentDao"%>
<%@page import="dao.SpecialDao"%>
<%@page import="dto.Content"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>비교 페이지</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<%
	int dno = Integer.parseInt(request.getParameter("dno"));
	int cid = Integer.parseInt(request.getParameter("cid"));
	/* 문서 */
	Document title = SpecialDao.getSpecialDao().getDocument(dno);
	/* 최신문서 */
	Content newcontent = DocumentDao.getdocumentDao().docuLoad(dno);
	/* 선택문서 */
	Content oldcontent = SpecialDao.getSpecialDao().getcontent(cid);
	%>
	<!-- js 날리기 전용 -->
	<input type="hidden" id="dno" value="<%=dno%>">
	<input type="hidden" id="cid" value="<%=cid%>">

	<div class="container">
		<div>
			<!-- 리스트 헤더 -->
			<h2 class="history_title" style="font-weight: bold;">
				<!-- 제목 -->
				<%=title.getDtitle()%>
				<span class="history_sub_title" style="font-weight: normal;">(문서역사)</span>
			</h2>
		</div>
		<div class="row">
			<!-- 문서 content 구역 -->
			<%
			String str = newcontent.getDcontent();
			int count = 0;
			for (int i = 0; i < str.length(); i++) {
				if (str.charAt(i) == '+') {
					count++;
				}
			}
			count = count / 2;
			String[] strarr = new String[count];
			for (int i = 0; i < strarr.length; i++) {
				strarr[i] = "";
			}
			int arrcount = 0;
			for (int i = 0; i < str.length(); i++) {
				if (str.charAt(i) == '+' && str.charAt(i - 1) == '+') {
					arrcount++;
				} else if (str.charAt(i) != '+' && str.charAt(i) != '=') {
					strarr[arrcount] += str.charAt(i);
				}
			}
			%>
			<%
			String str2 = oldcontent.getDcontent();
			int count2 = 0; // 선택문선 문단수 구하기
			for (int i = 0; i < str2.length(); i++) {
				if (str2.charAt(i) == '+') {
					count2++;
				}
			}
			count2 = count2 / 2; // ++ 두개이기때문에 / 2
			String[] strarr2 = new String[count2];
			for (int i = 0; i < strarr2.length; i++) {
				strarr2[i] = "";
			}
			int arrcount2 = 0;
			for (int i = 0; i < str2.length(); i++) {
				if (str2.charAt(i) == '+' && str2.charAt(i - 1) == '+') {
					arrcount2++;
				} else if (str2.charAt(i) != '+' && str2.charAt(i) != '=') {
					strarr2[arrcount2] += str2.charAt(i);
				}
			}
			%>
			<div>
				개행 | 내용
				<%
				for (int i = 0; i < strarr.length; i++) {
					if (strarr[i].equals(strarr2[i])) {// 비교 true이면 최신문서 출력
				%>
				<div style="padding:5px; background-color:#eeeeee;"><%=i%>
					|
					<%=strarr[i]%></div>
				<%
				} else { // 비교가 false이면
				%>
				<div
					style="padding:5px; background-color: #E6FFEC; border-bottom: 1px solid #999999">
					<span><%=i%></span> | <%=strarr[i]%></div>
				<!-- 최신문서 바탕색 초록 -->
				<div
					style="padding:5px; background-color: #FFEBE9; color: #999999; border-bottom: 1px solid #999999">
					<span><%=i%></span> | <%=strarr2[i]%></div>
				<!-- 선택문서 바탕색 빨강 -->
				<%
				}
				}
				%>
			</div>
		</div>
		<a href="history.jsp?dno=<%=dno%>"><button class="btn btn-success" style="margin-top: 15px;">뒤로가기</button></a> 
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="../js/comparison.js"></script>
</body>
</html>