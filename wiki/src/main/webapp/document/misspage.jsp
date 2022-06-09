<%@page import="dao.SpecialDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성이 필요한 문서 목록</title>
</head>
<body>
<%ArrayList<String> l=SpecialDao.getSpecialDao().listNeedWrite();
//전체 갯수
int totalrow=l.size();
//2. 현재 페이지번호 
	int currentpage = 1;
		// *요청받은 페이지번호 
		String pagenum = request.getParameter("pagenum");
		if( pagenum == null ){ // 만약에 페이지번호 요청이 없으면
			currentpage = 1; // 1페이지
		}else{
			currentpage = Integer.parseInt( pagenum ); // 요청된 페이지번호 -> 정수형변환 -> 현재페이지 설정 
		}
	// 3. 페이지당 게시물을 표시할 개수 
	int listsize = 15;	// 추후에 사용자에게 입력 받기 
	// 4. 페이지당 게시물의 시작번호 
	int startrow = (currentpage-1)*listsize; // 1페이지 -> 0  // 2페이지 -> 5  // 3페이지 -> 10 ~~~ 
	// 5. 마지막페이지 번호 
	int lastpage = 0;
	if( totalrow % listsize == 0 ){ 
		// 전체게시물 와 화면표시게시물수 나누기 했을때 나머지가 0이면
		lastpage = totalrow / listsize; 
	}else{
		lastpage = totalrow / listsize +1; 
		// 나머지가 있으면 나머지 게시물을 표시할 페이지 +1
	}
	
	// 6-2 : 페이지별 페이징버튼 표시 개수 
	int btnsize = 15;
	// 6. 페이징버튼의 시작번호  1   6     11     16
	int startbtn = ( (currentpage-1) / btnsize ) * btnsize + 1 ;
	int endhtn = startbtn + btnsize-1;
	if( endhtn > lastpage ) endhtn = lastpage;
	ArrayList<String> n=SpecialDao.getSpecialDao().listNeedWrite(startrow, listsize);
%>
<%@include file="../header.jsp"%>
	<h3>작성이 필요한 제목들의 목록입니다.</h3>
	<table style="margin: 20px;">
		<%for(int i=0; i<n.size(); i++){ %>
		<tr><td>
		<%=l.get(i)%>
		</td></tr>
		<%} %>
	</table>
	<div class="col-md-4 offset-4 d-flex justify-content-center">
	<% for( int i = startbtn  ; i<=endhtn ; i++ ){ %>
					<ul class="pagenation" style="list-style-type: none;">
			 		<li class="page-item"> 
				 		<a class="page-link pagenum" href="misspage.jsp?pagenum=<%=i%>"> 
				 			<%=i %> 
				 		</a> 
			 		</li>
			 		</ul>
				<%} %>
				</div>
<%@include file="../footer.jsp"%>
</body>
</html>