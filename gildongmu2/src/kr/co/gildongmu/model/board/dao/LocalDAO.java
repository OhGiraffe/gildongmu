package kr.co.gildongmu.model.board.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

// LocalDAO
public class LocalDAO {

	@Autowired
	private SqlSession session;

	public String select(String name) {

		String l_image = (String) session.selectOne("local.select", name);

		return l_image;
	}// select

	public int count(String name) {
		
		int i = session.selectOne("local.count", name);

		return i;
	}// select

	public List<BoardBean> selectAdminList() {

		List<BoardBean> list = session.selectList("local.selectAdminList");

		return list;
	}

	public List<BoardBean> selectBoard(String name, int start, int end) {

		RowBounds bounds = new RowBounds(start, end);
		
		List<BoardBean> list = session.selectList("local.selectBoard", name, bounds);

		return list;
	}// select

}
