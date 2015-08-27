package kr.co.gildongmu.controller.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.main.dao.ReviewBestDAO;
import kr.co.gildongmu.model.main.dao.SearchRankDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 메뉴에서 게시판목록 보기
@Controller
public class MainController {

	@Autowired
	private SearchRankDAO searchRankDAO;
	
	@Autowired
	private ReviewBestDAO reviewBestDAO;
	
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request) {
		List<UserBean> ranklist = searchRankDAO.select();
		List<ReviewBean> reviewlist = reviewBestDAO.select();
		request.setAttribute("rankList", ranklist);
		request.setAttribute("reviewList", reviewlist);
		return "mainView/main";
	}

}
