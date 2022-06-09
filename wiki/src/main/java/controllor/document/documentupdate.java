package controllor.document;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.DocumentDao;
import dto.Content;

/**
 * Servlet implementation class documentupdate
 */
@WebServlet("/document/documentupdate")
public class documentupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public documentupdate() {
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
			
			
			String dcontent = jo.getString("dcontent");
			int dno = jo.getInt("dno");
				
			String dimg = jo.getString("dimgname");
			
			if(mid == null) {
				mid = jo.getString("ip");
			}
			
			Content c = new Content(0, dno, mid, null, dcontent, 0, dimg);
			boolean result = DocumentDao.getdocumentDao().setContent(c, dno);
			
			if(result) {
				response.getWriter().print(1);
			}
			else {
				response.getWriter().print(2);
			}
		}catch(Exception e) {e.printStackTrace();}
		
		
		
		
	}

}
