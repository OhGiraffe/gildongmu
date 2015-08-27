package kr.co.gildongmu.model.main.dao;

import java.util.List;

import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchRankDAO {

	@Autowired
	private SqlSession session;

	public List<UserBean> select() {
		List<UserBean> list = session.selectList("searchRank.select");
		return list;
	}
}
