package dto;

public class Content {
	private int cid;
	private int dno;
	private String mid;
	private String updatetime;
	private String dcontent;
	private int dgood;
	private String dimg;
	
	
	public Content(int cid, String mid, String updatetime, int dgood) {
		super();
		this.cid = cid;
		this.mid = mid;
		this.updatetime = updatetime;
		this.dgood = dgood;
	}
	public Content(int cid, int dno, String mid, String updatetime, String dcontent, int dgood, String dimg) {
		super();
		this.cid = cid;
		this.dno = dno;
		this.mid = mid;
		this.updatetime = updatetime;
		this.dcontent = dcontent;
		this.dgood = dgood;
		this.dimg = dimg;
	}
public Content() {
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
public String getMid() {
	return mid;
}
public void setMid(String mid) {
	this.mid = mid;
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
public String getDimg() {
	return dimg;
}
public void setDimg(String dimg) {
	this.dimg = dimg;
}



}
