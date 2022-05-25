package dao;

import org.json.JSONArray;
import org.json.JSONObject;

public class SpecialDao extends Dao{
	public SpecialDao() {
		super();
	}
	public static SpecialDao specialDao=new SpecialDao();
	public static SpecialDao getSpecialDao() {return specialDao;}
	
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
