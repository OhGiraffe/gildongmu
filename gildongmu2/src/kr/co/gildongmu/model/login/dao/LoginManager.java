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

	// 중복 로그인 막기 위해 아이디 사용중인지 체크
	public boolean isUsing(String userID) {
		return loginUsers.containsValue(userID);
	}
	
	// 해당 세션에 이미 로그인 되있는지 체크 ->사용안함.
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



	// 세션 생성
	public void setSession(HttpSession session, String userID) {
		session.setAttribute(userID, this);
	}

	// 세션 성립될 때
	public void valueBound(HttpSessionBindingEvent event) {
		loginUsers.put(event.getSession(), event.getName());
	}

	// 세션 끊길때
	public void valueUnbound(HttpSessionBindingEvent event) {
		loginUsers.remove(event.getSession());
	}

	// 세션 ID로 로긴된 ID 구분
	public String getUserID(String sessionID) {
		return (String) loginUsers.get(sessionID);
	}

	// 현재 접속자수
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
				 //세션이 invalidate될때 HttpSessionBindingListener를 
				 //구현하는 클레스의 valueUnbound()함수가 호출된다.
				 session.invalidate();
			 }
		 }
	 }
}