package kr.co.gildongmu.model.join.dao;

import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class JoinDAO {

	@Autowired
	private SqlSession session;

	public boolean insert(UserBean user) {
		int t = session.insert("join.insert", user);
		if (t == 1)return true;
		return false;
	}

	
	public int idcheck(String w_id) {
		return session.selectOne("join.idcheck", w_id);	
	}
	
}
