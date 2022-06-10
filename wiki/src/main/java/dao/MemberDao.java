package dao;

import java.util.ArrayList;

import dto.Member;

public class MemberDao extends Dao{
	public MemberDao() {
		super();
	}
	public static MemberDao memberDao=new MemberDao();
	public static MemberDao getmemberDao() {return memberDao;}
	
	//아이디 중복체크 메소드
	public boolean idCheck(String mid) {
		String sql = "select * from member where mid = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mid);
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
			ps.setString(2, member.getMpw());
			ps.setString(3, member.getMname());
			ps.setString(4, member.getMphone());
			ps.executeUpdate();
			return true;
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//로그인 메소드
	public boolean login(String id, String pw) {
		String sql="select*from member where mid='"+id+"' and mpw='"+pw+"'";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//내 회원정보 반환 메소드
	public Member myInfo(int mno) {
		String sql="select*from member where mno="+mno;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) { // 비밀번호 제외하고 회원정보 반환
				Member member=new Member(rs.getInt(1), rs.getString(2), null, rs.getString(4), rs.getString(5));
				return member;
			}
		}catch(Exception e) {e.printStackTrace();}
		return null;
	}
	//비밀번호 찾기 메소드
	public String pwSearch(String mid, String mphone) {
		String sql="select mpw from member where mid= ? and mphone= ?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, mphone);
			rs=ps.executeQuery();
			if(rs.next()) {
				System.out.println(rs.getString(1));
				return rs.getString(1);
			}
		}catch(Exception e) {System.out.println("에러" + e);}
		return null;
	}
	//회원 탈퇴 메소드
	public boolean memberDel(int mno) {
		String sql="delete from member where mno="+mno;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//회원정보 수정 메소드
	public boolean memberEdit(Member member) {
		String sql="update member set mid='"+member.getMid()+"', mpw='"+member.getMpw()+"',"
				+ "mname='"+member.getMname()+"', mphone='"+member.getMphone()+"' where mno="+member.getMno();
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		}catch(Exception e) {e.printStackTrace();}
		return false;
	}
	//회원번호 출력 메소드
	public int getMno(String mid) {
		String sql="select mno from member where mid='"+mid+"'";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		return 0;
	}
	//회원ID or IP 반환 메소드
	public String getmId(int mno) {
		String sql="select mid from member where mno="+mno;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {e.printStackTrace();}
		return "오류";
	}
	// 아이디 찾기
	public String getid(String mname, String mphone) {
		String sql = "select * from member where mname = ? and mphone = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, mname);
			ps.setString(2, mphone);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getString(2);
			}
		} catch (Exception e) {
			System.out.println("SQL 오류"+ e);
		}
		return null;
	}
	//멤버 리스트 가져오기 
	public ArrayList<Member> getMemberList(){
		ArrayList<Member> list = new ArrayList<Member>();
		String sql="SELECT * FROM treewiki.member;";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Member member =new  Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				list.add(member);
			}
			return list;
		} catch (Exception e) {
			System.out.println(" memberlist err !"+e);
		}
		return null;
	}
	//멤버 아이디 검색
	public ArrayList<Member> getMemberSearch(String searchId){
		ArrayList<Member> list = new ArrayList<Member>();
		String sql="select * from treewiki.member where mid like '%"+searchId+"%'";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Member member = new Member(rs.getInt(1), rs.getString(2), rs.getString(3),rs.getString(4), rs.getString(5));
				list.add(member);
			}
			return list;
		} catch (Exception e) {
			System.out.println("find id search err!!  " +e);
		}
		return null;
	}
}
