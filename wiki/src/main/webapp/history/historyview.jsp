<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<!-- �ǵ����� �������� �ߴ� ������ -->
<% 
int cid = Integer.parseInt(request.getParameter("cid")); 
//������ȣ�� ������ �ش� ����Ʈ ��������
%>
<h1>���Ἲ��</h1>
<h2><%=cid%></h2>
</body>
</html>