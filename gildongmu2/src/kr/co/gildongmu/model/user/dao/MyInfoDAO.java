package kr.co.gildongmu.model.user.dao;

import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MyInfoDAO {

	@Autowired
	private SqlSession session;

	public UserBean select(String id) {

		UserBean user = session.selectOne("myInfo.select", id);

		return user;
	}

	public boolean update(UserBean user) {
		int t = session.update("myInfo.update", user);
		if (t == 1)return true;
		return false;
	}

}
