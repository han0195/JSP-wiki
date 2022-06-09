package controllor.function;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String mid = request.getParameter("mid");
		int cid = Integer.parseInt(request.getParameter("cid"));
		boolean ch = Boolean.parseBoolean(request.getParameter("ch")); // 추천/비추 기준값
		System.out.println("sssssss" + ch);
		// 중복검사
		String pass = (String) request.getSession().getAttribute(mid + cid);
		if (pass == null) {
			// 선택
			if (ch) { // 추천
				boolean result = SpecialDao.getSpecialDao().goodorbad(cid, ch);
				if (result) {
					session.setAttribute(mid + cid, "1");
					response.getWriter().print(1);
				} else {
					response.getWriter().print(-1);
				}
			} else { // 비추천
				boolean result = SpecialDao.getSpecialDao().goodorbad(cid, ch);
				if (result) {
					session.setAttribute(mid + cid, "1");
					response.getWriter().print(1);
				} else {
					response.getWriter().print(-1);
				}
			}
		} else {// 로그인기록있음
			response.getWriter().print(-1);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
