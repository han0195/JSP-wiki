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
		
		String sql ="SELECT * FROM treewiki.debate order by deno desc";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				Debate debate = new Debate(rs.getInt(1), 0, 0,rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				debateList.add(debate);
			}
			return debateList;
		} catch (Exception e) {
			System.out.println("토론 리스트 호출 메소드 에러 경로:dao.debateDao @@@    "+e);
		}
		return null;
	}
	
	//3. 토론정보내용 출력 메소드
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
	
	//4.토론 채팅 등록하기
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
	
	//5.토론 채팅 뷰 메소드
	public ArrayList<DebateChat> getDebateChatList(int Deno){
		ArrayList<DebateChat> list = new ArrayList<DebateChat>();
		
		String sql="SELECT * FROM treewiki.debatechat where Deno=?";
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
	
	
}
