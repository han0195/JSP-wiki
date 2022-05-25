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
	<%-- <%@ include file="hearder.jsp" %> --%>
	<!-- 헤더 -->

	<div class="container history_wr"><!-- 본문 -->
		
		<h2 class="history_title"><!-- 제목 -->
			나무위키 : 대문 <span class="history_sub_title">(문서역사)</span>
		</h2>
		
		<a><button class="btn btn-outline-dark">편집</button></a>
		<a><button class="btn btn-outline-dark">역링크</button></a>
		
		
		<div class="historylistdiv"><!-- 역사 리스트-->
			<ul>
				<li>2022-05-23 16:29:47 [ <a href="#"> 보기</a> | <a href="#">
						비교</a> | <a href="#"> 추천 </a> | <a href="#"> 비추천 </a> | <a href="#">
						되돌리기 </a> ] 수정순서 ( ) 닉네임()
				</li>
				<li>2022-05-23 16:29:47 [ <a href="#"> 보기</a> | <a href="#">
						비교</a> | <a href="#"> 추천 </a> | <a href="#"> 비추천 </a> | <a href="#">
						되돌리기 </a> ] 수정순서 ( ) 닉네임()
				</li>
				<li>2022-05-23 16:29:47 [ <a href="#"> 보기</a> | <a href="#">
						비교</a> | <a href="#"> 추천 </a> | <a href="#"> 비추천 </a> | <a href="#">
						되돌리기 </a> ] 수정순서 ( ) 닉네임()
				</li>
				<li>2022-05-23 16:29:47 [ <a href="#"> 보기</a> | <a href="#">
						비교</a> | <a href="#"> 추천 </a> | <a href="#"> 비추천 </a> | <a href="#">
						되돌리기 </a> ] 수정순서 ( ) 닉네임()
				</li>
			</ul>
		</div><!-- 역사리스트 end -->

		<button type="button" class="btn btn-success hisbtn">이전</button>
		<button type="button" class="btn btn-success hisbtn">다음</button>

	</div><!-- 본문 div end -->

	<%-- <%@ include file="footer.jsp" %> --%>
	<!-- 푸터 -->
	<!-- 부트스트랩js [헤더 가져오면 삭제예정] -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>
</html>