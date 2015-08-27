package kr.co.gildongmu.controller.join;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.join.dao.JoinDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IdcheckController{
	
	@Autowired
	private JoinDAO joinDAO; 
	
	@RequestMapping("/idcheck")
	public String idcheck(HttpServletRequest request,
						@RequestParam(value="write_id") String w_id) {
		
		int result = 0;
		
		result = joinDAO.idcheck(w_id);	

		request.setAttribute("result", result);
		
		return "joinView/idcheck";
	}
}
