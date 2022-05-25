package dto;

public class Locks {
	int mno;
	int lockat;
	int dno;
	int expiresat;
	int seenat;
	public Locks() {
	}
	public Locks(int mno, int lockat, int dno, int expiresat, int seenat) {
		super();
		this.mno = mno;
		this.lockat = lockat;
		this.dno = dno;
		this.expiresat = expiresat;
		this.seenat = seenat;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getLockat() {
		return lockat;
	}
	public void setLockat(int lockat) {
		this.lockat = lockat;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public int getExpiresat() {
		return expiresat;
	}
	public void setExpiresat(int expiresat) {
		this.expiresat = expiresat;
	}
	public int getSeenat() {
		return seenat;
	}
	public void setSeenat(int seenat) {
		this.seenat = seenat;
	}
	@Override
	public String toString() {
		return "Locks [mno=" + mno + ", lockat=" + lockat + ", dno=" + dno + ", expiresat=" + expiresat + ", seenat="
				+ seenat + "]";
	}
	
}
