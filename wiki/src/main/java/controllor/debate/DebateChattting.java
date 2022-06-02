package controllor.debate;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DebateDao;
import dto.DebateChat;
/**
 * Servlet implementation class DebateChat
 */
@WebServlet("/debate/DebateChatting")
public class DebateChattting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebateChattting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int deno= Integer.parseInt(request.getParameter("Deno"));
		String content=request.getParameter("dtcontent");
		DebateChat debateChat = new DebateChat(deno, null, content, null);
		boolean result=DebateDao.getDebateDao().setChat(debateChat);
		if(result) {
			response.getWriter().print(1);
		}else {
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
