package kr.co.gildongmu.model.main.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.ReviewBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewBestDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<ReviewBean> select() {
		List<ReviewBean> list = session.selectList("reviewBest.select");
		return list;
	 }
	
}