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
  		<div class="col-md-12 text-center py-5 my-5">
  			<img alt="" src="/wiki/img/mainimg.gif">
  		</div>
  			
  		<div class="col-md-12 text-center">
  			<h3>당신의 지식이 누군가의 열매가 될 수 있습니다.</h3>
	  			<h5>위키에 오신걸 환영합니다!</h5>
	  			<br>
	  			<h5>
	  				트리위키는 누구나 기여할 수 있는 위키입니다.<br>
					검증되지 않았거나 편향된 내용이 있을 수 있습니다.
				</h5>
				<br>
				<hr>
  		</div>
  		
  		<div class="offset-9 col-md-3 py-3">
  			<h6>이 저작물은 CC BY-NC-SA 2.0 KR에 따라 이용할 수 있습니다. 
  			<br>
  			(단, 라이선스가 명시된 일부 문서 및 삽화 제외)
  			<br>
			기여하신 문서의 저작권은 각 기여자에게 있으며,
			
			 각 기여자는 기여하신 부분의 저작권을 갖습니다.
			<br>
			트리위키는 백과사전이 아니며 검증되지 않았거나,
			
			 편향적이거나, 잘못된 서술이 있을 수 있습니다.
			<br>
			트리위키는 위키위키입니다. 여러분이 직접 문서를 고칠 수 있으며, 
			
			다른 사람의 의견을 원할 경우 직접 토론을 발제할 수 있습니다.
			</h6>
  		</div>
  		<div class="offset-11 col-md-1">
  			<img alt="" src="/wiki/img/maininfo.png">
  		</div>
			
  		</div>	
  
	
	
	
<script src="/wiki/js/main.js" type="text/javascript"></script>			
<%@include file="footer.jsp" %>
</body>
</html>