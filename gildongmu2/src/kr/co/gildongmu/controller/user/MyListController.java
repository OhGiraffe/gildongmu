package kr.co.gildongmu.controller.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.user.dao.MyListDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 내가 쓴글 보기
@Controller
public class MyListController {

	@Autowired
	private MyListDAO mylistDAO;

	@RequestMapping("/mylist")
	public String searchIdResult(HttpServletRequest request) {

		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("result_id");
		List<BoardBean> list = mylistDAO.selectAll(id);
		request.setAttribute("mylist", list);

		return "myinfoView/mylist";
	}

}
