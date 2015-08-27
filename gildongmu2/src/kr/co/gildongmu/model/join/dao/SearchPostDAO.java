package kr.co.gildongmu.model.join.dao;

import java.util.List;

import kr.co.gildongmu.model.login.bean.SearchPostBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchPostDAO {

	@Autowired
	private SqlSession session;

	public List<SearchPostBean> searchPostSelect(String dong) {

		List<SearchPostBean> list = session.selectList("searchPost.select", dong);

		return list;
	}
}
