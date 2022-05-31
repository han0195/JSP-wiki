package dto;

public class Debate {
	private int deno;			//토론번호
	private int dno;			//문서번호
	private int mno;			//회원번호
	private String deid;		//작성자 아이디 OR IP주소
	private String detitle;		//토론제목
	private String decontent;	//토론내용
	private String dedate;		//작성시간

	public Debate() {
		// TODO Auto-generated constructor stub
	}

	public Debate(int deno, int dno, int mno, String deid, String detitle, String decontent, String dedate) {
		super();
		this.deno = deno;
		this.dno = dno;
		this.mno = mno;
		this.deid = deid;
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

	public String getDeid() {
		return deid;
	}

	public void setDeid(String deid) {
		this.deid = deid;
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
		return "Debate [deno=" + deno + ", dno=" + dno + ", mno=" + mno + ", deid=" + deid + ", detitle=" + detitle
				+ ", decontent=" + decontent + ", dedate=" + dedate + "]";
	}

}
