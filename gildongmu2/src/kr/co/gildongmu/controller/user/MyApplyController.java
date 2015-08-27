package kr.co.gildongmu.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.user.dao.MyApplyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
// 내가 신청한 글 보기 
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyApplyController{
	
	@Autowired
	private MyApplyDAO myApplyDAO;

	@RequestMapping("/myapply")
	public String searchIdResult(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("result_id");
		List<BoardBean> list = myApplyDAO.select(id);
		request.setAttribute("myapply", list);
		
		return "myinfoView/myapply";
	}
}
