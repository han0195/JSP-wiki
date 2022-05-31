<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>
<body>
	<%@ include file="../header.jsp"%>
	<br><br><br><br><br><br>
	<div class="container">
		<div class="form-row col-md-6"
			style="padding: 20px; margin-top: 2%; margin-left: 26%; margin-right: 26%; margin-bottom: 10%; background-color: hsla(240, 20%, 95%, 0.5)">
				<div class="form-row ">
					
							<!-- 입력창 -->
							<div class="form-row">
								<div class="form-group col-md-12">
									아이디 <input type="text" class="form-control" id="inputName1"
										name="mid" placeholder="아이디를 입력해주세요">
								</div>
								<span id="spanmid"></span><!-- 상태 메세지 -->
								
								<div class="form-group col-md-12">
									비밀번호 <input type="text" class="form-control" id="inputName2"
										name="mpw" placeholder="비밀번호를 입력해주세요">
								</div>
								<span id="spanmpw"></span><!-- 상태 메세지 -->
								
								<div class="form-group col-md-12">
									이름 <input type="text" class="form-control" id="inputName3"
										name="mname" placeholder="이름을 입력해주세요">
								</div>
								<span id="spanname"></span><!-- 상태 메세지 -->
								
								<div class="form-group col-md-12">
									전화번호 <input type="text" class="form-control" id="inputName4"
										name="mphone" placeholder="전화번호를 입력해주세요">
								</div>
								<span id="spanphone"></span><!-- 상태 메세지 -->
								
							</div>
				</div>		
				<div class="form-">
					<button id="singbtn" style="margin-top: 20px; background-color: green;" type="submit" class="btn btn-primary form-control"
					>Sign in</button>			
				</div>
		</div>
	</div>

	<script type="text/javascript" src="../js/singup.js"></script>
	<%@ include file="../footer.jsp"%>
</body>
</html>