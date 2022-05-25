package dao;

public class DebateDao extends Dao{
	public DebateDao() {
		super();
	}
	public static DebateDao debateDao=new DebateDao();
	public static DebateDao getDebateDao() {return debateDao;}
}
