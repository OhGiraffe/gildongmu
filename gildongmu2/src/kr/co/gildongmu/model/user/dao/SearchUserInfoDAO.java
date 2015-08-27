package kr.co.gildongmu.model.user.dao;

import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchUserInfoDAO {

	@Autowired
	private SqlSession session;

	public UserBean searchInfo(String id) {
		return session.selectOne("searchUserInfo.select", id);
	}
}
