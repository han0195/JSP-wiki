package dto;

public class DebateChat {

	private int deno; 			//토론번호
	private String dtid; 		//작성자 아이디
	private String dtcontent; 	//채팅 내용
	private String dtdate;  	//채팅등록날짜
	
	
	public DebateChat() {
		// TODO Auto-generated constructor stub
	}


	public DebateChat(int deno, String dtid, String dtcontent, String dtdate) {
		super();
		this.deno = deno;
		this.dtid = dtid;
		this.dtcontent = dtcontent;
		this.dtdate = dtdate;
	}


	public int getDeno() {
		return deno;
	}


	public void setDeno(int deno) {
		this.deno = deno;
	}


	public String getDtid() {
		return dtid;
	}


	public void setDtid(String dtid) {
		this.dtid = dtid;
	}

	public String getDtcontent() {
		return dtcontent;
	}


	public void setDtcontent(String dtcontent) {
		this.dtcontent = dtcontent;
	}


	public String getDtdate() {
		return dtdate;
	}


	public void setDtdate(String dtdate) {
		this.dtdate = dtdate;
	}


	@Override
	public String toString() {
		return "DebateChat [deno=" + deno + ", dtid=" + dtid + ", dtcontent=" + dtcontent
				+ ", dtdate=" + dtdate + "]";
	}
	
	
	
}
