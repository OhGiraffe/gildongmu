package kr.co.gildongmu.controller.user.search;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.dao.LocalDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 지역불러오는 컨트롤러
@Controller
public class LocalBoardController{
	
	@Autowired
	private LocalDAO localDAO;
	
	@RequestMapping("/localboard")
	public String localboard(HttpServletRequest request) {

		String posturl = request.getHeader("referer");
		String url[] = posturl.split("\\/");
		String url2[]= url[4].split("\\?");
		
		String l_name = request.getParameter("l_name");

		int i = localDAO.count(l_name);

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
		List<BoardBean> adminlist = localDAO.selectAdminList();
		List<BoardBean> list = localDAO.selectBoard(l_name, start, end);
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
		request.setAttribute("l_name", l_name);
		request.setAttribute("list", list);
		request.setAttribute("adminlist", adminlist);
		
		if(url2[0].equals("localboard")){
			return "boardView/local_board_paging";
		}
		else{
			return "boardView/local_board";
		}
		
	}

}
