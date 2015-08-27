package kr.co.gildongmu.controller.user.search;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.dao.TourDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
// 관광지 보기 컨트롤러
@Controller
public class TourController{
	
	@Autowired
	private TourDAO tourDAO;
	
	@RequestMapping("/toursearch")
	public String toursearch(HttpServletRequest request,
							@RequestParam(value="l_name") String l_name,
							@RequestParam(value="t_name") String t_name) {

		String t_image = tourDAO.select(l_name, t_name);
		request.setAttribute("t_image", t_image);
		
		return "localView/tour_result";
	}

}
