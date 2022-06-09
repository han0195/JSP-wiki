//textarea 커서 옮기기
$("#dcontent").focus();
// ip 획득 api

	$.ajax({ 
	       url:"https://api.ip.pe.kr/json"
	   }).done(function(api) {
	      console.log(api);
	      ip = api.ip;
	   }).fail(function() {
	       alert("로딩하는데 실패하였습니다.")
	});

//ip 저장변수
let ip;

//문서 대기
$(function(){

	$("#debatezone").html(function(){
		let Deno=$("#Deno").val();
		let html = "";
		
		$.ajax({
	
			url:"../debate/DebateChatList",
			type:"get",
			data:{"Deno":Deno},
			success:function(data){
				console.log(data);
				
				if(data){
					for(let i=0; i<data.length; i++){
					
					let date=data[i]["date"];
					let content=data[i]["content"];
					let id=data[i]["name"];
					
					//만약 아이디 값이 없다면 ip 주소
					if(id == undefined){
						 id = ip;
					}
					//html 에 뿌려주기
					html +='<div id="debatecontent" class="col-md-9 my-3">'		+
								'<div class="row">'								+
									'<div id="did" class="col-md-5">'			
										+id+
									'</div>'									+
									'<div id="ddate" class="offset-4 col-md-3">'
										+date+
									'</div>'									+
								'</div>'										+
								'<div id="content" class="col-md-12">'			
									+content+
								'</div>'										+	
							'</div>';
					}
					$("#debatezone").html(html);
					
				}else{
					console.log("error");
				}
			}	
		});
	});
	
});//문서 대기 끝


//토론 등록버튼 이벤트
function sendbtn(Deno,login){
	console.log(login);
	let dtcontent=$("#dtcontent").val();
	$.ajax({
		url:"../debate/DebateChatting",
		data:{"Deno":Deno ,"dtcontent":dtcontent,"id":login},
		type:"get",
		success:function(data){
				
			if(data==1){
				alert("토론이 등록되었습니다.");
				$("#dtcontent").val("");
			}else{
				alert("토론등록이 실패되었습니다.")
			}
		}
	});
	location.reload();
	
}

function closeDebate(Deno){
	
	$.ajax({
		
		url:"../debate/CloseDebate",
		data:{"Deno":Deno},
		success:function(data){
			if(data==1){
				alert("해당 토론이 닫아졌습니다.");
			}else{
				alert("오류! 서비스관리자에게 문의해 주십시오.");
			}
		}
		
	});
	location.reload();
}



