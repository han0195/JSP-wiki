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
		request.setCharacterEncoding("UTF-8");
		int Deno= Integer.parseInt(request.getParameter("Deno"));
		String id=null;
		String ip=request.getRemoteAddr();
		
		ArrayList<DebateChat> list =DebateDao.getDebateDao().getDebateChatList(Deno);	
		
		
		JSONArray ja= new JSONArray();
		try {
			for(DebateChat  debateChat : list) {
				JSONObject jo = new JSONObject();
				//* 아이디값 필요
				jo.put("name", debateChat.getDtid());
				jo.put("content",debateChat.getDtcontent());
				jo.put("date", debateChat.getDtdate());
				ja.put(jo);
			}
		} catch (Exception e) {
			System.out.println("json error");
		}
		
		if(list!=null) {
			//json 
			response.setCharacterEncoding("UTF-8");
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
