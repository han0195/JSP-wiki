let ip;
$(document).ready(function(){
	 $.ajax({ // ip 획득 api
        url: "https://api.ip.pe.kr/json"
    }).done(function(api) {
       console.log(api);
       ip = api.ip;
    }).fail(function() {
        alert("로딩하는데 실패하였습니다.")
    });
});
function revert(cid) {
 	
	$.ajax({
		url: "/wiki/function/historyview",
		data: {"cid" : cid, "ip" : ip},
		success: function(re){
			if(re == -1 || re == -2){// 문서내용가져오기 에러
				alert("서블릿쪽에러" + re);
			}else{
				location.href='../history/history.jsp?dno='+re;
			}
		}
	});
}