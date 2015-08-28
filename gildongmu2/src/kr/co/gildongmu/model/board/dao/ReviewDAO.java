package kr.co.gildongmu.model.board.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.ReviewBean;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewDAO {

	@Autowired
	private SqlSession session;

	public List<ReviewBean> selectAll() {
		List<ReviewBean> list = session.selectList("review.selectAll");

		return list;
	}

	public ReviewBean select(int r_num) {
		ReviewBean bean = session.selectOne("review.select", r_num);

		return bean;
	}

	public int insert(ReviewBean reviewbean) {
		return session.insert("review.insert", reviewbean);
	}


	public boolean delete(int r_num) {
		int t = session.delete("review.delete", r_num);
		if (t > 0)
			return true;
		return false;
	}

	public void modify(ReviewBean reviewbean) {
		session.update("review.modify", reviewbean);
	}

	public boolean count(int r_num) {
		int t = session.update("review.count", r_num);
		if (t > 0)
			return true;
		return false;
	}

	public List<ReviewBean> search(String keyword, int skip, int max) {
		List<ReviewBean> list = session.selectList("review.search", keyword);
		return list;
	}

	public List<ReviewBean> selectBest() {
		List<ReviewBean> list = session.selectList("review.selectBest");
		return list;
	}

	public int selectCnt() {
		int result = session.selectOne("review.selectCnt");
		return result;
	}

	public List<ReviewBean> selectPage(int skip, int max) {
		RowBounds bounds = new RowBounds(skip, max);
		List<ReviewBean> list = session.selectList("review.selectPage", bounds);
		return list;
	}

}