package controllor.function;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SpecialDao;

/**
 * Servlet implementation class goodorbad
 */
@WebServlet("/function/goodorbad")
public class goodorbad extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goodorbad() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int cid = Integer.parseInt(request.getParameter("cid"));
		boolean ch = Boolean.valueOf(request.getParameter("ch"));
		//조회수 증가
		boolean result = SpecialDao.getSpecialDao().goodorbad(cid, ch);
		if(result) {
			response.getWriter().print(1);
		}else {
			response.getWriter().print(-1);
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
