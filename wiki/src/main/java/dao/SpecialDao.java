package dao;

import org.json.JSONArray;
import org.json.JSONObject;

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
	////// 해당하는 문서 내용 전부 가져오기/////
	public JSONArray getcontent(int dno) {
		String sql = "select * from content where dno = ?";
		try {
			ps = con.prepareStatement(sql); ps.setInt(1, dno);
			rs = ps.executeQuery();
			JSONArray jsonArray = new JSONArray();
			while(rs.next()) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("cid", rs.getInt(1));
				jsonObject.put("dno", rs.getInt(2));
				jsonObject.put("mno", rs.getInt(3));
				jsonObject.put("updatetime", rs.getInt(4));
				jsonObject.put("dcontent", rs.getInt(5));
				jsonObject.put("dgood", rs.getInt(6));
				jsonArray.put(jsonObject);
			}
			return jsonArray;
		} catch (Exception e) {
			System.out.println("[getcontent SQL 에러]" + e);
		}
		return null;
	}
	
}
