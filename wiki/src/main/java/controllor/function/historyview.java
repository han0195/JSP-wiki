package controllor.function;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DocumentDao;
import dao.SpecialDao;
import dto.Content;
import dto.Document;

/**
 * Servlet implementation class historyview
 */
@WebServlet("/function/historyview")
public class historyview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public historyview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int cid = Integer.parseInt(request.getParameter("cid"));// 해당문서아이디
		
		String ip = request.getParameter("ip"); // 아이피가져오기
		
		String mid = (String)request.getSession().getAttribute("login");
		Content content = SpecialDao.getSpecialDao().getcontent(cid);// 문서내용가져오기
		if(content == null) {// 만약 문서내용가져오기 에러라면
			response.getWriter().print(-1);
		}else {// 성공적으로 문서내용 가져오면
		
			if(mid == null) { // 만약 로그인한 회원이 아니라면
				content.setMid(ip);
			}else {
				content.setMid(mid);
			}
			boolean result = DocumentDao.getdocumentDao().setContent(content, content.getDno());// 해당문서 내용넣기
			System.out.println(result);
			if(result) { // 문서 되돌리기 성공
				response.getWriter().print(content.getDno());
			}else{ // 문서 되돌리기 실패
				response.getWriter().print(-2);
			}
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
