package kr.co.gildongmu.controller.join;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.join.dao.JoinDAO;
import kr.co.gildongmu.model.login.bean.UserBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class SearchPostController{
	
	@RequestMapping("/searchPost")
	public String join(HttpServletRequest request) {
		return "joinView/search_post";
	}
}
