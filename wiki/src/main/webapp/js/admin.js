
let num=[];
function check(deno){
	
	let check=$('input:checkbox[name="debatecheck'+deno+'"]').is(":checked") == true

	if(check==true){
		num.push(deno);
	}else{
		for(let i=0; i<num.length; i++){
			if(num[i]==deno){
				num.splice(i,1);
			}
		}
	}
	
}

//토론삭제
function dedelete(){
	
	for(let i=0; i<num.length; i++){
		
		$.ajax({
			
			url:"../admin/DebateDelete",
			data:{"num":num[i]},
			suceess:function(data){
				
				if(data==1){
					num.splice(0,num.length);
					alert("삭제되었습니다.");
				}else{
					alert("ERROR!! 삭제 실패!");
				}
			}
		});
	}
	location.href="/wiki/admin/adminmain.jsp";
}
//문서 삭제
function dodelete(){
	
	for(let i=0; i<num.length; i++){
		
		$.ajax({
			
			url:"../admin/DocumentDelete",
			data:{"num":num[i]},
			suceess:function(data){
				
				if(data==1){
					num.splice(0,num.length);
					alert("삭제되었습니다.");
				}else{
					alert("ERROR!! 삭제 실패!");
				}
			}
		});
	}
	location.href="/wiki/admin/adminmain.jsp";
}

$(function(){

let docudate=[];
let debateDate=[];
let docucount=[];
let debateCount=[];

google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

		$.ajax({
			
			url:"../admin/DocumentChart",
			async: false,
			success:function(re){
		
				for(let i=0; i<re.length; i++){
					docudate.push(re[i]["dodate"]);
					docucount.push(re[i]["docount"]);
				}
			}
			
		});
		
		$.ajax({
			url:"../admin/DebateChart",
			async: false,
			success:function(re){
				console.log(re);
				for(let i=0; i<re.length; i++){
					debateDate.push(re[i]["dedate"]);
					debateCount.push(re[i]["decount"]);
				}
			}
		});
		
		var data = new google.visualization.DataTable();
		 	data.addColumn('string', 'date');
	     	data.addColumn('number', 'docount');
	     	data.addColumn('number', 'decount');

	    for(let i=0; i<docudate.length; i++){
		
			dataRow=[docudate[i],docucount[i],debateCount[i]];
			data.addRow(dataRow);
		}
	    
        var options = {
          title: '일별 문서 작성 차트',
          hAxis: {title: 'Year',  titleTextStyle: {color: '#333'}},
          vAxis: {minValue: 0}
        };

        var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
	
	
});

function eda(dno){
	let ch = true;
	$.ajax({
		url: "/wiki/admin/editben",
		data: {"dno" : dno, "ch": ch},
		success : function(re){
			if(re == 1){
				alert("수정권한이 허용되었습니다.");
			}else{
				alert("DB 오류 확인");
			}
		}
	});
	
}


//회원 탈퇴
function memberDelete(mno){
	if(confirm("정말 탈퇴를 진행하시겠습니까?")){
		$.ajax({
			
			url:"../admin/MemberDelete",
			data:{"mno":mno},
			success:function(data){
				if(data==1){
					alert("삭제진행이 완료 되었습니다.");
					location.href="/wiki/admin/membermanagement.jsp";
				}else{
					alert("삭제진행이 실패되었습니다. 서비스 관리자에게 문의해 주십시오.");	
				}
			}
			
		});
	}else{
		location.reload();
	}
	
}

