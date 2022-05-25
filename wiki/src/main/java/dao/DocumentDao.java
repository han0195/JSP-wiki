package dao;

import dto.Document;

public class DocumentDao extends Dao{
	public DocumentDao() {
		super();
	}
	public static DocumentDao documentDao=new DocumentDao();
	public static DocumentDao getdocumentDao() {return documentDao;}
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
