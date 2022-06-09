<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/pass.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<span>아이디찾기</span><br> <span id="status"
					style="color: red;"></span>
			</div>

			<!-- Login Form -->
			<input type="text" id="mname" class="fadeIn second" name="mid"
				placeholder="이름"> 
			<input type="text" id="mphone"
				class="fadeIn third" name="mpw" placeholder="전화번호"> <input
				onclick="idfind()" type="button" class="fadeIn fourth" value="아이디찾기"
				style="background-color: green;">

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="singup.jsp">회원가입 </a><span> |
				<a class="underlineHover" href="login.jsp"> 뒤로가기 </a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/pass.js"></script>
	<%@ include file="../footer.jsp"%>
</body>
</html>