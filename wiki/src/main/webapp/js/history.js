$(function(){/*페이지 실행 함수*/

	$.ajax({ /*DB에서 역사 가져오기*/ 
		url:"/wiki/function/getdocument_history",
		success : function(re){
			if(re == -1){ // 만약 역사가없다면
				alert(re);
			}else { // 만약 역사가 있다면
				
			}
		}
	});// ajax end
	
});// 페이지 실행함수 end
	
