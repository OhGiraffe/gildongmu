package kr.co.gildongmu.controller.admin;

import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.gildongmu.model.admin.dao.AdminDAO;
import kr.co.gildongmu.model.board.bean.BoardBean;

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
