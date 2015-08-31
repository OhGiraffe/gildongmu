package kr.co.gildongmu.controller.user.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// ���� �� ����
@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO reviewDAO;

	@RequestMapping("/review")
	public String review(HttpServletRequest request) {

		String r_id = (String) request.getSession().getAttribute("result_id");
		String pageStr = request.getParameter("page");
		int page = 1; // �⺻������
		if (pageStr != null) { // ����ϱ⸦ ���ϴ� �������� ���� ������ �������
			page = Integer.parseInt(pageStr);
		}
		int maxRecord = 10; // ���������� ������ �ִ� ���ڵ� ��
		int skip = (page - 1) * maxRecord; //

		List<ReviewBean> reviewlist = reviewDAO.selectPage(skip, maxRecord);

		int totalRecord = reviewDAO.selectCnt(); // ��ü �����Ͱ���

		int totalPage = totalRecord / maxRecord; // ��ü������ ��
		if (totalRecord % maxRecord != 0) {
			totalPage = totalPage + 1;
		}
		List<Integer> emp = null;
		List<Integer> list = null;
		
		if(r_id != null){
			emp = (List<Integer>) reviewDAO.rewriteSelect(r_id);
		}
		
		if(emp != null){
			if(emp.size() != 0){
				list = (List<Integer>) reviewDAO.rewriteSelect(r_id);
			}
		}
		
		request.setAttribute("reviewList", reviewlist);
		request.setAttribute("list", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("page", page);

		return "reviewView/review";
	}
}