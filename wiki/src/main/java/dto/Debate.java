package dto;

public class Debate {
	private int deno;
	private int dno;
	private int mno;
	private String detitle;
	private String decontent;
	private String dedate;

	public Debate() {
		// TODO Auto-generated constructor stub
	}

	public Debate(int deno, int dno, int mno, String detitle, String decontent, String dedate) {
		super();
		this.deno = deno;
		this.dno = dno;
		this.mno = mno;
		this.detitle = detitle;
		this.decontent = decontent;
		this.dedate = dedate;
	}

	public int getDeno() {
		return deno;
	}

	public void setDeno(int deno) {
		this.deno = deno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getDetitle() {
		return detitle;
	}

	public void setDetitle(String detitle) {
		this.detitle = detitle;
	}

	public String getDecontent() {
		return decontent;
	}

	public void setDecontent(String decontent) {
		this.decontent = decontent;
	}

	public String getDedate() {
		return dedate;
	}

	public void setDedate(String dedate) {
		this.dedate = dedate;
	}

	@Override
	public String toString() {
		return "Debate [deno=" + deno + ", dno=" + dno + ", mno=" + mno + ", detitle=" + detitle + ", decontent="
				+ decontent + ", dedate=" + dedate + "]";
	}

}
