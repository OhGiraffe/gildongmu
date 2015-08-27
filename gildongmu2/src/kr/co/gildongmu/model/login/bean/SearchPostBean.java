package kr.co.gildongmu.model.login.bean;

public class SearchPostBean {
	/*-create table zipcode(
			seq number(5,0),
			zipcode varchar2(7),
			sido varchar2(6),
			gugun varchar2(30),
			dong varchar2(50),
			ri varchar2(80),
			bunji varchar2(20),
			constraint zipcode_pk primary key(seq));*/
	private int seq;
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String ri;
	private String bunji;
	
	public SearchPostBean() {
		// TODO Auto-generated constructor stub
	}

	public SearchPostBean(int seq, String zipcode, String sido, String gugun,
			String dong, String ri, String bunji) {
		super();
		this.seq = seq;
		this.zipcode = zipcode;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.ri = ri;
		this.bunji = bunji;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getRi() {
		return ri;
	}

	public void setRi(String ri) {
		this.ri = ri;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

}
