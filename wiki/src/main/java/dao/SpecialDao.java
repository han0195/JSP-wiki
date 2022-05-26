package dao;

public class SpecialDao extends Dao{
	public SpecialDao() {
		super();
	}
	public static SpecialDao specialDao=new SpecialDao();
	public static SpecialDao getSpecialDao() {return specialDao;}
	
	//역링크된 목록 저장하는 메소드
	
	//역링크된 목록 불러오는 메소드
	
	//랜덤페이지 불러오기 메소드
	
	//작성이 필요한 문서 불러오기 메소드
}
