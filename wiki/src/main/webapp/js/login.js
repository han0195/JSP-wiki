function login(){
	let mid = $("#mid").val();
	let mpw = $("#mpw").val();
	
	$.ajax({ // 서블릿
		url : "/wiki/member/login",
		type: "POST",
		data: {mid : mid, mpw : mpw},
		success:function(re){
			if(re == 1){ //로그인성공
				location.href = "../main.jsp";
			}else{	// 로그인 실패
				$("#status").html("아이디 또는 비밀번호가 일치하지않습니다.");
			}
		}
	});
}