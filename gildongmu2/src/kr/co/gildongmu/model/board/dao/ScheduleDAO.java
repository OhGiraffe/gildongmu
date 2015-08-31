package kr.co.gildongmu.model.board.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ScheduleDAO {

	@Autowired
	private SqlSession session;

	public int count(String sdate, String edate) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		if (!sdate.equals("출발일")) {
			map.put("sdate", sdate);
		}
		if (!edate.equals("도착일")) {
			map.put("edate", edate);
		}
		
		int i = session.selectOne("schedule.count", map);

		return i;
	}

	public List<BoardBean> select(String sdate, String edate, int start, int end) {
		HashMap<String, String> map = new HashMap<String, String>();

		if (!sdate.equals("출발일")) {
			map.put("sdate", sdate);
		}
		if (!edate.equals("도착일")) {
			map.put("edate", edate);
		}

		RowBounds bounds = new RowBounds(start, end);
		
		List<BoardBean> list = session.selectList("schedule.select", map, bounds);

		return list;
	}

	public List<BoardBean> selectAdminList() {

		List<BoardBean> list = session.selectList("schedule.selectAdminList");

		return list;
	}
}
