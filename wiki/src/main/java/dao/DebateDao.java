package dao;

import java.util.ArrayList;

import dto.Debate;

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
				Debate debate = new Debate(rs.getInt(1), 0, 0, rs.getString(4), rs.getString(5), rs.getString(6));
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
		ArrayList<Debate> debateInList = new ArrayList<Debate>();
		String sql = "SELECT * FROM treewiki.debate WHERE Deno=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, Deno);
			rs=ps.executeQuery();
			if(rs.next()) {
				return rs.getString(5);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
	
}
