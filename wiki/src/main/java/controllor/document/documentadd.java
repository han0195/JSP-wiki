package controllor.document;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

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
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		request.setCharacterEncoding("UTF-8");
		String mid = (String)request.getSession().getAttribute("login");
		String json = request.getParameter("djson");
		
		try {
			JSONObject jo = new JSONObject(json); // json 객체형 변환
			String dtitle= jo.getString("dtitle");
			
			String dcontent = jo.getString("dcontent");
			
			String dimg = jo.getString("dimgname");
			
			if(mid == null) {
				mid = jo.getString("ip");
			}
			
			
			Content c = new Content(0, 0, mid, null, dcontent, 0, dimg);
			boolean result = DocumentDao.getdocumentDao().docuCreate(dtitle, c);
			
			if(result) {
				response.getWriter().print(1);
			}
			else {
				response.getWriter().print(2);
			}
		}catch(Exception e) {e.printStackTrace();}
		
	
	}
}
