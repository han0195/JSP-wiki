let num = [];
let num2 = [];
function check(deno) {

	let check = $('input:checkbox[name="debatecheck' + deno + '"]').is(":checked") == true

	if (check == true) {
		num.push(deno);
	} else {
		for (let i = 0; i < num.length; i++) {
			if (num[i] == deno) {
				num.splice(i, 1);
			}
		}
	}

}
function check2(deno) {
	let check = $('input:checkbox[name="debatecheck2['+ deno + ']"]').is(":checked") == true
	if (check == true) {
		num2.push(deno);
	} else {
		for (let i = 0; i < num.length; i++) {
			if (num2[i] == deno) {
				num2.splice(i, 1);
			}
		}
	}

}

function wordplus() {
	console.log(num);
	
	let word = $("#sameword").val();
	
	if (word == "" || num == "") {
		alert("문서를 선택한 후에 동의어를 입력해주세요");
		return;
	}
	let nums = {
		"num" : num
	}
	$.ajax({
		url: "../admin/samewordcheck",
		data: { "word": word },
		success: function(re) {
			if (re == 'true') {
				
				$.ajax({
					url: "../admin/samewordplus",
					data: { "nums": JSON.stringify(nums), "word": word },
					success: function(re2) {
						if (re2 == 1) {
							alert("동의어 등록 성공");
							location.href = "/wiki/admin/adminmain.jsp";
						}
						else {
							alert("동의어 등록 실패"); return;
						}
					}
				});

			}
			else { alert("동일한 동의어가 존재합니다. 다시 입력해주세요"); return; }
			}
		});

}
function rewordcss() {
	$("#reword").css('display', 'inline');
	$("#up").css('display', 'inline');
}
function wordupdate(deno) {
	
	console.log(num2);
	console.log(deno);
	let reword = $("#reword").val();
	if(reword = "") {
		alert("수정할 동의어를 입력해주세요");
		return;
	}
	let nums = {
		"num" : num2,
		"reword" : reword,
		"sno" : deno
	}
	
	$.ajax({
		url : '../admin/samewordupdate',
		data : {"nums": JSON.stringify(nums)},
		success : function(re) {
			if(re==1) {
				alert("동의어 수정 성공!");
				  $('#exampleModal').load(location.href+' #exampleModal');
			}
			else {
				alert("동의어 수정 실패!");
			}
			
		}
	});
}

function worddelete(deno) {
	console.log(deno);
	
	$.ajax({
		url : '../admin/sameworddelete',
		data : {'sno' : deno},
		success : function(re) {
			if(re == 1) {
				alert("동의어 삭제 성공!");
				  $('#exampleModal').load(location.href+' #exampleModal');
			}
			else {
				alert("동의어 삭제 실패!");
			}
		}
	});
}

