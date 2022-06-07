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
<title> 비교 페이지 </title>
</head>
<body>
	<%@ include file="../header.jsp" %>
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
	<input type="hidden" id="dno" value="<%= dno %>">
	<input type="hidden" id="cid" value="<%= cid %>">
	
	<div class="container">
		<div><!-- 리스트 헤더 -->	
			<h2 class="history_title">
				<!-- 제목 -->
				<%=title.getDtitle()%>
				<span class="history_sub_title">(문서역사)</span>
			</h2>
		</div>
		<div class="row"><!-- 문서 content 구역 -->
			<div class="col-6"><!-- 최신문서뷰 구역 -->
				<h3>최신문서</h3>
				<div> <!-- 문서내용 출력구역 -->
					<% 
					String str = newcontent.getDcontent();
					int count = 0;
					for(int i = 0; i < str.length(); i++){
						if(str.charAt(i) == '+'){
							count++;
						}
					}
					count = count / 2;
					String[] strarr = new String[count];
					for(int i = 0; i < strarr.length; i++){
						strarr[i] = "";
					}
					int arrcount = 0;
					for(int i = 0; i < str.length(); i++){
						if(str.charAt(i) == '+' && str.charAt(i - 1) == '+'){
							arrcount++;
						}else if(str.charAt(i) != '+' && str.charAt(i) != '='){
							strarr[arrcount] += str.charAt(i);
						}
					}%>			
					<%for(int i = 0; i < strarr.length; i++){%>
						<div><%=i%> | <%=strarr[i]%></div>
					<%}%>
					
				
					
					
					
				</div>
			</div>
			<div class="col-6"><!-- 선택문서뷰 구역 -->
				<h3>선택문서</h3>
				<div> <!-- 문서내용 출력구역 -->
					<% 
					String str2 = oldcontent.getDcontent();
					int count2 = 0; // 선택문선 문단수 구하기
					for(int i = 0; i < str2.length(); i++){
						if(str2.charAt(i) == '+'){
							count2++;
						}
					}
					count2 = count2 / 2;	// ++ 두개이기때문에 / 2
					String[] strarr2 = new String[count2];
					for(int i = 0; i < strarr2.length; i++){
						strarr2[i] = "";
					}
					int arrcount2 = 0;
					for(int i = 0; i < str2.length(); i++){
						if(str2.charAt(i) == '+' && str2.charAt(i - 1) == '+'){
							arrcount2++;
						}else if(str.charAt(i) != '+' && str2.charAt(i) != '='){
							strarr2[arrcount2] += str2.charAt(i);
						}
					}%>			
					<%for(int i = 0; i < strarr.length; i++){%>
						<div><%=i%> | <%=strarr[i]%></div>
					<%}%>
				</div>
			</div>
		</div>
		<div>
			<h3>비교</h3>
			<%
			for(int i = 0; i < strarr.length ; i++){				
				if(strarr[i].equals(strarr2[i])){// 비교 true이면 최신문서 출력%>
					<div><%=i%> | <%=strarr[i]%></div>
				<%}else{ // 비교가 false이면%>
					<div style="background-color: #E6FFEC;"><span style="background:green; border: 1px solid;"><%=i%></span><%=strarr[i]%></div> <!-- 최신문서 바탕색 초록 -->
					<div style="background-color: #FFEBE9; color:#999999;"><span style="background: red; border: 1px solid;"><%=i%></span><%=strarr2[i]%></div> <!-- 선택문서 바탕색 빨강 -->
				<%}
			}
			
			%>			
		</div>
	</div>
	
	<%@ include file="../footer.jsp" %>
	<script type="text/javascript" src="../js/comparison.js"></script>
</body>
</html>