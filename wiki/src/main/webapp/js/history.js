var documentlist;

let totalData; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 20; //페이징에 나타낼 페이지 수
let globalCurrentPage = 1; //현재 페이지

$(document).ready(function() {
	//dataPerPage 선택값 가져오기
	dataPerPage = $("#dataPerPage").val();
	let dno = $("#dnohid").val();
	$.ajax({ // ajax로 데이터 가져오기
		url: "/wiki/function/getdocument_history",
		data: { "dno": dno },
		success: function(d) {
			//totalData 구하기
			totalData = d.length;
			documentlist = d;
			//글 목록 표시 호출 (테이블 생성)
			displayData(1, dataPerPage);
			//페이징 표시 호출
			paging(totalData, dataPerPage, pageCount, 1);
		}
	});
	
	if(dataPerPage == 10){
		$("#historylistdiv").css
	}else if(dataPerPage == 15){
		
	}else{
		
	}
});
// 페이징 함수
function paging(totalData, dataPerPage, pageCount, currentPage) {
	console.log("currentPage : " + currentPage);

	totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수

	if (totalPage < pageCount) {
		pageCount = totalPage;
	}

	let pageGroup = Math.ceil(currentPage / pageCount); // 페이지 그룹
	let last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호

	if (last > totalPage) {
		last = totalPage;
	}

	let first = last - (pageCount - 1); //화면에 보여질 첫번째 페이지 번호
	let next = last + 1;
	let prev = first - 1;

	let pageHtml = "";

	if (prev > 0) {
		pageHtml += "<li><a href='#' id='prev'> 이전 </a></li>";
	}

	//페이징 번호 표시 
	for (var i = first; i <= last; i++) {
		if (currentPage == i) {
			pageHtml +=
				"<li class='on'><a href='#' id='" + i + "'>" + i + "</a></li>";
		} else {
			pageHtml += "<li><a href='#' id='" + i + "'>" + i + "</a></li>";
		}
	}

	if (last < totalPage) {
		pageHtml += "<li><a href='#' id='next'> 다음 </a></li>";
	}

	$("#pagingul").html(pageHtml);
	let displayCount = "";
	displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
	$("#displayCount").text(displayCount);


	//페이징 번호 클릭 이벤트 
	$("#pagingul li a").click(function() {
		let $id = $(this).attr("id");
		selectedPage = $(this).text();

		if ($id == "next") selectedPage = next;
		if ($id == "prev") selectedPage = prev;

		//전역변수에 선택한 페이지 번호를 담는다...
		globalCurrentPage = selectedPage;
		//페이징 표시 재호출
		paging(totalData, dataPerPage, pageCount, selectedPage);
		//글 목록 표시 재호출
		displayData(selectedPage, dataPerPage);
	});
}

//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
function displayData(currentPage, dataPerPage) {
  let chartHtml = "";

//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
  currentPage = Number(currentPage);
  dataPerPage = Number(dataPerPage);
  console.log(documentlist);

  for (
    var i = (currentPage - 1) * dataPerPage;
    i < (currentPage - 1) * dataPerPage + dataPerPage;
    i++) {
	
	if(i > totalData-1){ // 총 데이터 개수 넘으면 반복문 멈추기
		break;
	}
	
    chartHtml +=
    '<li>' + documentlist[i]["updatetime"] + ' [ <a href="#"> 보기</a> | <a href="historcomparison.jsp?dno='+documentlist[i]["dno"]+'&cid='+documentlist[i]["cid"]+'">' +
	'비교</a> | <a href="#" onclick="good('+documentlist[i]["cid"]+','+documentlist[i]["dno"]+')"> 추천 </a> | <a href="#" onclick="bad('+documentlist[i]["cid"]+','+documentlist[i]["dno"]+')"> 비추천 </a> | <a href="historyview.jsp?cid='+documentlist[i]["cid"]+'">되돌리기 </a> ] ';
	if (documentlist[i]["dgood"] == 0) { // 만약 추천수가 0라면 추천수 검점
	chartHtml += ' r' + (i - documentlist.length) + ' 추천수(<span>' + documentlist[i]["dgood"] + '</span>) ' + documentlist[i]["mid"] + '()</li>';
	} else if (re[i]["dgood"] > 0) {// 만약 추천수가 0보다 크다면 추천수 초록
	chartHtml += ' r' + (i - documentlist.length) + ' 추천수(<span style="color: green;">' + documentlist[i]["dgood"] + '</span>) ' + documentlist[i]["mid"] + '()</li>';
	} else {// 만약 추천수가 0보다 작다면	 추천수 빨강
	chartHtml += ' r' + (i - documentlist.length) + ' 추천수(<span style="color: red;">' + documentlist[i]["dgood"] + '</span>) ' + documentlist[i]["mid"] + '()</li>';
	};

  }
  $("#history_list_ul").html(chartHtml);
  
}

$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });

// 추천
function good(cid, dno) {
	let mid = $("#mid").val();
	let ch = true; // 추천 / 비추천 구분
	let sess = session.getAttribute(mid + cid);
	if(mid == ""+null){// 만약 로그인되어있지않다면
		alert("추천/비추천은 로그인후 가능합니다.");
	}else if(mid != null){
		if(sess == null) {
			alert(sess);
		}else {
			//조회수 증가
			$.ajax({
				url: "/wiki/function/goodorbad",
				data: { cid: cid, ch: ch },
				success: function(re) {
					if (re == 1) {
						sessionStorage.setItem(mid + cid, 1); // 세션추가
						location.href = '../history/history.jsp?dno=' + dno; // 페이지로드
					} else {
						alert("조회수 에러");
					}
				}
			});
		}
	}
}
// 비추천
function bad(cid) {
	let mid = $("#mid").val();
	let ch = true; // 추천 / 비추천 구분
	if(mid == ""+null) {// 만약 로그인되어있지않다면
		alert("추천/비추천은 로그인후 가능합니다.");
	} else {// 로그인 되어있다면
		if(session.getAttribute(mid + cid) == null) { // 존재하지않으면
			//조회수 증가
			$.ajax({
				url: "/wiki/function/goodorbad",
				data: { cid: cid, ch: ch },
				success: function(re) {
					if (re == 1) {
						sessionStorage.setItem(mid + cid, 1); // 세션추가
						location.href = '../history/history.jsp?dno=' + dno; // 페이지로드
					} else {
						alert("조회수 에러");
					}
				}
			});
		}
	}
}

/*html =
						'<li>' + re[i]["updatetime"] + ' [ <a href="#"> 소스보기</a> | <a href="#">' +
						'비교</a> | <a href="#" onclick="good('+re[i]["cid"]+','+re[i][dno]+')"> 추천 </a> | <a href="#" onclick="bad('+re[i]["cid"]+','+re[i][dno]+')"> 비추천 </a> | <a href="historyview.jsp?cid='+re[i]["cid"]+'">되돌리기 </a> ] ';
					if (re[i]["dgood"] == 0) { // 만약 추천수가 0라면 추천수 검점
						html += ' r' + (i - re.length) + ' 추천수(<span>' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					} else if (re[i]["dgood"] > 0) {// 만약 추천수가 0보다 크다면 추천수 초록
						html += ' r' + (i - re.length) + ' 추천수(<span style="color: green;">' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					} else {// 만약 추천수가 0보다 작다면	 추천수 빨강
						html += ' r' + (i - re.length) + ' 추천수(<span style="color: red;">' + re[i]["dgood"] + '</span>) ' + re[i]["mid"] + '()</li>';
					};*/



