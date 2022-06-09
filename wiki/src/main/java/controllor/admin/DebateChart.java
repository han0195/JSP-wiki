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
import dto.Debate;

/**
 * Servlet implementation class DebateChart
 */
@WebServlet("/admin/DebateChart")
public class DebateChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DebateChart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Debate> delist=DebateDao.getDebateDao().debeChart();
		JSONArray ja= new JSONArray();
		try {
			for(Debate debate : delist) {
				JSONObject jo= new JSONObject();
				jo.put("decount", debate.getDeno());
				jo.put("dedate", debate.getDedate());
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
