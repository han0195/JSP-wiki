package controllor.document;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class uploadimg
 */
@WebServlet("/document/uploadimg")
public class uploadimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadimg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String uploadpath = request.getSession().getServletContext().getRealPath("/document/upload") ;
		
		// 첨부파일 업로드 [ MultipartRequest : cos 라이브러리 제공 클래스 ] 
		MultipartRequest multi = new MultipartRequest(
				request ,		// 1. 요청방식 
				uploadpath , 	// 2. 파일 저장 경로 
				1024*1024*10 ,	// 3. 파일 최대 용량 허용 범위 [ 10MB ] 
				"UTF-8" ,		// 4. 인코딩타입 
				new DefaultFileRenamePolicy() 	// 4. 보안방식 : 동일한 파일명이 있을경우 자동 이름 변환 
				);	
		// 데이터 요청 
		String image = multi.getFilesystemName("uploadfile"); // 첨부파일 : getFilesystemName
		
		
		
		System.out.println(image);
		System.out.println(uploadpath);	
		
		
		
	}
		
		
	}


