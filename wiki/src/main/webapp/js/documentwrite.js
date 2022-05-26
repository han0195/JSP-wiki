$(document).ready(function() { // 문서가 시작되면 썸머노트 시행
	//여기 아래 부분
	
	 $.ajax({
        url: "https://api.ip.pe.kr/json"
    }).done(function(api) {
       console.log(api);
       ip = api.ip;
    }).fail(function() {
        alert("로딩하는데 실패하였습니다.")
    });
	
	
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  width : 800,
		  minHeight: 300,             // 최소 높이
		  maxHeight: 300,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정  
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}	
	});
	
});

function uploadSummernoteImageFile(file, editor) { // 이미지 업로드
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST", 
			url : "documentwrite", // 이미지 파일 업로드할 서블릿 파일 이름
			contentType : false,
			processData : false,
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	}
let pass = false; // 문서 제목이 중복되는 경우를 방지하기 위한 변수 설정	
function titlecheck() {
	let dtitle = $("#title").val();
	
	
	$.ajax({
		url : "titlecheck",
		data : {"dtitle": dtitle},
		success : function(result) {
			if(result == 1) {
				alert("중복된 제목이 존재합니다."); pass = false;
			}
			else {
				alert("작성 가능한 문서 제목입니다."); pass = true;
			}
		}
	})
	
}	
let ip; // ip를 저장하기 위한 변수설정
function documentadd() {
	
	let dtitle = $("#title").val();
	let dcontent = $("#summernote").val();
	
	if(pass == false) {
		alert("문서 제목 중복 체크를 먼저 해주세요");
		return;
	}
	else {
		$.ajax({
			url : "documentadd",
			data : {'dtitle' : dtitle, 'dcontent' : dcontent, 'ip' : ip},
			success : function(result) {
				if(result == 1) {
					alert("문서 작성 실패!");
				}
				else {
					alert("문서를 작성하였습니다.");
				}
			}
			
		});
	}
}





	