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
			String linkTitle="";
				
				
				
		//정규표현식으로 링크거는게 있는지 판별
		if(dcontent.matches("^*[[(.*?)]]*")) { System.out.println("링크 존재");
			//있을경우 [[ ]] 내부의 단어 추출
			Pattern pattern=Pattern.compile("^*[[(.*?)]]*");
			Matcher matcher=pattern.matcher(dcontent);
			while(matcher.find()) {
				System.out.println(matcher.group(1));
				linkTitle=matcher.group(1);
				// 추출한 단어를 넣어서 해당하는 링크할 제목의 문서 번호 호출
				dno= DocumentDao.getdocumentDao().getdno(linkTitle);
				if(dno==-1) { // 해당하는 제목의 문서가 없다면
					System.out.println("없는 문서를 링크하려 시도함."); continue;
				}else { // 해당하는 제목의 문서가 있다면
					//역링크 목록에 추가해주기
					// SpecialDao.getSpecialDao().addLink(현재 페이지 번호, dno);
				}
				if(matcher.group(1)==null) { // 정규표현식에 해당하는 문자열이 더이상 없다면
					break;
				}
			} // while e
		} //if e
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
