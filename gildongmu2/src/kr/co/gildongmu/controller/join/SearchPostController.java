package kr.co.gildongmu.controller.join;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchPostController{
	
	@RequestMapping("/searchPost")
	public String join(HttpServletRequest request) {
		return "joinView/search_post";
	}
}
