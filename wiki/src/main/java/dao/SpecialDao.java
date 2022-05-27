package dao;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.cj.jdbc.Blob;

import dto.Content;

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
  
	////// 해당하는 문서 내용 전부 list 가져오기/////
	public JSONArray getcontentlist(int dno) {
		String sql = "select * from content where dno = ? order by updatetime desc";

		try {
			ps = con.prepareStatement(sql); ps.setInt(1, dno);
			rs = ps.executeQuery();
			JSONArray jsonArray = new JSONArray();
			while(rs.next()) {
				//blob to String
				
				System.out.println();		
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("cid", rs.getInt(1));
				jsonObject.put("dno", rs.getInt(2));
				jsonObject.put("mid", rs.getString(3));
				jsonObject.put("updatetime", rs.getString(4));
				jsonObject.put("dcontent", rs.getString(5));
				jsonObject.put("dgood", rs.getInt(6));
				jsonArray.put(jsonObject);
			}
			return jsonArray;
		} catch (Exception e) {
			System.out.println("[getcontentlist SQL 에러]" + e);
		}
		return null;
	}
	//// 해당하는 문서 가져오기/////
	public Content getcontent(int cid) {
		String sql = "select * from content where cid = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cid);
			rs = ps.executeQuery();
			if(rs.next()) {
				Content content = new Content(
						rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4),rs.getString(5),
						rs.getInt(6)
						);
				return content;
			}
		} catch (Exception e) {
			System.out.println("[getDocument SQL 에러]" + e);
		}
		return null;
	}
}
