package kr.co.gildongmu.model.message.bean;

import java.sql.Date;



public class MessageBean {
	private int m_num;
	private String m_sendID;
	private String m_receiveID;
	private String m_message;
	private String m_read;
	private Date m_date;
	
	public MessageBean() {
		
	}

	public MessageBean(int m_num, String m_sendID, String m_receiveID,
			String m_message, String m_read, Date m_date) {
		this.m_num = m_num;
		this.m_sendID = m_sendID;
		this.m_receiveID = m_receiveID;
		this.m_message = m_message;
		this.m_read = m_read;
		this.m_date = m_date;
	}





	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getM_sendID() {
		return m_sendID;
	}

	public void setM_sendID(String m_sendID) {
		this.m_sendID = m_sendID;
	}

	public String getM_receiveID() {
		return m_receiveID;
	}

	public void setM_receiveID(String m_receiveID) {
		this.m_receiveID = m_receiveID;
	}

	public String getM_message() {
		return m_message;
	}

	public void setM_message(String m_message) {
		this.m_message = m_message;
	}

	public String getM_read() {
		return m_read;
	}

	public void setM_read(String m_read) {
		this.m_read = m_read;
	}

	public Date getM_date() {
		return m_date;
	}

	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}

	
	
}
