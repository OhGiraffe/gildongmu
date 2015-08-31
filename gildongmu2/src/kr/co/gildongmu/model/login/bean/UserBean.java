package kr.co.gildongmu.model.login.bean;

public class UserBean {
	private String u_id;
    private String u_name;
    private String u_pass;
    private String u_image;
    private int u_age;
    private String u_gen;
    private String u_zipcode;
    private String u_addr;
    private String u_tel;
    private String u_email;
    private int u_grade;
    private int u_attend;
    private int u_apply;
    private int u_npeople;
    private int u_level;
	
    
    public UserBean() {
    	
    }

	public UserBean(String u_id, String u_pass, int u_age, String u_tel,
			String u_email) {
		super();
		this.u_id = u_id;
		this.u_pass = u_pass;
		this.u_age = u_age;
		this.u_tel = u_tel;
		this.u_email = u_email;
	}
	public UserBean(String u_id, String u_name, String u_pass, String u_image,
			int u_age, String u_gen, String u_zipcode, String u_addr,
			String u_tel, String u_email, int u_grade, int u_attend,
			int u_apply, int u_npeople, int u_level) {
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pass = u_pass;
		this.u_image = u_image;
		this.u_age = u_age;
		this.u_gen = u_gen;
		this.u_zipcode = u_zipcode;
		this.u_addr = u_addr;
		this.u_tel = u_tel;
		this.u_email = u_email;
		this.u_grade = u_grade;
		this.u_attend = u_attend;
		this.u_apply = u_apply;
		this.u_npeople = u_npeople;
		this.u_level = u_level;
	}


	public String getU_id() {
		return u_id;
	}


	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getU_name() {
		return u_name;
	}


	public void setU_name(String u_name) {
		this.u_name = u_name;
	}


	public String getU_pass() {
		return u_pass;
	}


	public void setU_pass(String u_pass) {
		this.u_pass = u_pass;
	}


	public String getU_image() {
		return u_image;
	}


	public void setU_image(String u_image) {
		this.u_image = u_image;
	}


	public int getU_age() {
		return u_age;
	}


	public void setU_age(int u_age) {
		this.u_age = u_age;
	}


	public String getU_gen() {
		return u_gen;
	}


	public void setU_gen(String u_gen) {
		this.u_gen = u_gen;
	}


	public String getU_zipcode() {
		return u_zipcode;
	}


	public void setU_zipcode(String u_zipcode) {
		this.u_zipcode = u_zipcode;
	}


	public String getU_addr() {
		return u_addr;
	}


	public void setU_addr(String u_addr) {
		this.u_addr = u_addr;
	}


	public String getU_tel() {
		return u_tel;
	}


	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}


	public String getU_email() {
		return u_email;
	}


	public void setU_email(String u_email) {
		this.u_email = u_email;
	}


	public int getU_grade() {
		return u_grade;
	}


	public void setU_grade(int u_grade) {
		this.u_grade = u_grade;
	}


	public int getU_attend() {
		return u_attend;
	}


	public void setU_attend(int u_attend) {
		this.u_attend = u_attend;
	}


	public int getU_apply() {
		return u_apply;
	}


	public void setU_apply(int u_apply) {
		this.u_apply = u_apply;
	}


	public int getU_npeople() {
		return u_npeople;
	}


	public void setU_npeople(int u_npeople) {
		this.u_npeople = u_npeople;
	}

	public int getU_level() {
		return u_level;
	}

	public void setU_level(int u_level) {
		this.u_level = u_level;
	}

    
    
}
