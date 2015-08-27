package kr.co.gildongmu.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.admin.dao.AdminDAO;
import kr.co.gildongmu.model.board.bean.BoardBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 관리자 메뉴에서 게시판목록 보기
@Controller
public class AdminBoardController{
	
	@Autowired
	private AdminDAO adminDAO;

	@RequestMapping("/admin_board")
	public String admin_board(HttpServletRequest request) {
		
		int i = adminDAO.boardCount();
		int block=1;
		
		if (request.getParameter("block") != null && !request.getParameter("block").equals("undefined"))
			block = Integer.parseInt(request.getParameter("block"));
		int record = 10;
		int totalBlock = 0;
		int start = 0;
		int end = 10;
		if (request.getParameter("start") != null)
			start = Integer.parseInt(request.getParameter("start"));
		if (request.getParameter("end") != null)
			end = Integer.parseInt(request.getParameter("end"));
		int totalIdx = 0;
		int totalPage = 0;

		totalPage = i;

		List<BoardBean> list = adminDAO.boardSelect(start, end);
		
		if (totalPage % record == 0) {
			totalIdx = totalPage / record;
		} else
			totalIdx = totalPage / record + 1;
		if (totalPage % 50 == 0) {
			totalBlock = totalPage / 50;
		} else if (totalPage % 50 != 0) {
			totalBlock = totalPage / 50 + 1;
		}
		if (totalPage == 0)
			totalBlock = 1;

		request.setAttribute("totalBlock", totalBlock);
		request.setAttribute("block", block);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalIdx", totalIdx);
		request.setAttribute("boardList", list);

		return "adminView/admin_board";
	}
	
	@RequestMapping("/admin_board_paging")
	public String admin_board_paging(HttpServletRequest request) {
		
		int i = adminDAO.boardCount();
		int block=1;
		
		if (request.getParameter("block") != null && !request.getParameter("block").equals("undefined"))
			block = Integer.parseInt(request.getParameter("block"));
		int record = 10;
		int totalBlock = 0;
		int start = 0;
		int end = 10;
		if (request.getParameter("start") != null)
			start = Integer.parseInt(request.getParameter("start"));
		if (request.getParameter("end") != null)
			end = Integer.parseInt(request.getParameter("end"));
		int totalIdx = 0;
		int totalPage = 0;

		totalPage = i;

		List<BoardBean> list = adminDAO.boardSelect(start, end);
		
		if (totalPage % record == 0) {
			totalIdx = totalPage / record;
		} else
			totalIdx = totalPage / record + 1;
		if (totalPage % 50 == 0) {
			totalBlock = totalPage / 50;
		} else if (totalPage % 50 != 0) {
			totalBlock = totalPage / 50 + 1;
		}
		if (totalPage == 0)
			totalBlock = 1;

		request.setAttribute("totalBlock", totalBlock);
		request.setAttribute("block", block);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalIdx", totalIdx);
		request.setAttribute("boardList", list);

		return "adminView/admin_board_paging";
	}
}
