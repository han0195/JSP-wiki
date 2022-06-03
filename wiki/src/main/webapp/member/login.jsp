<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="../css/login.css" rel="stylesheet">
<!-- 부트스트랩 -->
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../header.jsp" %>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<!-- Tabs Titles -->

			<!-- Icon -->
			<div class="fadeIn first">
				<span>나무 위키 로그인</span><br>
				<span id="status" style="color:red;"></span>
			</div>

			<!-- Login Form -->
				<input type="text" id="mid" class="fadeIn second" name="mid"
					placeholder="아이디">
				<input type="text" id="mpw"
					class="fadeIn third" name="mpw" placeholder="비밀번호"> 					
				<input onclick="login()"
					type="button" class="fadeIn fourth" value="로그인" style="background-color: green;">

			<!-- Remind Passowrd -->
			<div id="formFooter">
				<a class="underlineHover" href="singup.jsp">회원가입 </a><span> | </span>
				<a class="underlineHover" href="#">아이디찾기 </a><span> | </span>
				<a class="underlineHover" href="#"> 비밀번호찾기 </a><span> | </span>
				<a class="underlineHover" href="../main.jsp"> 뒤로가기 </a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../js/login.js"></script>
	<%@ include file="../footer.jsp" %>
</body>
</html>