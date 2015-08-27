package kr.co.gildongmu.model.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ThemaDAO {

	@Autowired
	private SqlSession session;

	public int count(String[] thema) {

		ArrayList<String> themaList = new ArrayList<String>();
		for (int i = 0; i < thema.length; i++) {
			themaList.add(thema[i]);
		}
		HashMap<String, ArrayList<String>> themaMap = new HashMap<String, ArrayList<String>>();
		themaMap.put("themaArr", themaList);

		int j = (int) session.selectOne("thema.count", themaMap);

		return j;
	}

	public List<BoardBean> selectList(String[] thema, int start, int end) {

		ArrayList<String> themaList = new ArrayList<String>();
		for (int i = 0; i < thema.length; i++) {
			themaList.add(thema[i]);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("themaArr", themaList);
		
		RowBounds bounds = new RowBounds(start, end);
		List<BoardBean> list = session.selectList("thema.selectList", map, bounds);

		return list;
	}

	public List<BoardBean> selectAdminList() {

		List<BoardBean> list = session.selectList("thema.selectAdminList");

		return list;
	}
}
