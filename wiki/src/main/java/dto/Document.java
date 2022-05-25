package dto;

public class Document {
	private int dno;
	private String dtitle;

	public Document() {
		// TODO Auto-generated constructor stub
	}

	public Document(int dno, String dtitle) {
		super();
		this.dno = dno;
		this.dtitle = dtitle;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getDtitle() {
		return dtitle;
	}

	public void setDtitle(String dtitle) {
		this.dtitle = dtitle;
	}

	@Override
	public String toString() {
		return "Document [dno=" + dno + ", dtitle=" + dtitle + "]";
	}

}
