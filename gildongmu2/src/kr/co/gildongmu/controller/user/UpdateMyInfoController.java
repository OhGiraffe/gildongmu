package kr.co.gildongmu.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.user.dao.MyInfoDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 내정보 수정 컨트롤러
@Controller
public class UpdateMyInfoController{
	
	@Autowired
	private MyInfoDAO myInfoDAO;
	
	@RequestMapping("/myinfoupdate")
	public String myInfo(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("result_id");
		String pass = request.getParameter("pass");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		
		
		UserBean user = new UserBean(id, pass, age, tel, email);
		myInfoDAO.update(user);
			
		//user = myInfoDAO.select(id);
		//request.setAttribute("user", user);
		
		return "redirect:myinfo";
	}
}
