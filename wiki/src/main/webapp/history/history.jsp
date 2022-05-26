<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>history</title>
<!-- 사용자지정 css -->
<link href="/wiki/css/history.css" rel="stylesheet">
<!-- 부트스트랩 [헤더 가져오면 삭제예정] -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
</head>
<body>
	<!-- 헤더 -->
	<%-- <%@ include file="hearder.jsp" %> --%>
	<div class="container history_wr"><!-- 본문 -->
		
		<h2 class="history_title"><!-- 제목 -->
			나무위키 : 대문 <span class="history_sub_title">(문서역사)</span>
		</h2>
		
		<a><button class="btn btn-outline-dark">편집</button></a>
		<a><button class="btn btn-outline-dark">역링크</button></a>
		
		
		<div class="historylistdiv"><!-- 역사 리스트-->
			<ul id="history_list_ul">
				<li>0000-00-00 00:00:00 [ <a onclick="paging(dcoumentcodeview.jsp)"> 보기</a> | <a href="#">
						비교</a> | <a href="#"> 추천 </a> | <a href="#"> 비추천 </a> | <a href="#">
						되돌리기 </a> ] 수정순서 ( ) 테스트글()
				</li>
			</ul>
		</div><!-- 역사리스트 end -->
		
		<!-- 페이징 -->
		
		<!-- 페이징 -->
		
		<button type="button" class="btn btn-success hisbtn">이전</button>
		<button type="button" class="btn btn-success hisbtn">다음</button>

	</div><!-- 본문 div end -->
	
	<!-- 푸터 -->
	<%-- <%@ include file="footer.jsp" %> --%>
	
	<!-- 부트스트랩js [헤더 가져오면 삭제예정] -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
		
	<!-- 제이쿼리js [헤더 가져오면 삭제예정] -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- 사용자 지정 js -->
	<script src="../js/history.js" type="text/javascript"></script>
</body>
</html>