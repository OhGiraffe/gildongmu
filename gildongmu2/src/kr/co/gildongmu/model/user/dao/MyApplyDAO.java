package kr.co.gildongmu.model.user.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MyApplyDAO {

	@Autowired
	private SqlSession session;

	public List<BoardBean> select(String id) {

		List<BoardBean> list = session.selectList("myApply.select", id);

		return list;
	}
}
