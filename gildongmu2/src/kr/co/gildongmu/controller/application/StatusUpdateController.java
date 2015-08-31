package kr.co.gildongmu.controller.application;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.application.dao.StatusDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatusUpdateController{
	
	@Autowired
	private StatusDAO statusDAO;
	
	
	@RequestMapping("/upstatus")
	public String upstatus(HttpServletRequest request) {

		String check = request.getParameter("check");
		int num = Integer.parseInt(request.getParameter("b_num"));
		
		if(check.equals("incruit")){
			statusDAO.incruitUpdate(num);
		}
		else if(check.equals("ready")){
			String checkid = request.getParameter("checkid");
			String[] id = checkid.split(",");
			
			statusDAO.readyUpdate(num);
			statusDAO.applyChange(num, id);

		}
		else if(check.equals("tour")){
			String checkid = request.getParameter("checkid").trim();
			String[] id = null;
			
			if(checkid.equals("")){
				statusDAO.tourUpdate(num);
				statusDAO.attendChangeNull(num);
			}
			else{
				id = checkid.split(",");
				statusDAO.tourUpdate(num);
				statusDAO.attendChange(num, id);
			}
			
			statusDAO.userApplyAttend(num);
		}
		
		return "redirect:view_board?b_num="+num;
	}
}
