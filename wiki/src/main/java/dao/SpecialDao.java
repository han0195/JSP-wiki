package dao;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.JSONArray;
import org.json.JSONObject;

import dto.Content;
import dto.Document;

public class SpecialDao extends Dao {
	public SpecialDao() {
		super();
	}

	public static SpecialDao specialDao = new SpecialDao();

	public static SpecialDao getSpecialDao() {
		return specialDao;
	}

	// 역링크 테이블에 목록 저장하는 메소드
	public boolean setLink(int dno, String pageno) {
		String sql = "insert into link(dno, frompageno) values (?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dno);
			ps.setString(2, pageno);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 역링크 테이블에 목록 하나만 추가하는 메소드
	public boolean addLink(int dno, int topageno) {
		String sql = "update link set frompageno = concat(frompageno, '," + topageno + "') where dno=" + dno;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 링크 검증 메소드
	public boolean reverseLink(int dno, String dcontent) {
		String linkTitle = "";
		// 정규표현식으로 링크거는게 있는지 판별
		try {
			if (dcontent.matches("(\\[\\[)(.*?)(\\]\\])")) {
				// 있을경우 [[ ]] 내부의 단어 추출
				Pattern pattern = Pattern.compile("(\\[\\[)(.*?)(\\]\\])");
				Matcher matcher = pattern.matcher(dcontent);
				while (matcher.find()) {
					linkTitle = matcher.group(2).trim();
					// 추출한 단어를 넣어서 해당하는 링크할 제목의 문서 번호 호출
					int tno = DocumentDao.getdocumentDao().getdno(linkTitle);
					if (tno == -1) { // 해당하는 제목의 문서가 없다면
						continue;
					} else { // 해당하는 제목의 문서가 있다면
						// 역링크 목록에 추가해주기
						SpecialDao.getSpecialDao().addLink(dno, tno);
					}
					if (matcher.group(2) == null) { // 정규표현식에 해당하는 문자열이 더이상 없다면
						break;
					}
				} // while e
			} // if e
			else {
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 역링크된 목록 불러오는 메소드
	public String getLink(int dno) {
		String sql = "select frompageno from link where dno=" + dno;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
//				String[] re=result.split(",");
//				int[] pages=new int[re.length];
//				for(int i=0; i<re.length; i++) {
//					pages[i]=Integer.parseInt(re[i]);
//				}
//				return pages; // 자르는건 받고나서 자르기
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	// 랜덤페이지 불러오기 메소드(10개)
	public ArrayList<Document> randomPage() {
		String sql = "select*from document order by rand() limit 10";
		ArrayList<Document> list = new ArrayList<Document>();
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Document d = new Document(rs.getInt(1), rs.getString(2));
				list.add(d);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	// 작성이 필요한 문서 불러오기 메소드

	////// 해당하는 문서 내용 전부 list 가져오기/////
	public JSONArray getcontentlist(int dno) {
		String sql = "select * from content where dno = ? order by updatetime desc";

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dno);
			rs = ps.executeQuery();
			JSONArray jsonArray = new JSONArray();
			while (rs.next()) {
				// blob to String

				System.out.println();
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("cid", rs.getInt(1));
				jsonObject.put("dno", rs.getInt(2));
				jsonObject.put("mid", rs.getString(3));
				jsonObject.put("updatetime", rs.getString(4));
				jsonObject.put("dcontent", rs.getString(5));
				jsonObject.put("dgood", rs.getInt(6));
				jsonObject.put("dimg", rs.getString(7));
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
			if (rs.next()) {
				Content content = new Content(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6), rs.getString(7));
				return content;
			}
		} catch (Exception e) {
			System.out.println("[getDocument SQL 에러]" + e);
		}
		return null;
	}

	///// 해당 문서 제목 가져오기 ///
	public Document getDocument(int dno) {
		String sql = "select * from document where dno = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dno);
			rs = ps.executeQuery();
			if (rs.next()) {
				Document document = new Document(rs.getInt(1), rs.getString(2));
				return document;
			}
		} catch (Exception e) {
			System.out.println("[getDocument] 에러" + e);
		}
		return null;
	}

	//// 조회수 증가 빼기 ///
	public boolean goodorbad(int cid, boolean ch) {
		String sql = "update  content set dgood = dgood + 1 where cid = ?";
		if (ch == false) {
			sql = "update  content set dgood = dgood - 1 where cid = ?";
		}
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, cid);
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("[goodandbad] 에러" + e);
		}
		return false;
	}

}
