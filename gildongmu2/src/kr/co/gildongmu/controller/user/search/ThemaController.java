package kr.co.gildongmu.controller.user.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.dao.ThemaDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 테마 게시판
@Controller
public class ThemaController{
	
	@Autowired
	private ThemaDAO themaDAO;
	
	@RequestMapping("/thema")
	public String thema() {
		return "themaView/thema";
	}
	
	@RequestMapping("/themasearch")
	public String themasearch(HttpServletRequest request) {
		
		String inthema = request.getParameter("thema");
		String themas[] = inthema.split(",");

		int i = themaDAO.count(themas);

		int block = 1;
		if (!request.getParameter("block").equals("undefined"))
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
		List<BoardBean> adminlist = themaDAO.selectAdminList();
		List<BoardBean> list = themaDAO.selectList(themas, start, end);
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
		request.setAttribute("thema", inthema);
		request.setAttribute("list", list);
		request.setAttribute("adminlist", adminlist);

		return "themaView/thema_result";
	}
}
