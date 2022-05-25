package dao;

public class SpecialDao extends Dao{
	public SpecialDao() {
		super();
	}
	public static SpecialDao specialDao=new SpecialDao();
	public static SpecialDao getSpecialDao() {return specialDao;}
}
