package kr.co.gildongmu.model.login.dao;

import java.io.IOException;
import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

public class LoginManager implements HttpSessionBindingListener {
	private static LoginManager loginManager = null;
	private static Hashtable loginUsers = new Hashtable();

	private LoginManager() {
		super();
	}

	public static synchronized LoginManager getInstance() {
		if (loginManager == null) {
			loginManager = new LoginManager();
		}
		return loginManager;
	}

	// �ߺ� �α��� ���� ���� ���̵� ��������� üũ
	public boolean isUsing(String userID) {
		return loginUsers.containsValue(userID);
	}
	
	// �ش� ���ǿ� �̹� �α��� ���ִ��� üũ ->������.
	public boolean isLogin(String sessionID) {
		boolean isLogin = false;
		Enumeration e = loginUsers.keys();
		String key = "";
		while (e.hasMoreElements()) {
			key = (String) e.nextElement();
			if (sessionID.equals(key)) {
				isLogin = true;
			}
		}
		return isLogin;
	}



	// ���� ����
	public void setSession(HttpSession session, String userID) {
		session.setAttribute(userID, this);
	}

	// ���� ������ ��
	public void valueBound(HttpSessionBindingEvent event) {
		loginUsers.put(event.getSession(), event.getName());
	}

	// ���� ���涧
	public void valueUnbound(HttpSessionBindingEvent event) {
		loginUsers.remove(event.getSession());
	}

	// ���� ID�� �α�� ID ����
	public String getUserID(String sessionID) {
		return (String) loginUsers.get(sessionID);
	}

	// ���� �����ڼ�
	public int getUserCount() {
		return loginUsers.size();
	}

	 public void removeSession(String userId){
		 Enumeration e = loginUsers.keys();
		 HttpSession session = null;
		 HttpServletResponse res = null;
		 while(e.hasMoreElements()){
			 session = (HttpSession)e.nextElement();
			 if(loginUsers.get(session).equals(userId)){
				 //������ invalidate�ɶ� HttpSessionBindingListener�� 
				 //�����ϴ� Ŭ������ valueUnbound()�Լ��� ȣ��ȴ�.
				 session.invalidate();
			 }
		 }
	 }
}