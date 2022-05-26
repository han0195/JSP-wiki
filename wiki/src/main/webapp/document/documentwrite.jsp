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
</head>
<body>
	<%@include file="../header.jsp"%>
	<br>
	<br>
	<br>
	<div class="conatiner">
		<div class="col-md-8 offset-2">
			<div>
				<input type="text" id="title" placeholder="제목">
				<input class="btn_primary" type="button" onclick="titlecheck()" value="제목 중복 체크">
			</div>
			<div class="py-3">
				<textarea id="summernote" name="editordata"></textarea>
			</div>
			<div>
			<input type="button" value="문서 작성 완료" onclick="documentadd()">
			<input type="reset" value="문서 작성 취소">
			</div>
		</div>
	</div>


</body>
<!-- 썸머노트 기본 부트스트랩버전 3버전 js cdn -->

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 썸머노트 js cdn  -->
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>  <!-- ip 가져오기  -->
<script src="/wiki/js/documentwrite.js" type="text/javascript"></script>
</html>