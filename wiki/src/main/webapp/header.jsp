<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위키위키</title>

	<!-- 부트스트랩 css cdn -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<!-- 사용자정의 css -->
	<link href="/wiki/css/main.css" rel="stylesheet">
</head>
<body>

<div class="text-center py-3">
			
			<div class="col-md-12 row text-dark ">
				
				<div class="col-md-3">
				
					<a href="/wiki/main.jsp"><img alt="Logo" src=""> </a>　　
					<a href="/wiki/document/documentview.jsp">문서 </a>　　
					<a href="/wiki/debate/debatemain.jsp">토론하기 </a>　　
					<a href="#">특수기능</a>
					
				</div>

				<div class="offset-3 col-md-6">
					<div class="col-md-12 row">
						
						<div class="col-md-6">
							<input type="text" class="form-control">				
						</div>
						<div class="col-md-1">
							<a href="#"><img alt="Search" src="/wiki/img/search.png" class="headerImg"></a>
						</div>
						<!-- 로그인 -->
						<% String mid = (String) session.getAttribute("login");
							if(mid == null){		
						%>
						<div class="col-md-2">
							<a href="/wiki/member/login.jsp">로그인</a> 　
						</div>
						<% }else{ %>
						<div class="col-md-2">
							<a href="/wiki/member/loginout" id="logioutbtn">로그아웃</a> 　
						</div>
						<% } %>
						<div class="col-md-2">
							<a href=""><img alt="Singup" src="/wiki/img/signup.png" class="headerImg"></a>
						</div>	
					</div>
				</div>
			</div>
		</div>
	
	
	<!-- 부트스트랩 js cdn -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 사용자정의 js -->
	<script src="/wiki/js/main.js" type="text/javascript"></script>
	<!-- jquery 최신 cdn -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>