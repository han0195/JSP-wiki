let mid;
let mpw;
let mname;
let mphone;
let pass = [false,false,false,false];//통과여부
$(function(){ // 문서오픈 함수
	
	//아이디
	$("#inputName1").keyup( function(){
		mid = $("#inputName1").val();
		let idj = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/; // 유효성
		if(idj.test(mid)){ // 일치하면
			//중복검사
			$.ajax({
				url: "/wiki/member/singup",
				type: "POST",
				data: {mid : mid , ch : "1"},
				success: function(re) {				
					if(re == 1){ // 중복검사성공시
						$("#spanmid").html("사용가능한 아이디 입니다.");
						pass[0] = true;
					}else{	// 중복검사실패시
						// 상태창
						$("#spanmid").html("사용중인아이디입니다."); pass[0] = false;
					}
				}
			});
		}else{ // 일치하지않으면
			// 상태창
			$("#spanmid").html("이메일 형식이 아닙니다."); pass[0] = false;
		};
		
	});
	//비밀번호
	$("#inputName2").keyup( function(){
		mpw = $("#inputName2").val();
		let pwj = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d~!@#$%^&*()+|=]{8,20}$/
		if(pwj.test(mpw)){// 일치하면
			$("#spanmpw").html("사용가능한 비밀번호입니다.");
			pass[1] = true;
		}else{// 일치하지 않으면
			$("#spanmpw").html("특수문자 or 문자 + 숫자를 포함시켜 8~20글자를 입력해주세요."); pass[1] = false;
		}	
	});
	
	//이름
	$("#inputName3").keyup( function(){
		mname = $("#inputName3").val();
		if(mname.length > 2 && mname.length < 10){
			$("#spanname").html( "사용가능한 이름입니다." );		pass[2] = true;
		}else{
			$("#spanname").html( "2~10 사이만 가능합니다." );		pass[2] = false;
		}
	});
	
	//전화번호
	$("#inputName4").keyup( function(){
		mphone = $("#inputName4").val();
		let phonej = /^([0-9]{2,3})-([0-9]{3,4})-([0-9]{3,4})$/;
		if( phonej.test(mphone) ){
			$("#spanphone").html( "사용가능한 번호 입니다." );		pass[3] = true;
		}else{
			$("#spanphone").html( "지역번호-0000-0000 형식으로 입력해주세요." ); pass[3] = false;
		}
	});
	
	$("#singbtn").click(function(){// 클릭이벤트
		if(pass[0] == true && pass[1] == true && pass[2] == true && pass[3] == true){ // 테스트를 위해 false;
			$.ajax({
				url: "/wiki/member/singup",
				type : "POST",
				data: {
					mid : mid,
					mpw : mpw,
					mname : mname,
					mphone : mphone,
					ch : 2
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




