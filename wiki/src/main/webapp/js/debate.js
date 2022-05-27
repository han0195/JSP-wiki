$("#dcontent").focus();
$(function(){
	

	let dcontent = $("#decontent").val();
	let did=$("#did").val();
	let today=$("#today").val();

	
	$.ajax({
		
		url:"../debate",
		datatype:"get",
		data:{"dcontent":dcontent , "did":did , "today":today},
		success:function(data){
				
			if(data){
				
			}else{
				
			}
		
		}
	
	
	
	});	
});

function enterkey(){
	if(window.event.keyCode==13){
		
	}
}

function sendbtn(){
	
}