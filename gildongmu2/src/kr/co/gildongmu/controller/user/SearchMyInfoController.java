package kr.co.gildongmu.controller.user;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.user.dao.SearchMyInfoDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
// 내 아이디 찾기 컨트롤러
@Controller
public class SearchMyInfoController{
	
	@Autowired
	private SearchMyInfoDAO searchMyInfoDAO;
	
	@RequestMapping("/searchmyid")
	public String searchMyId(HttpServletRequest request) {
		return "loginView/searchmyid";
	}
	
	@RequestMapping("/searchmypass")
	public String join(HttpServletRequest request) {
		return "loginView/searchmypass";
	}
	
	@RequestMapping("/searchidresult")
	public String searchIdResult(HttpServletRequest request, 
						@RequestParam(value="u_name") String u_name,
						@RequestParam(value="u_tel") String u_tel) {
			
		String u_id = searchMyInfoDAO.searchId(u_name, u_tel);
		
		request.setAttribute("u_id", u_id);
		
		return "loginView/searchidresult";
	}

	@RequestMapping("/searchpassresult")
	public String searchPassResult(HttpServletRequest request, 
						@RequestParam(value="u_id") String u_id,
						@RequestParam(value="u_email") String u_email) {
			
		String u_pass = searchMyInfoDAO.searchId(u_id, u_email);
		
		request.setAttribute("u_pass", u_pass);
		
		return "loginView/searchpassresult";
	}
}
