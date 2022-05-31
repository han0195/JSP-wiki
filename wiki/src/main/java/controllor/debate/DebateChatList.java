package controllor.debate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.DebateDao;
import dto.DebateChat;

/**
 * Servlet implementation class DebateChatList
 */
@WebServlet("/debate/DebateChatList")
public class DebateChatList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebateChatList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int Deno= Integer.parseInt(request.getParameter("Deno"));
		
		ArrayList<DebateChat> list =DebateDao.getDebateDao().getDebateChatList(Deno);	
		
		JSONObject jo = new JSONObject();
		JSONArray ja= new JSONArray();
		try {
			for(DebateChat  debateChat : list) {
				jo.put("name", debateChat.getDtid());
				jo.put("content",debateChat.getDtcontent());
				jo.put("date", debateChat.getDtdate());
				ja.put(jo);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(list!=null) {
			//json 
			response.setContentType("application/json");
			response.getWriter().print(ja);
			
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
