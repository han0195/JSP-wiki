	let documentlist;
$(function() {/*페이지 실행 함수*/
	$.ajax({ /*DB에서 역사 가져오기*/
		url: "/wiki/function/getdocument_history",
		success: function(re) {
			if (re == -1) { // 만약 역사가없다면
				/*에러페이지 전환*/
				alert("history list load err");
			} else { // 만약 역사가 있다면
				let html = "";
				for (let i = 0; i < re.length; i++) {// 해당 역사 만큼 반복 하여 html 변수 저장

					html =
						'<li>' + re[i]["updatetime"] + ' [ <a href="#"> 보기</a> | <a href="#">' +
						'비교</a> | <a href="#"> 추천 </a> | <a href="#"> 비추천 </a> | <a href="historyview.jsp?cid='+re[i]["cid"]+'">되돌리기 </a> ] ';
					if (re[i]["dgood"] == 0) { // 만약 추천수가 0라면 추천수 검점
						html += ' r' + (i + 1) + '(<span>' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					} else if (re[i]["dgood"] > 0) {// 만약 추천수가 0보다 크다면 추천수 초록
						html += ' r' + (i + 1) + '(<span style="color: green;">' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					} else {// 만약 추천수가 0보다 작다면	 추천수 빨강
						html += ' r' + (i + 1) + '(<span style="color: red;">' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
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
function good(){
	
}
// 비추천
function bad() {
	
}





