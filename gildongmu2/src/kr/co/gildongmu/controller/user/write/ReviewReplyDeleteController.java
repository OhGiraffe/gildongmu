package kr.co.gildongmu.controller.user.write;

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
public class ReviewReplyDeleteController{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;
	
	@RequestMapping("/delete_re")
	public String delete_re(HttpServletRequest request) {
		
		int rr_num = Integer.parseInt(request.getParameter("rr_num"));
		int r_num = Integer.parseInt(request.getParameter("r_num"));

		reviewReplyDAO.delete(rr_num);
		
		ReviewBean reviewbean = reviewDAO.select(r_num);
		
		List<ReviewReplyBean> replyList = reviewReplyDAO.selectAll(r_num);
		
		request.setAttribute("reviewBean", reviewbean);
		request.setAttribute("replyList", replyList);
		
		return "redirect:view_review?num="+r_num;
	}
}
