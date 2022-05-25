package dto;

public class Synonys {
	int sno;
	int dno;
	String synpage;
	public Synonys(int sno, int dno, String synpage) {
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
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getSynpage() {
		return synpage;
	}
	public void setSynpage(String synpage) {
		this.synpage = synpage;
	}
}
