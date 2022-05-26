package dao;

import dto.Member;

public class MemberDao extends Dao{
	public MemberDao() {
		super();
	}
	public static MemberDao memberDao=new MemberDao();
	public static MemberDao getmemberDao() {return memberDao;}
	
	//아이디 중복체크 메소드
	public boolean idCheck(String mid) {
		String sql = "select * from member where mid = '"+mid+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();	
			// 동일한 아이디가 존재하면 
			if( rs.next() ) { return true; } 
		}catch (Exception e) { System.out.println( e );} 
		// 동일한 아디디가 존재하지 않으면
		return false;
	}
	//이메일 중복체크 메소드
	public boolean emailCheck( String email ) {
		String sql = "select * from member where memail = '"+email+"'";
		try {  ps = con.prepareStatement(sql); rs= ps.executeQuery(); if( rs.next() ) return true;
		}catch (Exception e) {} return false;
	}
	//회원가입 메소드
	public boolean signUp(Member member) {
		String sql="insert into member(mid, mpw, mname, mphone) values (?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, member.getMid());
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//로그인 메소드
	public boolean login() {
		return false;
	}
	//내 회원정보 반환 메소드
	public Member myInfo() {
		return null;
	}
	//비밀번호 찾기 메소드
	public String pwSearch() {
		return "오류";
	}
	//회원 삭제 메소드
	public boolean memberDel() {
		return false;
	}
	//회원정보 수정 메소드
	public boolean memberEdit() {
		return false;
	}
	//회원번호 출력 메소드
	public int getMno() {
		return 0;
	}
	//회원ID or IP 반환 메소드
	public String getmId() {
		return "오류";
	}
}
