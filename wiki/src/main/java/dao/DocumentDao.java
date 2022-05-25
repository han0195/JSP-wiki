package dao;

import java.sql.Statement;

import dto.Content;

public class DocumentDao extends Dao{

	public DocumentDao() {
		super(); // 부모클래스 생성자 호출 
	}
	public static DocumentDao documentDao = new DocumentDao(); 		// dao 호출시 반복되는 new 연산자 제거 
	public static DocumentDao getdocumentDao() { return documentDao; } 
	
	public boolean titlecheck(String dtitle) {
		try {
			String sql = "select * from document where dtitle = ?";
			ps = con.prepareStatement(sql);
			ps.setString(1, dtitle);
			rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//문서 생성 메소드
	public boolean docuCreate(String title, Content c) {
		//document 테이블에 제목부터 넣고 생성된 번호 받아오기
		String sql="insert into document(dtitle) values "+title;
		try {
			ps=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
			ps.executeUpdate();
			rs=ps.getGeneratedKeys();
			int dno=rs.getInt(1); // 받아온 번호 dno에 넣기
			boolean re=setContent(c, dno);
			if(re) {
				
			}else {
				
			}
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//문서 내용 넣기 메소드
	public boolean setContent(Content c, int dno) {
		//content 테이블에 해당 번호를 포함한 객체 넣기
		String sql="insert into content(dno,mid,dcontent,dgood) values (?,?,?,?)";
		try {
		ps=con.prepareStatement(sql);
		ps.setInt(1, dno);
		ps.setString(2, c.getMid());
		ps.setString(3, c.getDcontent());
		ps.setInt(4, c.getDgood());
		ps.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//해당 번호의 문서정보 불러오기 메소드
	public Content docuLoad(int dno) {
		String sql="select * from content where dno="+dno;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			Content content=new Content(rs.getInt(1), rs.getInt(2),
					rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6));
			return content;
		}catch(Exception e) {e.printStackTrace();}
		return null;
	}
	//문서 내용 수정 메소드(제목,번호가 같은 새 데이터 생성)
	public boolean docuEdit(Content c) {
		String sql="insert into content(dno,mno,dcontent,dgood) values (?,?,?,?)";
		try {
		ps=con.prepareStatement(sql);
		ps.setInt(1, c.getDno());
		ps.setString(2, c.getMid());
		ps.setString(3, c.getDcontent());
		ps.setInt(4, c.getDgood());
		ps.executeUpdate();
		return true;
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//문서 삭제 요청 메소드
	public boolean docuDelask(int dno) {
	    return false;
	}
	//동의어 등록 메소드
}
