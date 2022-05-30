let documentlist;
let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 10; //페이징에 나타낼 페이지 수
let globalCurrentPage=1; //현재 페이지

$(function() {/*페이지 실행 함수*/



	let dno = $("#dnohid").val(); // 문서제목번호
	$.ajax({ /*DB에서 역사 가져오기*/
		url: "/wiki/function/getdocument_history",
		data: {"dno": dno},
		success: function(re) {
			if (re == -1) { // 만약 역사가없다면
				/*에러페이지 전환*/
				alert("history list load err");
			} else { // 만약 역사가 있다면
				let html = "";
				for (let i = 0; i < re.length; i++) {// 해당 역사 만큼 반복 하여 html 변수 저장
					html =
						'<li>' + re[i]["updatetime"] + ' [ <a href="#"> 소스보기</a> | <a href="#">' +
						'비교</a> | <a href="#" onclick="good('+re[i]["cid"]+','+re[i][dno]+')"> 추천 </a> | <a href="#" onclick="bad('+re[i]["cid"]+','+re[i][dno]+')"> 비추천 </a> | <a href="historyview.jsp?cid='+re[i]["cid"]+'">되돌리기 </a> ] ';
					if (re[i]["dgood"] == 0) { // 만약 추천수가 0라면 추천수 검점
						html += ' r' + (i - re.length) + ' 추천수(<span>' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					} else if (re[i]["dgood"] > 0) {// 만약 추천수가 0보다 크다면 추천수 초록
						html += ' r' + (i - re.length) + ' 추천수(<span style="color: green;">' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					} else {// 만약 추천수가 0보다 작다면	 추천수 빨강
						html += ' r' + (i - re.length) + ' 추천수(<span style="color: red;">' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					};
					
					$("#history_list_ul").append(html); // <li> 추가
				}
			}// 조건 식 end
		}
	});// ajax end

});// 페이지 실행함수 end

//보기

//비교

// 추천
function good(cid, dno){
	let mid = sessionStorage.getItem("login"); 
	let ch = true; // 추천 / 비추천 구분
	if(mid == null){// 만약 로그인되어있지않다면
		alert("추천/비추천은 로그인후 가능합니다.");
	}else{// 로그인 되어있다면
		if( session.getAttribute( mid+cid ) == null  ){ // 존재하지않으면
			//조회수 증가
			$.ajax({
				url: "/wiki/function/goodorbad",
				data: {cid : cid , ch : ch},
				success: function(re) {
					if(re == 1){
						sessionStorage.setItem(mid+cid, 1); // 세션추가
						location.href='../history/history.jsp?dno='+dno; // 페이지로드
					}else {
						alert("조회수 에러");
					}
				}
			});
		}
	}
}
// 비추천
function bad(cid) {
let mid = sessionStorage.getItem("login"); 
	let ch = true; // 추천 / 비추천 구분
	if(mid == null){// 만약 로그인되어있지않다면
		alert("추천/비추천은 로그인후 가능합니다.");
	}else{// 로그인 되어있다면
		if( session.getAttribute( mid+cid ) == null  ){ // 존재하지않으면
			//조회수 증가
			$.ajax({
				url: "/wiki/function/goodorbad",
				data: {cid : cid , ch : ch},
				success: function(re) {
					if(re == 1){
						sessionStorage.setItem(mid+cid, 1); // 세션추가
						location.href='../history/history.jsp?dno='+dno; // 페이지로드
					}else {
						alert("조회수 에러");
					}
				}
			});
		}
	}
}





