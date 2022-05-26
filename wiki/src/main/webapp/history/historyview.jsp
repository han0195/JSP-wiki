<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- 되돌리기 눌럿을때 뜨는 페이지 -->
<% 
int cid = Integer.parseInt(request.getParameter("cid")); 
//문서번호를 가지고 해당 리스트 가져오기
%>
<h1>연결성공</h1>
<h2><%=cid%></h2>
</body>
</html>