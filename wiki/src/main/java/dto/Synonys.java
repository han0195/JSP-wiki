package dto;

public class Synonys {
	int sno;
	String dno;
	String synpage;
	public Synonys(int sno, String dno, String synpage) {
		super();
		this.sno = sno;
		this.dno = dno;
		this.synpage = synpage;
	}public Synonys() {
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getDno() {
		return dno;
	}
	public void setDno(String dno) {
		this.dno = dno;
	}
	public String getSynpage() {
		return synpage;
	}
	public void setSynpage(String synpage) {
		this.synpage = synpage;
	}
}
