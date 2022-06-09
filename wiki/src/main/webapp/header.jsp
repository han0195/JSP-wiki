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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
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
						<div class="col-md-9 py-1 row">
							<!-- 로고 링크 -->
							<div class="col-md-4">
								<a href="/wiki/main.jsp"><img alt="Logo" src="/wiki/img/mainlogo.png" id="mainlogo" style="height: 100%"></a>　　
							</div>
							<!-- 문서 링크 -->
							<div class="col-md-3 py-2">
								<a href="/wiki/document/documentview.jsp" style="font-size: 20px;">문서</a>
							</div>
							<!-- 토론 링크 -->
							<div class="col-md-3 py-2">
								<a href="/wiki/debate/debatemain.jsp" style="font-size: 20px;">토론하기 </a>
							</div>
						</div>
						
						<!-- 특수기능 드랍다운 링크-->
						<div class="col-md-3 py-1">
							<div class="dropdown">
								<!-- 특수기능 드랍다운 버튼 -->
								<button class="btn dropdown-toggle" type="button"id="specialFunction" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 20px;">
									특수기능
								</button>
								<!-- 특수기능 리스트 -->
								<ul class="dropdown-menu" aria-labelledby="specialFunction">
								    <li><a class="dropdown-item" href="/wiki/document/documentview.jsp">문서게시판</a></li>
								    <li><a class="dropdown-item" href="/wiki/document/misspage.jsp">작성이 필요한 문서</a></li>
								    <li><a class="dropdown-item" href="#">고립된 문서</a></li>   
								    <li><a class="dropdown-item" href="/wiki/document/docupdate.jsp">편집된 지 오래된 문서</a></li>
								    <li><a class="dropdown-item" href="/wiki/document/docshort.jsp">내용이 짧은 문서</a></li>
								    <li><a class="dropdown-item" href="/wiki/document/doclong.jsp">내용이 긴 문서</a></li>
                    				<li><a class="dropdown-item" href="/wiki/document/randompage.jsp">RandomPage</a></li>
								    <li><a class="dropdown-item" href="/wiki/document/uploadfile.jsp">파일 올리기</a></li>					    
							  </ul>
							</div>　
						</div>
					</div>
				</div>
				<!--헤더링크 (검색/로그인/회원가입)-->
				<div class="col-md-6">
					<div class="col-md-12 row">
						
						<div class="offset-4 col-md-4 py-2">
							<input type="text" class="form-control" id="searchinput"> <!-- 검색 -->			
						</div>
						<div class="col-md-1 py-2">
							<a onclick="sach()"><img alt="Search" src="/wiki/img/search.png" class="headerImg"></a> <!-- 서치버튼 -->
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
								    <%
								    String mid = (String) session.getAttribute("login");
								    if(mid == null) {%>
								    	<li><a class="dropdown-item" href="/wiki/member/login.jsp">로그인</a></li>
								    <%}else{%>
								    	<li><a class="dropdown-item" href="/wiki/member/loginout">로그아웃</a></li>
								    <%}%>
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
