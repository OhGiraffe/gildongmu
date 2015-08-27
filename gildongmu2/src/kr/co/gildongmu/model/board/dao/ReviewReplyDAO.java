package kr.co.gildongmu.model.board.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.ReviewReplyBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ReviewReplyDAO {

	@Autowired
	private SqlSession session;

	public List<ReviewReplyBean> selectAll(int num) {
		List<ReviewReplyBean> list = session.selectList(
				"reviewReply.selectAll", num);

		return list;
	}

	public boolean insert(ReviewReplyBean reply) {
		int t = session.insert("reviewReply.insert", reply);
		if (t == 1)
			return true;
		return false;
	}

	public boolean delete(int rr_num) {
		int t = session.delete("reviewReply.delete", rr_num);
		if (t > 0)
			return true;
		return false;
	}

	public boolean deleteAll(int r_num) {
		int t = session.delete("reviewReply.deleteAll", r_num);
		if (t > 0)
			return true;
		return false;
	}
}
