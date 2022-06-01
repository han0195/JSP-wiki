let mid;
let mpw;
let mname;
let mphone;
let pass = false;//통과여부
$(function(){ // 문서오픈 함수
	
	//아이디
	$("#inputName1").keyup( function(){
		mid = $("#inputName1").val();
		$("#spanmid").text(mid);
	});
	//비밀번호
	$("#inputName2").keyup( function(){
		mpw = $("#inputName2").val();
		$("#spanmpw").text(mpw);
	});
	
	//이름
	$("#inputName3").keyup( function(){
		mname = $("#inputName3").val();
		$("#spanname").text(mname);
	});
	
	//전화번호
	$("#inputName4").keyup( function(){
		mphone = $("#inputName4").val();
		$("#spanphone").text(mphone);
	});
	
	$("#singbtn").click(function(){// 클릭이벤트

		if(pass == false){ // 테스트를 위해 false;
			$.ajax({
				url: "/wiki/member/singup",
				type : "post",
				data: {
					mid : mid,
					mpw : mpw,
					mname : mname,
					mphone : mphone
				},
				success: function(re){
					if(re == 1){// 가입성공시
						location.href = "../member/login.jsp";
					}else {// 가입 실패시
						alert(re);
					}			
				}
			});
		};
	});
		
});




