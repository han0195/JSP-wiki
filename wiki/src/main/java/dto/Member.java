package dto;

public class Member {
	int mno;
	int mid;
	int mpw;
	int mname;
	int mphone;
	public Member() {
	}
	public Member(int mno, int mid, int mpw, int mname, int mphone) {
		super();
		this.mno = mno;
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.mphone = mphone;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getMpw() {
		return mpw;
	}
	public void setMpw(int mpw) {
		this.mpw = mpw;
	}
	public int getMname() {
		return mname;
	}
	public void setMname(int mname) {
		this.mname = mname;
	}
	public int getMphone() {
		return mphone;
	}
	public void setMphone(int mphone) {
		this.mphone = mphone;
	}
	
}
