package kr.co.gildongmu.controller.user.write;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.bean.ReviewReplyBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;
import kr.co.gildongmu.model.board.dao.ReviewReplyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewReplyWriteController{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;
	
	@RequestMapping("/write_re")
	public String write_re(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int r_num = Integer.parseInt(request.getParameter("r_num"));
		
		String id = (String)session.getAttribute("result_id");
		String content = request.getParameter("content");
		
		ReviewReplyBean bean = new ReviewReplyBean(0, r_num, id, null, content);
		reviewReplyDAO.insert(bean);
		
		ReviewBean reviewbean = reviewDAO.select(r_num);
	
		List<ReviewReplyBean> replyList = reviewReplyDAO.selectAll(r_num);
		
		request.setAttribute("reviewBean", reviewbean);
		request.setAttribute("replyList", replyList);
		
		return "redirect:view_review?num="+r_num;
	}
}
