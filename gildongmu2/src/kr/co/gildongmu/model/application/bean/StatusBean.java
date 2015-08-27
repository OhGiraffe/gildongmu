package kr.co.gildongmu.model.application.bean;

public class StatusBean {
	private int b_num;
	private String u_id;
	private String s_apply;
	private String s_attend;
	private String s_give;
	
	public StatusBean() {
		// TODO Auto-generated constructor stub
	}
	
	public StatusBean(int b_num, String u_id, String s_apply, String s_attend, String s_give) {
		super();
		this.b_num = b_num;
		this.u_id = u_id;
		this.s_apply = s_apply;
		this.s_attend = s_attend;
		this.s_give = s_give;
	}



	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getS_apply() {
		return s_apply;
	}

	public void setS_apply(String s_apply) {
		this.s_apply = s_apply;
	}

	public String getS_attend() {
		return s_attend;
	}

	public void setS_attend(String s_attend) {
		this.s_attend = s_attend;
	}

	public String getS_give() {
		return s_give;
	}

	public void setS_give(String s_give) {
		this.s_give = s_give;
	}
	
	
}
