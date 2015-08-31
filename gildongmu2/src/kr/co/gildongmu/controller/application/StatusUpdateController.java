package kr.co.gildongmu.controller.application;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.application.dao.LevelUpDAO;
import kr.co.gildongmu.model.application.dao.StatusDAO;
import kr.co.gildongmu.model.login.bean.UserBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StatusUpdateController{
	
	@Autowired
	private StatusDAO statusDAO;
	@Autowired
	private LevelUpDAO levelUpDAO;
	
	@RequestMapping("/upstatus")
	public String upstatus(HttpServletRequest request) {

		String check = request.getParameter("check");
		int num = Integer.parseInt(request.getParameter("b_num"));
		
		if(check.equals("incruit")){ //모집중 -> 모집완료
			statusDAO.incruitUpdate(num);
		}
		else if(check.equals("ready")){ //모집완료 -> 준비완료
			String checkid = request.getParameter("checkid");
			String[] id = checkid.split(",");
			
			statusDAO.readyUpdate(num);
			statusDAO.applyChange(num, id);

		}
		else if(check.equals("tour")){ //준비완료 -> 여행완료
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
			
			for(int i=0; i<id.length; i++){
				UserBean userbean= levelUpDAO.select(id[i]);
				levelUpDAO.levelUp(userbean);
			}
		}
		
		return "redirect:view_board?b_num="+num;
	}
}
