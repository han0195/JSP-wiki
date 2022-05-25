package dto;

public class Content {
	private int cid;
	private int dno;
	private int mno;
	private String updatetime;
	private String dcontent;
	int dgood;

	public Content() {
		// TODO Auto-generated constructor stub
	}

	public Content(int cid, int dno, int mno, String updatetime, String dcontent, int dgood) {
		super();
		this.cid = cid;
		this.dno = dno;
		this.mno = mno;
		this.updatetime = updatetime;
		this.dcontent = dcontent;
		this.dgood = dgood;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
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

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getDcontent() {
		return dcontent;
	}

	public void setDcontent(String dcontent) {
		this.dcontent = dcontent;
	}

	public int getDgood() {
		return dgood;
	}

	public void setDgood(int dgood) {
		this.dgood = dgood;
	}
}
