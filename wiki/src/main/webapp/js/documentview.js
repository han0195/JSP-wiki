let totalData = 0; //총 데이터 수
let dataPerPage; //한 페이지에 나타낼 글 수
let pageCount = 20; //페이징에 나타낼 페이지 수
let globalCurrentPage = 1; //현재 페이지
let documentlist = [];
let search = $("#sachinput").val(); // 검색어

$(document).ready(function() {
	//dataPerPage 선택값 가져오기
	dataPerPage = $("#dataPerPage").val();
	
	$.ajax({ // ajax로 데이터 가져오기
		url: "../newdocumentlist",
		async: false,
		success: function(d) {
			// 검색 나누기
			totalData = d.length;
			documentlist = d;
			if(search == ""){ // 검색어가 없으면
				//totalData 구하기
				totalData = d.length;
				documentlist = d;
			}else { // 검색어가 있으면
				let j = 0;
				for(let i = 0; i < d.length; i++){
					let temp = d[i]["dtitle"];				
					if(temp.includes(search)){
						totalData++;
						documentlist[j] = d[i]; j++;
					}
				}
			}
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
  let chartHtml =  '<tr id="titles">' +
			'<th>문서 번호</th>' +
			'<th>문서 제목</th>' +
		'</tr>';

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
    '<tr id="dlists"><th>'+ documentlist[i]["dno"] +' </th>' + 
    '<th> <a href="/wiki/document/pageview.jsp?dno='+documentlist[i]["dno"]+'">' +
	documentlist[i]["dtitle"] +'</a></th></tr>'
  }
  $("#pageview").html(chartHtml);
  
}

$("#dataPerPage").change(function () {
    dataPerPage = $("#dataPerPage").val();
    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
    paging(totalData, dataPerPage, pageCount, globalCurrentPage);
    displayData(globalCurrentPage, dataPerPage);
 });
