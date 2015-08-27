package kr.co.gildongmu.controller.application;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.gildongmu.model.application.bean.StatusBean;
import kr.co.gildongmu.model.application.dao.StatusDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatusInputController{
	
	@Autowired
	private StatusDAO statusDAO;
	
	@RequestMapping("/instatus")
	public String instatus(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int num = Integer.parseInt(request.getParameter("b_num"));
		String id = request.getParameter("r_id");
		
		statusDAO.insert(num, id);
		return "redirect:view_board?b_num="+num;
	}
}
