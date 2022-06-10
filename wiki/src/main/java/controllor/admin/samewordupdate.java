package controllor.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import dao.DocumentDao;

/**
 * Servlet implementation class samewordupdate
 */
@WebServlet("/admin/samewordupdate")
public class samewordupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public samewordupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("dd");
		String json = request.getParameter("nums");
		try {
			JSONObject jo = new JSONObject(json);
			String reword = jo.getString("reword");
			String bno = jo.getString("num");
			int sno = Integer.parseInt(jo.getString("sno")) ;
			System.out.println(jo.toString());
			boolean result = DocumentDao.getdocumentDao().synupdate(bno, reword, sno);
			if(result) {
				response.getWriter().print(result);
			}
			else {response.getWriter().print(result);}
		}catch(Exception e) {e.printStackTrace();}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
