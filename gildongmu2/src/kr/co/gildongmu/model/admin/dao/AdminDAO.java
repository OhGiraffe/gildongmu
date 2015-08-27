package kr.co.gildongmu.model.admin.dao;

import java.util.List;

import kr.co.gildongmu.model.board.bean.BoardBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
// AdminDAO
public class AdminDAO {
	
	@Autowired
	private SqlSession session;
	
	public List<BoardBean> noticeList(String id) {

		List<BoardBean> list = session.selectList("adminNoctice.selectAll", id);

		return list;
	}
//	
//	public ArrayList<BoardBean> adminBoard() {
//		ArrayList<BoardBean> list =null;
//	      try {			 
//	    	  list = (ArrayList<BoardBean>) session.queryForList("adminboard.select");		    
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//	      return list;	
//	 }
//	
//	public ArrayList<UserBean> adminUser(){
//		ArrayList<UserBean> list_u = null;
//		try {
//			list_u = (ArrayList<UserBean>)session.queryForList("adminUser.select");
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list_u;
//	}
//	
//	
//	public ArrayList<ReviewBean> adminReivew() {
//		ArrayList<ReviewBean> list_r = null;
//		try {
//			list_r = (ArrayList<ReviewBean>)smc.queryForList("adminReview.select");
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		return list_r;
//	}
//	

	
}
