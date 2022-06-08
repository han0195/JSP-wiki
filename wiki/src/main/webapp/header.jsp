<%@page import="java.net.InetAddress"%>
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
	<%
	InetAddress ip = InetAddress.getLocalHost();  
	String ipAddress=ip.getHostAddress();
	%>
	
</head>
<body>

<div class="text-center py-3">
			<div class="col-md-12 row text-dark">
				<!--헤더링크 (문서/토론/특수기능)-->
				<div class="col-md-6">
					<div class="col-md-12 row">
						<!-- 로고/문서/토론 링크 -->
						<div class="col-md-5 py-1 row">
							<!-- 로고 링크 -->
							<div class="col-md-7">
								<a href="/wiki/main.jsp"><img alt="Logo" src="/wiki/img/mainlogo.png" id="mainlogo"></a>　　
							</div>
							<!-- 문서 링크 -->
							<div class="col-md-2 py-2">
								<a href="/wiki/document/documentmain.jsp">문서</a>
							</div>
							<!-- 토론 링크 -->
							<div class="col-md-3 py-2">
								<a href="/wiki/debate/debatemain.jsp">토론하기 </a>
							</div>
						</div>
						
						<!-- 특수기능 드랍다운 링크-->
						<div class="col-md-3 py-1">
							<div class="dropdown">
								<!-- 특수기능 드랍다운 버튼 -->
								<button class="btn dropdown-toggle" type="button"id="specialFunction" data-bs-toggle="dropdown" aria-expanded="false">
									특수기능
								</button>
								<!-- 특수기능 리스트 -->
								<ul class="dropdown-menu" aria-labelledby="specialFunction">
								    <li><a class="dropdown-item" href="#">게시판</a></li>
								    <li><a class="dropdown-item" href="#">작성이 필요한 문서</a></li>
								    <li><a class="dropdown-item" href="#">고립된 문서</a></li>
								    <li><a class="dropdown-item" href="#">분류가 되지 않은 문서</a></li>
								    <li><a class="dropdown-item" href="#">편된 지 오래된 문서</a></li>
								    <li><a class="dropdown-item" href="#">내용이 짧은 문서</a></li>
								    <li><a class="dropdown-item" href="#">내용이 긴 문서</a></li>
								    <li><a class="dropdown-item" href="#">차단 내역</a></li>
								    <li><a class="dropdown-item" href="#">RandomPage</a></li>
								    <li><a class="dropdown-item" href="#">파일 올리기</a></li>
								    <li><a class="dropdown-item" href="#">라이선스</a></li>
							  </ul>
							</div>　
						</div>
					</div>
				</div>
				<!--헤더링크 (검색/로그인/회원가입)-->
				<div class="col-md-6">
					<div class="col-md-12 row">
						
						<div class="offset-4 col-md-4 py-2">
							<input type="text" class="form-control">				
						</div>
						<div class="col-md-1 py-2">
							<a href="#"><img alt="Search" src="/wiki/img/search.png" class="headerImg"></a>
						</div>
						<div class="col-md-2">
						
							<div class="dropdown">
								<!-- 특수기능 드랍다운 버튼 -->
								<button class="btn dropdown-toggle" type="button"id="specialFunction" data-bs-toggle="dropdown" aria-expanded="false">
									<img src="/wiki/img/signup.png" class="headerImg">
								</button>
								<!-- 특수기능 리스트 -->
								<ul class="dropdown-menu" aria-labelledby="specialFunction">
								    <li class="mx-auto">please login!</li>
								    <!-- IF 로그인 시 아이디 출력 -->
								    <li class="mx-auto"><%=ipAddress%></li>
								    <li><hr></li>
								    <li><a class="dropdown-item" href="#">설정</a></li>
								    <li><hr></li>
								     <!-- IF 회원이 로그인 했을  시  -->
								    <li><a class="dropdown-item" href="/wiki/member/login.jsp">로그인</a></li>
								    <!-- IF 관리자 로그인 했을  시  -->
								    <li><a class="dropdown-item" href="/wiki/admin/adminmain.jsp">adminpage</a></li>
							  </ul>
							</div>
							　
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