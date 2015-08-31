package kr.co.gildongmu.controller.user.write;


import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.dao.ReviewDAO;
import kr.co.gildongmu.model.board.dao.ReviewReplyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewDeleteController{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;

	
	@RequestMapping("/delete_r")
	public String delete_r(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		reviewReplyDAO.deleteAll(num);
		reviewDAO.delete(num);
		
		
		return "redirect:review";
	}
}