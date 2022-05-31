package controllor.document;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DocumentDao;
import dao.SpecialDao;
import dto.Content;

/**
 * Servlet implementation class documentadd
 */
@WebServlet("/document/documentadd")
public class documentadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public documentadd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String dtitle = request.getParameter("dtitle");
		String dcontext = request.getParameter("dcontent");
		String linkTitle="";
		//정규표현식으로 링크거는게 있는지 판별
		if(dcontext.matches("*[[(.*?)]]*")) { System.out.println("링크 존재");
			//있을경우 [[ ]] 내부의 단어 추출
			Pattern pattern=Pattern.compile("*[[(.*?)]]*");
			Matcher matcher=pattern.matcher(dcontext);
			while(matcher.find()) {
				System.out.println(matcher.group(1));
				linkTitle=matcher.group(1);
				// 추출한 단어를 넣어서 해당하는 링크할 제목의 문서 번호 호출
				int dno=DocumentDao.getdocumentDao().getdno(linkTitle);
				if(dno==-1) { // 해당하는 제목의 문서가 없다면
					System.out.println("없는 문서를 링크하려 시도함."); continue;
				}else { // 해당하는 제목의 문서가 있다면
					//역링크 목록에 추가해주기
					// SpecialDao.getSpecialDao().addLink(현재 페이지 번호, dno);
				}
				if(matcher.group(1)==null) { // 정규표현식에 해당하는 문자열이 더이상 없다면
					break;
				}
			} // while e
		} //if e
		String mid = (String)request.getSession().getAttribute("login");
		if(mid == null) {
			mid = request.getParameter("ip");
		}
		Content c = new Content(0, 0, mid, null, dcontext, 0);
		boolean result = DocumentDao.getdocumentDao().docuCreate(dtitle, c);
		if(result) {
			response.getWriter().print(1);
		}
		else {
			response.getWriter().print(2);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	

	
}
