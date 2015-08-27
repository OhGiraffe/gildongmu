package kr.co.gildongmu.controller.user.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.bean.ReviewReplyBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;
import kr.co.gildongmu.model.board.dao.ReviewReplyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewViewController {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;

	@RequestMapping("/view_review")
	public String view_review(HttpServletRequest request) {

		int r_num = Integer.parseInt(request.getParameter("num"));

		ReviewBean reviewbean = reviewDAO.select(r_num);
		reviewDAO.count(r_num);
	
		List<ReviewReplyBean> replyList = reviewReplyDAO.selectAll(r_num);
		
		request.setAttribute("reviewBean", reviewbean);
		request.setAttribute("replyList", replyList);
		
		return "reviewView/view_review";
	}
	
	@RequestMapping("/modify_review")
	public String modify_review(HttpServletRequest request) {
		int r_num = Integer.parseInt(request.getParameter("num"));
		
		ReviewBean reivewbean = reviewDAO.select(r_num);
		request.setAttribute("bean", reivewbean);

		return "reviewView/modify_review";
	}
}
