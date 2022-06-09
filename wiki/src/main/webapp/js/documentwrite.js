let ip; // ip를 저장하기 위한 변수설정
var fileNo = 0; // 첨부파일의 수 설정
var filesArr = new Array(); // 파일들의 리스트
$(document).ready(function() { // 문서가 시작되면 썸머노트 시행
	//여기 아래 부분


	$.ajax({ // ip 획득 api
		url: "https://api.ip.pe.kr/json"
	}).done(function(api) {
		ip = api.ip;
	}).fail(function() {
		alert("로딩하는데 실패하였습니다.")
	});


	$('#summernote').summernote({
		height: 300,                 // 에디터 높이
		width: 800,
		minHeight: 300,             // 최소 높이
		maxHeight: 300,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정  
		toolbar: [
			// [groupName, [list of button]]
			['fontname', ['fontname']],
			['fontsize', ['fontsize']],
			['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
			['color', ['forecolor', 'color']],
			['table', ['table']],
			['para', ['ul', 'ol', 'paragraph']],
			['height', ['height']],
			['insert', ['picture', 'link', 'video']],
			['view', ['fullscreen', 'help']]
		],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
		fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72'],

	});


});


let pass = false; // 문서 제목이 중복되는 경우를 방지하기 위한 변수 설정	
function titlecheck() {
	let dtitle = $("#dtitle").val();
	if (dtitle == null) {
		alert("제목이 공백입니다!");
		pass = false;
		return;
	}

	$.ajax({
		url: "titlecheck",
		data: { "dtitle": dtitle },
		success: function(result) {
			if (result == 1) {
				alert("중복된 제목이 존재합니다."); pass = false;
			}
			else {
				alert("작성 가능한 문서 제목입니다."); pass = true;
			}
		}
	});

	

}



/* 첨부파일 추가 */
function addFile(obj) {
	var maxFileCnt = 5;   // 첨부파일 최대 개수
	var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
	var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
	var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수

	// 첨부파일 개수 확인
	if (curFileCnt > remainFileCnt) {
		alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
	}

	for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

		const file = obj.files[i];

		// 첨부파일 검증
		if (validation(file)) {
			// 파일 배열에 담기
			var reader = new FileReader();
			reader.onload = function() {
				filesArr.push(file);
			};
			reader.readAsDataURL(file)

			// 목록 추가
			let htmlData = '';
			htmlData += '<div id="file' + fileNo + '" class="filebox">';
			htmlData += '   <p class="name">' + file.name + '</p>';
			htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
			htmlData += '</div>';
			$('.file-list').append(htmlData);
			fileNo++;
		} else {
			continue;
		}
	}
	// 초기화
	document.querySelector("input[type=file]").value = "";
}

/* 첨부파일 검증 */
function validation(obj) {
	const fileTypes = ['image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif'];
	if (obj.name.length > 100) {
		alert("파일명이 100자 이상인 파일은 제외되었습니다.");
		return false;
	} else if (obj.size > (100 * 1024 * 1024)) {
		alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
		return false;
	} else if (obj.name.lastIndexOf('.') == -1) {
		alert("확장자가 없는 파일은 제외되었습니다.");
		return false;
	} else if (!fileTypes.includes(obj.type)) {
		alert("첨부가 불가능한 파일은 제외되었습니다.");
		return false;
	} else {
		return true;
	}
}

/* 첨부파일 삭제 */
function deleteFile(num) {
	document.querySelector("#file" + num).remove();
	filesArr[num].is_delete = true;
}

function readURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      document.getElementById('preview').src = e.target.result;
    };
    reader.readAsDataURL(input.files[0]);
  } else {
    document.getElementById('preview').src = "";
  }
}

/* 폼 전송(파일 업로드) */
function dwrite() {
	let dtitle = $("#dtitle").val();
	let dcontent = $("#summernote").val();
	let newText = dcontent.replace(/(<([^>]+)>)/ig, ""); // <> 태그 제거
	
	if (pass == false) {
			alert("문서 제목 중복 체크를 먼저 해주세요");
			return;
		}
		if(dcontent == null) {
			alert("문서의 내용을 입력해주세요");
			return;
		}
		
		
	
	let dimgname = [];
	var formData = new FormData(document.getElementById('upload'));

	for (var i = 0; i < filesArr.length; i++) {
		// 삭제되지 않은 파일만 폼데이터에 담기
		if (!filesArr[i].is_delete) {
			dimgname.push(  filesArr[i].name );
			formData.append('img',   document.getElementById('uploadfile').files[0]);
			formData.append("image", filesArr[i].name);
		}
	}
	
	let djson = {
		dtitle : dtitle,
		dcontent : newText,
		dimgname : dimgname,
		ip : ip
	}
	console.log(djson); //  확인용
	console.log(dimgname);
	console.log(formData);
	    $.ajax({
		  method: 'POST',
		  url: 'documentadd',
		  data: {'djson' : JSON.stringify(djson)},
		  async: true,
		  timeout: 30000,
		  cache: false,
		  success: function () {
			  // 문서의 이미지를 서버에 업로드 해야 하는 코드 작성.
			  $.ajax({
				type : "POST",
				enctype: 'multipart/form-data',
				url : 'uploadimg',
				data : formData,
				processData: false,
		        contentType: false, 
		        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
		        success : function(){
					alert("문서의 업로드가 완료되었습니다.");
					location.href = '/wiki/document/documentview.jsp';
				}   
			});
		  },
		  error: function (xhr, desc, err) {
			  alert('에러가 발생 하였습니다.');
			  return;
		  }
	  });
}




	