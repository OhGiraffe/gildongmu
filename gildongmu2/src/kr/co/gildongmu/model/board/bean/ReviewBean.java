package kr.co.gildongmu.model.board.bean;

import java.sql.Date;

public class ReviewBean {
	private int r_num;
	private String u_id;
	private String r_title;
	private String r_content;
	private Date r_date;
	private int r_count;
	private String r_image;
	
	public ReviewBean() {
		
	}
	
	

	public ReviewBean(int r_num, String u_id, String r_title, String r_content,
			Date r_date, int r_count, String r_image) {
		this.r_num = r_num;
		this.u_id = u_id;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_count = r_count;
		this.r_image = r_image;
	}



	public ReviewBean(int r_num, String u_id, String r_title, String r_content,
			Date r_date, int r_count) {
		this.r_num = r_num;
		this.u_id = u_id;
		this.r_title = r_title;
		this.r_content = r_content;
		this.r_date = r_date;
		this.r_count = r_count;
	}
	
	public ReviewBean(int r_num, String r_title, String r_content) {
		this.r_num = r_num;
		this.r_title = r_title;
		this.r_content = r_content;
	}
	
	

	public ReviewBean(int r_num, int r_count) {
		this.r_num = r_num;
		this.r_count = r_count;
	}

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public int getR_count() {
		return r_count;
	}

	public void setR_count(int r_count) {
		this.r_count = r_count;
	}

	public String getR_image() {
		return r_image;
	}



	public void setR_image(String r_image) {
		this.r_image = r_image;
	}

	
}
