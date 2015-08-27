package kr.co.gildongmu.model.board.bean;

import java.sql.Date;

public class BoardBean {
	private int b_num;
	private String b_content;
	private String l_name;
	private Date b_sdate;
	private Date b_edate;
	private String b_thema;
	private String b_title;
	private Date  b_date;
	private String u_id;
	private int b_recruit;
	private int b_count;
	private String b_status;
	
	public BoardBean() {
		
	}

	public BoardBean(int b_num, String b_content, String l_name, Date b_sdate,
			Date b_edate, String b_thema, String b_title, Date b_date,
			String u_id, int b_recruit, int b_count, String b_status) {
		this.b_num = b_num;
		this.b_content = b_content;
		this.l_name = l_name;
		this.b_sdate = b_sdate;
		this.b_edate = b_edate;
		this.b_thema = b_thema;
		this.b_title = b_title;
		this.b_date = b_date;
		this.u_id = u_id;
		this.b_recruit = b_recruit;
		this.b_count = b_count;
		this.b_status = b_status;
	}

	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getL_name() {
		return l_name;
	}

	public void setL_name(String l_name) {
		this.l_name = l_name;
	}

	public Date getB_sdate() {
		return b_sdate;
	}

	public void setB_sdate(Date b_sdate) {
		this.b_sdate = b_sdate;
	}

	public Date getB_edate() {
		return b_edate;
	}

	public void setB_edate(Date b_edate) {
		this.b_edate = b_edate;
	}

	public String getB_thema() {
		return b_thema;
	}

	public void setB_thema(String b_thema) {
		this.b_thema = b_thema;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public Date getB_date() {
		return b_date;
	}

	public void setB_date(Date b_date) {
		this.b_date = b_date;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getB_recruit() {
		return b_recruit;
	}

	public void setB_recruit(int b_recruit) {
		this.b_recruit = b_recruit;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	
}
