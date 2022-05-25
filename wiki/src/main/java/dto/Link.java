package dto;

public class Link {
	private int dno;
	private int frompageno;
	private int topageno;
	private int misspagettitle;

	public Link() {
		// TODO Auto-generated constructor stub
	}

	public Link(int dno, int frompageno, int topageno, int misspagettitle) {
		super();
		this.dno = dno;
		this.frompageno = frompageno;
		this.topageno = topageno;
		this.misspagettitle = misspagettitle;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public int getFrompageno() {
		return frompageno;
	}

	public void setFrompageno(int frompageno) {
		this.frompageno = frompageno;
	}

	public int getTopageno() {
		return topageno;
	}

	public void setTopageno(int topageno) {
		this.topageno = topageno;
	}

	public int getMisspagettitle() {
		return misspagettitle;
	}

	public void setMisspagettitle(int misspagettitle) {
		this.misspagettitle = misspagettitle;
	}

	@Override
	public String toString() {
		return "Link [dno=" + dno + ", frompageno=" + frompageno + ", topageno=" + topageno + ", misspagettitle="
				+ misspagettitle + "]";
	}

}
