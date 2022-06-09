package controllor.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dao.DebateDao;
import dao.DocumentDao;
import dto.Content;
import dto.Debate;

/**
 * Servlet implementation class DocumentChart
 */
@WebServlet("/admin/DocumentChart")
public class DocumentChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Content>dolist= DocumentDao.getdocumentDao().docuChart();
		ArrayList<Debate> delist=DebateDao.getDebateDao().debeChart();
		System.out.println(delist.toString());
		JSONArray ja= new JSONArray();
		
		try {
			for(Content content : dolist) {
				JSONObject jo= new JSONObject();
				jo.put("docount",content.getDno());
				jo.put("dodate", content.getUpdatetime());
				ja.put(jo);
			}
		} catch (JSONException e) {
			System.out.println("Json 에러 " +e);
		}
		response.setContentType("application/json");
		response.getWriter().print(ja);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
