package dao;

import java.util.ArrayList;

import dto.Debate;
import dto.DebateChat;

public class DebateDao extends Dao{
	public DebateDao() {
		super();
	}
	public static DebateDao debateDao=new DebateDao();
	
	public static DebateDao getDebateDao() {
		return debateDao;
	}
	
	//1.토론 생성 메소드
	public boolean createDebate(Debate debate) {
		
		String sql = "INSERT INTO debate(dno,mno,detitle,decontent) values (?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			
			ps.setInt(1,debate.getDno());
			ps.setInt(2,debate.getMno());
			ps.setString(3,debate.getDetitle());
			ps.setString(4,debate.getDecontent());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("토론생성 메소드 에러  경로: dao.debateDao @@@  "+e);
		}
		
		return false;
	}
	
	//2. 모든 토론 리스트 생성 하기
	public ArrayList<Debate> getDebateList(){
		ArrayList<Debate> debateList = new ArrayList<Debate>();
		
		String sql ="SELECT * FROM treewiki.debate ORDER BY dedate DESC";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Debate debate = new Debate(rs.getInt(1), 0, 0,rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				debateList.add(debate);
			}
			return debateList;
		} catch (Exception e) {
			System.out.println("토론 리스트 호출 메소드 에러 경로:dao.debateDao @@@    "+e);
		}
		return null;
	}
	
	//3. 오래된 토론 리스트 생성 하기
	public ArrayList<Debate> getOldDebateList(){
		ArrayList<Debate> debateList = new ArrayList<Debate>();
			
		String sql ="SELECT * FROM treewiki.debate order by dedate asc";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Debate debate = new Debate(rs.getInt(1), 0, 0,rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
				debateList.add(debate);
			}
			return debateList;
		} catch (Exception e) {
			System.out.println("토론 리스트 호출 메소드 에러 경로:dao.debateDao @@@    "+e);
		}
		return null;
	}
	
	//4. 토론정보내용 출력 메소드
	public String debateIn(int Deno){
		
		String sql = "SELECT * FROM treewiki.debate WHERE Deno=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, Deno);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getString(6);
			}
		} catch (Exception e) {
			System.out.println("토론정보 호출 에러 경로:dao.debateDao@@@  "+e);
		}
		
		return null;
	}
	
	//5.토론 채팅 등록하기
	public boolean setChat(DebateChat debateChat) {
		
		String sql = "INSERT INTO debatechat(deno,dtid,dtcontent) values (?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, debateChat.getDeno());
			ps.setString(2, debateChat.getDtid());
			ps.setString(3, debateChat.getDtcontent());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("채팅등록 에러 경로:dao.debateDao@@@   "+e);
		}
		return false;
	}
	
	//6.토론 채팅 뷰 메소드
	public ArrayList<DebateChat> getDebateChatList(int Deno){
		ArrayList<DebateChat> list = new ArrayList<DebateChat>();
		
		String sql="SELECT * FROM treewiki.debatechat WHERE Deno=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, Deno);
			rs=ps.executeQuery();
			while(rs.next()) {
				DebateChat debateChat = new DebateChat(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));
				list.add(debateChat);
			}
			return list;
		}catch (Exception e) {
			System.out.println("토론 채팅 뷰 호출 에러 경로:dao.debateDao@@@       "+e);
		}
		return null;
	}
	
	//7.토론 최근 수정 시간 가져오기
	public String getTime(int Deno) {
		
		String sql="SELECT dtdate FROM treewiki.debatechat WHERE deno=? ORDER BY dtdate DESC LIMIT 1";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, Deno);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("토론 최근 수정 시간 가져오기 에러 경로:dao.debateDao@@  "+e);
		}
		return null;
	}
	
	//8.토론 최근 수정시간 변경
	public void timeUpdate(int Deno) {
		String date=getTime(Deno);
		String sql="UPDATE treewiki.debate SET dedate='"+date+"' WHERE deno="+Deno;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("토론 최근 수정 시간 변경하기 에러 경로:dao.debateDao@@  "+e);
		}
	}

	//9.토론 상태 값 출력
	public String getDebateState(int Deno) {
		String sql="SELECT destate FROM treewiki.debate WHERE deno=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, Deno);
			rs=ps.executeQuery();
			if(rs.next()) {
			 return rs.getString(1);
			}
		} catch (Exception e) {
			System.out.println("토론 상태값 출력 에러 경로:dao.debateDao@@  "+e);
		}
		return null;
	}
	
}
