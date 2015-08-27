package kr.co.gildongmu.model.board.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class TourDAO {

	@Autowired
	private SqlSession session;

	public String select(String l_name, String t_name) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("l_name", l_name);
		map.put("t_name", t_name);
		String t_image = session.selectOne("tour.select", map);

		return t_image;
	}// select
}
