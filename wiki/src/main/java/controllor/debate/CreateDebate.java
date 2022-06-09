package controllor.debate;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DebateDao;
import dto.Debate;

/**
 * Servlet implementation class CreateDebate
 */
@WebServlet("/debate/CreateDebate")
public class CreateDebate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateDebate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("debatetitle");
		String content=request.getParameter("debatecontent");
		
		//세션값
//		int dno=Integer.parseInt(request.getParameter("dno"));
//		int mno=Integer.parseInt(request.getParameter("mno"));
		
		Debate debate = new Debate(0, 0, 0,null,title, content, null ,"1");
	    boolean result=DebateDao.getDebateDao().createDebate(debate);
	    if(result) {
	    	response.sendRedirect("/wiki/debate/debatemain.jsp");
	    }else {
	    	response.sendRedirect("/wiki/debate/debatecreate.jsp");
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
