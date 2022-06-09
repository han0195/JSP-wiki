$('#good').click(function() { // 별의 색깔이 변하는 기능
	console.log(this);
		if ($(this).hasClass("active_good")) {
			
			$(this).removeClass("active_good");
		} else {
			$(this).addClass("active_good");
		}
	});
	
	
$(document). ready(function(){
		let dno = $("#dno").val();
		let contexthtml = "";
		let imghtml = "";
	
		$.ajax({
			url : 'getcontent',
			data : {"dno" : dno},
			success(json) {
				
				var reg = /[`~!@#$%^&*|+\-=?;:'"<>\{\}\[\]\\\/]/gim; // 특수문자 제거를 위한 정규식
				
				var resultData = json["dimg"].replace(reg, ""); // db에 있는 특수문자들을 제거
				
				
				let img = resultData.split( ',' ); // 이미지가 여러개 일 경우 ,로 구분했으므로 ,를 기준으로 이미지 파일들의 배열 생성
				console.log(img);
				var text = json["dcontent"].replace(/'\\'/g, '<br>'); // 문단 구분을 위한 문자 판별
				
				
				
					contexthtml = '<div id="">' + text + '</div>'
					if(img != "") {
					for(let i = 0; i < img.length; i++) {
					imghtml += '<img src="/wiki/document/upload/'+img[i]+'" class="col-sm-6"> </img>'
					}
					$("#imgbox").html(imghtml);
				}
				
			}
		});
		
		
		
});	
	
	
	