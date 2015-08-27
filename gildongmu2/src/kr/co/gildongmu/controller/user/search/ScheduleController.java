package kr.co.gildongmu.controller.user.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.dao.ScheduleDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 일정 게시판
@Controller
public class ScheduleController{
	
	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@RequestMapping("/schedule")
	public String schedule() {
		return "scheduleView/schedule";
	}
	
	@RequestMapping("/schedulesearch")
	public String scheduleSearch(HttpServletRequest request) {
		
		
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");

		List<BoardBean> adminlist = null;
		List<BoardBean> list = null;
		
		int totalBlock = 0;
		int totalIdx = 0;
		int totalPage = 0;
		int block = 1;
		
		if(!sdate.equals("출발일") && !edate.equals("종료일")){
			int i = scheduleDAO.count(sdate, edate);

			if (!request.getParameter("block").equals("undefined"))
				block = Integer.parseInt(request.getParameter("block"));
			int record = 10;
			int start = 0;
			int end = 10;
			if (request.getParameter("start") != null)
				start = Integer.parseInt(request.getParameter("start"));
			if (request.getParameter("end") != null)
				end = Integer.parseInt(request.getParameter("end"));
			

			totalPage = i;
			adminlist = scheduleDAO.selectAdminList();
			list = scheduleDAO.select(sdate, edate, start, end);
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
		}
		else{
			adminlist = scheduleDAO.selectAdminList();
			totalBlock = 1;
		}

		request.setAttribute("totalBlock", totalBlock);
		request.setAttribute("block", block);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalIdx", totalIdx);
		request.setAttribute("sdate", sdate);
		request.setAttribute("edate", edate);
		request.setAttribute("list", list);
		request.setAttribute("adminlist", adminlist);

		return "scheduleView/schedule_result";
	}
}
