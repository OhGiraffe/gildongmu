package kr.co.gildongmu.controller.user.write;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.bean.ReviewReplyBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;
import kr.co.gildongmu.model.board.dao.ReviewReplyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// ¸®ºä ¾²±â
@Controller
public class ReviewModifyController{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;

	
	@RequestMapping("/modify_r")
	public String modify_r(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int r_num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		ReviewBean bean = new ReviewBean(r_num, title, content);
		reviewDAO.modify(bean);
		
		ReviewBean reivewbean = reviewDAO.select(r_num);
		reviewDAO.count(r_num);
	
		List<ReviewReplyBean> replyList = reviewReplyDAO.selectAll(r_num);
		
		request.setAttribute("reviewBean", reivewbean);
		request.setAttribute("replyList", replyList);

		return "reviewView/view_review";
	}
}