<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%@include file="header.jsp" %>

 <div class="svg-container">
 <div class="row">
   		
    <svg viewbox="0 0 800 400" class="svg col-md-10">
      <path id="curve" fill="#434234" d="M 800 300 Q 400 350 0 300 L 0 0 L 800 0 L 800 300 Z">
      </path>
    </svg>
    
   
   <table id="newdocu" class="col-md-2"></table>
  
  </div>
 </div>

  	<div class="container">
  		<div class="col-md-12 text-center py-5">
  			<h3>당신의 지식이 누군가의 열매가 될 수 있습니다.</h3>
  			<h5>위키에 오신걸 환영합니다!</h5>
  			<br>
  			<h5>
  				나무위키는 누구나 기여할 수 있는 위키입니다.<br>
				검증되지 않았거나 편향된 내용이 있을 수 있습니다.
			</h5>
  		</div>
  		
  		
  	</div>

  

 
	

<script src="/wiki/js/main.js" type="text/javascript"></script>			
<%@include file="footer.jsp" %>
</body>
</html>