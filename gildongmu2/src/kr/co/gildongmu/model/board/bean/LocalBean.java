package kr.co.gildongmu.model.board.bean;

public class LocalBean {
	String l_name;
	String l_image;
	
	public LocalBean() {
		// TODO Auto-generated constructor stub
	}
	
	public LocalBean(String l_name, String l_image) {
		super();
		this.l_name = l_name;

		this.l_image = l_image;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getL_image() {
		return l_image;
	}

	public void setL_image(String l_image) {
		this.l_image = l_image;
	}
	
	
}
