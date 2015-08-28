package kr.co.gildongmu.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.admin.dao.AdminDAO;
import kr.co.gildongmu.model.board.bean.BoardBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NocticeController {

	@Autowired
	private AdminDAO adminDAO;

	@RequestMapping("/notice")
	public String searchIdResult(HttpServletRequest request) {

		String id = "admin";
		
		List<BoardBean> list = adminDAO.noticeList(id);

		request.setAttribute("noticeList", list);

		return "adminView/notice";
	}
}
