package kr.co.gildongmu.model.board.bean;

import java.sql.Date;

public class ReviewReplyBean {
	private int rr_num;
	private int r_num;
	private String u_id;
	private Date rr_date;
	private String rr_content;
	
	
	public ReviewReplyBean() {
	
	}


	public ReviewReplyBean(int rr_num, int r_num, String u_id, Date rr_date,
			String rr_content) {
		this.rr_num = rr_num;
		this.r_num = r_num;
		this.u_id = u_id;
		this.rr_date = rr_date;
		this.rr_content = rr_content;
	}


	public int getRr_num() {
		return rr_num;
	}


	public void setRr_num(int rr_num) {
		this.rr_num = rr_num;
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


	public Date getRr_date() {
		return rr_date;
	}


	public void setRr_date(Date rr_date) {
		this.rr_date = rr_date;
	}


	public String getRr_content() {
		return rr_content;
	}


	public void setRr_content(String rr_content) {
		this.rr_content = rr_content;
	}

	
}
