package kr.co.gildongmu.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.user.dao.MyInfoDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 내정보 조회 컨트롤러
@Controller
public class SelectMyInfoController{
	
	@Autowired
	private MyInfoDAO myInfoDAO;
	
	@RequestMapping("/myinfo")
	public String myInfo(HttpServletRequest request) {
			
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("result_id");

		UserBean user = new UserBean();
		user = myInfoDAO.select(id);
		
		String splitpath[] = user.getU_image().split("\\\\");
		String path = "/"+splitpath[8]+"/"+splitpath[9]+"/"+splitpath[10];
		user.setU_image(path);
		
		request.setAttribute("user", user);

		return "myinfoView/myinfo";
	}
}
