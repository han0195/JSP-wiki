package dao;

public class MemberDao extends Dao{
	public MemberDao() {
		super();
	}
	public static MemberDao memberDao=new MemberDao();
	public static MemberDao getmemberDao() {return memberDao;}
	
	//아이디 중복체크 메소드
	public boolean idcheck() {
		return false;
	}
	//이메일 중복체크 메소드
	
	//회원가입 메소드
	
	//로그인 메소드
	
	//내 회원정보 반환 메소드
	
	//비밀번호 찾기 메소드
	
	//회원 삭제 메소드
	
	//회원정보 수정 메소드
	
	//회원번호 출력 메소드
	
	//회원ID or IP 출력 메소드
}
