package kr.co.gildongmu.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// �α��� ��Ʈ�ѷ�
@Controller
public class LogoutController{
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		
//		String check = request.getParameter("dup");
		HttpSession session = request.getSession();
//		if(check != null && check.equals("t")){
//			LoginManager loginManager = LoginManager.getInstance();
//			String id = (String) session.getAttribute("result_id");
//			System.out.println(id);
//			loginManager.removeSession(id);
//			loginManager.setSession(session, id);
//			System.out.println("�Ϸ�");
//	        response.sendRedirect("login.do");
//	        
//		}else{
			session.invalidate();
//		}

		return "redirect:main";
	}

}
