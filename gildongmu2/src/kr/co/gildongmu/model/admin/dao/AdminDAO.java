package kr.co.gildongmu.model.admin.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

// AdminDAO
public class AdminDAO {

	@Autowired
	private SqlSession session;

	public int userCount() {

		int i = session.selectOne("admin.userCount");

		return i;
	}// select
	
	public int boardCount() {

		int i = session.selectOne("admin.boardCount");

		return i;
	}// select
	
	public int reviewCount() {

		int i = session.selectOne("admin.reviewCount");

		return i;
	}// select
	

	public List<BoardBean> noticeList(String id) {

		List<BoardBean> list = session.selectList("admin.noticeSelectAll", id);

		return list;
	}

	public List<UserBean> userList() {

		List<UserBean> list = session.selectList("admin.userSelectAll");

		return list;
	}

	public List<BoardBean> boardList() {
		List<BoardBean> list = session.selectList("admin.boardSelectAll");

		return list;
	}

	public List<UserBean> userSelect(int start, int end) {

		RowBounds bounds = new RowBounds(start, end);
		int i=0;
		
		List<UserBean> list = session.selectList("admin.userSelect", i, bounds);

		return list;
	}// select
	
	public List<BoardBean> boardSelect(int start, int end) {

		RowBounds bounds = new RowBounds(start, end);
		int i=0;
		
		List<BoardBean> list = session.selectList("admin.boardSelect", i, bounds);

		return list;
	}// select
	
	public List<ReviewBean> reviewSelect(int start, int end) {

		RowBounds bounds = new RowBounds(start, end);
		int i=0;
		
		List<ReviewBean> list = session.selectList("admin.reviewSelect", i, bounds);

		return list;
	}// select
	
	//
	// public ArrayList<ReviewBean> adminReivew() {
	// ArrayList<ReviewBean> list_r = null;
	// try {
	// list_r = (ArrayList<ReviewBean>)smc.queryForList("adminReview.select");
	// } catch (SQLException e) {
	// e.printStackTrace();
	// }
	// return list_r;
	// }
	//

}
