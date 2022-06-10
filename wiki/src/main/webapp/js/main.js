(function() {
  // Variables
  var $curve = document.getElementById("curve");
  var last_known_scroll_position = 0;
  var defaultCurveValue = 350;
  var curveRate = 3;
  var ticking = false;
  var curveValue;

  // Handle the functionality
  function scrollEvent(scrollPos) {
    if (scrollPos >= 0 && scrollPos < defaultCurveValue) {
      curveValue = defaultCurveValue - parseFloat(scrollPos / curveRate);
      $curve.setAttribute(
        "d",
        "M 800 300 Q 400 " + curveValue + " 0 300 L 0 0 L 800 0 L 800 300 Z"
      );
    }
  }

  // Scroll Listener
  // https://developer.mozilla.org/en-US/docs/Web/Events/scroll
  window.addEventListener("scroll", function(e) {
    last_known_scroll_position = window.scrollY;

    if (!ticking) {
      window.requestAnimationFrame(function() {
        scrollEvent(last_known_scroll_position);
        ticking = false;
      });
    }

    ticking = true;
  });
  
})();

$(document).ready(function(){
	
	$.ajax({
		url : 'newdocumentlist',
		success : function(json) {
			
			let html = "<tr><th>번호</th><th>제목></th></tr>";
			for(let i = 0; i < json.length; i++) {
				html += 
				'<tr><td>'+
				json[i]["dno"] + '</td><td>' +
				'<a href= "/wiki/document/pageview.jsp?dno='+json[i]["dno"]+'">'
				+ json[i]["dtitle"] + '</a></td></tr>'
				;
			}
			$("#newdocu").html(html);
		}
	})
	
});  

function sach() {
	let sach = $("#searchinput").val();
	alert(sach);
	location.href = "/wiki/document/documentview.jsp?sach="+sach;
} 
