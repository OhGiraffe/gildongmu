package kr.co.gildongmu.model.user.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class MyListDAO {

	@Autowired
	private SqlSession session;

	public List<BoardBean> selectAll(String id) {

		List<BoardBean> list =  session.selectList("myList.select", id);

		return list;
	}
}
