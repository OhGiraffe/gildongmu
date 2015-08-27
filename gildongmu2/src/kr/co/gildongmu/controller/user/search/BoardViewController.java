package kr.co.gildongmu.controller.user.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.application.bean.StatusBean;
import kr.co.gildongmu.model.application.dao.StatusDAO;
import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 일정 게시판
@Controller
public class BoardViewController {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private StatusDAO statusDAO;

	@RequestMapping("/view_board")
	public String view_board(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("b_num"));

		BoardBean boardbean = boardDAO.select(num);
		List<StatusBean> statuslist = (List<StatusBean>) statusDAO.select(num);

		boardDAO.count(boardbean);
		
		request.setAttribute("bean", boardbean);
		request.setAttribute("statuslist", statuslist);
		
		return "boardView/view_board";
	}

	@RequestMapping("/modify_board")
	public String modify_board(HttpServletRequest request) {

		int num = Integer.parseInt(request.getParameter("b_num"));

		BoardBean boardbean = boardDAO.select(num);
		request.setAttribute("bean", boardbean);

		String purl = (String) request.getParameter("posturl");
		request.setAttribute("url", purl);
		
		return "boardView/modify_board";
	}

}
