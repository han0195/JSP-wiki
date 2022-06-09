package controllor.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;

/**
 * Servlet implementation class find
 */
@WebServlet("/membar/find")
public class find extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public find() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mphone = request.getParameter("mphone");
		boolean ch = Boolean.parseBoolean(request.getParameter("ch"));
		System.out.println(ch);
		if(ch) {
			String mname = request.getParameter("mname");
			String mid = MemberDao.getmemberDao().getid(mname, mphone);
			if(mid == null) {
				response.getWriter().print(-1);
			}else {
				response.getWriter().print(mid);
			}
		}else {
			String mid = request.getParameter("mid"); 
			String mpw = MemberDao.getmemberDao().pwSearch(mid, mphone);
			System.out.println(mpw);
			if(mpw == null) {
				response.getWriter().print(-1);
			}else {
				response.getWriter().print(mpw);
			}
		}
		
	
	}

}
