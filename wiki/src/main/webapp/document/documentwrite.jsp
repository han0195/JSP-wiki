<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 게시판api( 썸머노트) css cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<!-- 썸머노트 기본 부트스트랩버전 3버전 css cdn -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 썸머노트 css cdn -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link href="/wiki/css/documentadd.css" rel="stylesheet">
</head>
<body>
	<%@include file="../header.jsp"%>

	<br>
	<br>
	<div class="container" style="height: ">
		<a href="/wiki/document/documentview.jsp"><button>글목록</button></a>
		<h3>문서</h3>
		
		
			<!-- form 전송 인코딩 타입 : 기본타입은 첨부파일 불가능  -->
			<!-- form 첨부파일 전송 인코딩 타입 : enctype="multipart/form-data" -->

			제목 : <input type="text" name="dtitle" id="dtitle"> <br>
			<input class="btn_primary" type="button" onclick="titlecheck()"
				value="제목 중복 체크">
				<h5>', ==, ++, [[]], {{}} 는 함부로 사용하지 말아주세요.</h5> <a href="http://localhost:8484/wiki/document/pageview.jsp?dno=145">이유 알아보기(문법 안내)</a>
			<textarea name="dcontent" id="summernote"></textarea>
			

			<div class="insert">
			<form id="upload" method="post" enctype="multipart/form-data">
				<input type="file" onchange="javascript: addFile(this); readURL(this);" multiple  id="uploadfile" name="uploadfile"/>
				<div class="file-list"></div>
			</form>	
			</div>
			<div>
			<img id="preview" />
			</div>	
		<input type="button" class="btn bg_01 btn-success" value="문서 업로드" onclick="dwrite()"> <input
				type="reset" value="취소">
	</div>
			<br><br><br><br><br><br><br>
			


	<!-- 썸머노트 기본 부트스트랩버전 3버전 js cdn -->

	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<!-- 썸머노트 js cdn  -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script
		src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<!-- ip 가져오기  -->
	<script src="/wiki/js/documentwrite.js" type="text/javascript"></script>
</html>