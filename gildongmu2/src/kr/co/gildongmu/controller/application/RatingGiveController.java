package kr.co.gildongmu.controller.application;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.application.dao.RatingGiveDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RatingGiveController{
	
	@Autowired
	private RatingGiveDAO ratingGiveDAO;
	
	@RequestMapping("/view_ratinggive")
	public String view_ratinggive() {
		return "boardView/rating_give";
	}
	
	@RequestMapping("/ratinggive")
	public String ratingGive(HttpServletRequest request) {

		int givenum = Integer.parseInt(request.getParameter("select"));
		int num = Integer.parseInt(request.getParameter("b_num"));
		String u_id = request.getParameter("u_id");
		String r_id = (String) request.getSession().getAttribute("result_id");
		
		ratingGiveDAO.insert(givenum, u_id);
		ratingGiveDAO.givechange(num, r_id);
		
		return "redirect:view_board?b_num="+num;
	}

}
