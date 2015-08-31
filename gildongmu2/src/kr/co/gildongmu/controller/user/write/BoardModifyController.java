package kr.co.gildongmu.controller.user.write;

import java.io.UnsupportedEncodingException;
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
public class BoardModifyController{
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private StatusDAO statusDAO;
	
	@RequestMapping("/modify_b")
	public String modify_b(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int num = Integer.parseInt(request.getParameter("b_num"));
		int count = Integer.parseInt(request.getParameter("b_count"));
		String bdate = request.getParameter("b_date");
		Date date = java.sql.Date.valueOf(bdate);
		
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

		BoardBean boardbean = new BoardBean(num, content, lemp, sdate, edate, temp, title, date, id, recruit, count, status);

		boardDAO.modify(boardbean);
		BoardBean bean = boardDAO.select(num);

		List<StatusBean> statuslist =statusDAO.select(num);
		request.setAttribute("statuslist", statuslist);
		
		String url = request.getParameter("url");
		request.setAttribute("url", url);
		request.setAttribute("bean", bean);
		
		return "boardView/view_board";
	}
}
