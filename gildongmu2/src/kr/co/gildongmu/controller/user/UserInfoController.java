package kr.co.gildongmu.controller.user;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.user.dao.SearchUserInfoDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserInfoController{
	
	@Autowired
	private SearchUserInfoDAO searchUserInfoDAO;
	
	@RequestMapping("/userinfo")
	public String userinfo(HttpServletRequest request, @RequestParam(value="u_id") String u_id) {
		
		UserBean userinfo = searchUserInfoDAO.searchInfo(u_id);
		request.setAttribute("userinfo", userinfo);
		return "userView/userinfo";
	}

	@RequestMapping("/userinfodetail")
	public String userinfodetail(HttpServletRequest request, @RequestParam(value="u_id") String u_id) {
		
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String id = request.getParameter("u_id");
		
		UserBean user = new UserBean();
		user = searchUserInfoDAO.searchInfo(id);
		request.setAttribute("userinfodetail", user);
		
		return "userView/userinfodetail";
	}
}
