//textarea 커서 옮기기
$("#dcontent").focus();

//문서 대기
$(function(){
	let Deno=$("#Deno").val();
	$.ajax({

		url:"../debate/DebateChatList",
		type:"get",
		data:{"Deno":Deno},
		success:function(data){
			
			if(data){
				console.log(data);
				console.log(data[0]["date"]);
			}else{
				console.log(2);
			}
		}
		
		
		
	});
});//문서 대기 끝


//토론 등록버튼 이벤트
function sendbtn(Deno){
	
	let dtcontent=$("#dtcontent").val();
	$.ajax({
		url:"../debate/DebateChatting",
		data:{"Deno":Deno ,"dtcontent":dtcontent},
		type:"get",
		success:function(data){
				console.log(data);
			if(data==1){
				alert("토론이 등록되었습니다.");
			}else{
				alert("토론등록이 실패되었습니다.")
			}
		}
	});

	
}

