function idfind(){
	let mname = $("#mname").val();
	let mphone = $("#mphone").val();
	let ch = true;
	$.ajax({
		url: "/wiki/membar/find",
		type : "POST",
		data:{"mname" : mname, "mphone" : mphone, "ch": ch},
		success :function(re){
			if(re != -1){
				alert("회원님의 아이디: " + re);
			}else{
				alert("일치하는 회원정보가 없습니다.");
			}
		}
	});
	
}

function pwfind(){
	let mid = $("#mid").val();
	let mphone = $("#mphone").val();
	let ch = false;
	$.ajax({
		url: "/wiki/membar/find",
		type : "POST",
		data:{"mid" : mid, "mphone" : mphone, "ch" : ch},
		success :function(re){
			if(re != -1){
				alert("회원님의 비밀번호: " + re);
			}else{
				alert("일치하는 회원정보가 없습니다.");
			}
		}
	});
	
}