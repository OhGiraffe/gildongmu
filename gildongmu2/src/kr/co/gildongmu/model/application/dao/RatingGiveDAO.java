package kr.co.gildongmu.model.application.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

// LocalDAO
public class RatingGiveDAO {

	@Autowired
	private SqlSession session;

	public void insert(int givenum, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", givenum);
		map.put("id", id);
		session.insert("ratingGive.insert", map);
	}// select

	public void givechange(int num, String r_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", r_id);
		session.update("ratingGive.update", map);
	}// select
}
