package kr.co.gildongmu.model.board.bean;

public class TourBean {
	String t_name;
    String l_name;
	String t_image;
	
	public TourBean() {
		// TODO Auto-generated constructor stub
	}

	public TourBean(String t_name, String l_name,String t_image) {
		super();
		this.t_name = t_name;
		this.l_name = l_name;
		this.t_image = t_image;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public String getT_image() {
		return t_image;
	}

	public void setT_image(String t_image) {
		this.t_image = t_image;
	}
	
	
}
