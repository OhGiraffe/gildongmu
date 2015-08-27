package kr.co.gildongmu.controller.user.write;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.application.dao.StatusDAO;
import kr.co.gildongmu.model.board.dao.BoardDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardDeleteController{
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private StatusDAO statusDAO;
	
	@RequestMapping("/delete_b")
	public String delete_b(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("euc-kr");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int num = Integer.parseInt(request.getParameter("b_num"));
		String posturl = request.getParameter("posturl");	
		String url[] = posturl.split("\\/");
		String url2[]= url[4].split("\\?");

		statusDAO.delete(num);

		boardDAO.delete(num);
		

		if(url[4].equals("thema")){
			return "redirect:thema";
		}
		else if(url[4].equals("schedule")){
			return "redirect:schedule";
		}
//		else if(url[4].equals("adminboard")){
//			return "adminView/adminboard";
//		}
		else if(url2[0].equals("localboard")){
			return "redirect:gyeonggido";
		}
//		else if(url2[0].equals("mylist")){
//			return "localView/gyeonggido";
//		}
		return "redirect:main";
	}
}
