package controllor.document;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DocumentDao;
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
