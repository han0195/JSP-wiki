package dao;

import dto.Document;

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
  //문서 작성 메소드
	public boolean docuCreate() {
		return false;
	}
	//해당 번호의 문서 불러오기 메소드
	public Document docuLoad() {
		return null;
	}
	//문서 수정 메소드
	public boolean docuEdit() {
		return false;
	}
	//문서 삭제 메소드
	public boolean docuDelete() {
	    return false;
	}
}
