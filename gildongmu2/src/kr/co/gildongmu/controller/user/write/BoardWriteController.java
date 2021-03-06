package kr.co.gildongmu.controller.user.write;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.application.bean.StatusBean;
import kr.co.gildongmu.model.application.dao.StatusDAO;
import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardWriteController {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private StatusDAO statusDAO;
	
	@RequestMapping("/write_board")
	public String write_board() {
		return "boardView/write_board";
	}
	
	@RequestMapping("/write_b")
	public String write_b(HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		String[] lcheckbox = request.getParameterValues("l_checkbox");
		String lemp = "";
		for( int i = 0; i < lcheckbox.length; i++ )
		{
			if(i<lcheckbox.length-1)
				lemp += lcheckbox[i]+",";
			else if(i==lcheckbox.length-1)
				lemp += lcheckbox[i];
			
		}
		
		String insdate = request.getParameter("b_sdate");
		String inedate = request.getParameter("b_edate");
		Date sdate = java.sql.Date.valueOf(insdate);
		Date edate = java.sql.Date.valueOf(inedate);
		
		String[] tcheckbox = request.getParameterValues("t_checkbox");
		String temp = "";
		for( int i = 0; i < tcheckbox.length; i++ )
		{
			if(i<tcheckbox.length-1)
				temp += tcheckbox[i]+",";
			else if(i==tcheckbox.length-1)
				temp += tcheckbox[i];
			
		}
		
		String status = request.getParameter("b_status");
		int recruit = Integer.parseInt(request.getParameter("b_recruit"));
		String title = request.getParameter("b_title");
		String content = request.getParameter("b_content");
		String id = (String)session.getAttribute("result_id");

		BoardBean bean = new BoardBean(0, content, lemp, sdate, edate, temp, title, null, id, recruit, 0, status);

		boardDAO.insert(bean);
		BoardBean boardbean = boardDAO.select(bean.getB_num());
		
		List<StatusBean> statuslist = (List<StatusBean>) statusDAO.select(bean.getB_num());
		request.setAttribute("statuslist", statuslist);
		
		String url = request.getParameter("url");
		request.setAttribute("url", url);
		request.setAttribute("bean", boardbean);
		
		
		return "boardView/view_board";
	}

}
