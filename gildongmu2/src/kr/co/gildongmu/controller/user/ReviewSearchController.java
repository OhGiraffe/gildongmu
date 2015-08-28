package kr.co.gildongmu.controller.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;
import kr.co.gildongmu.model.user.dao.SearchMyInfoDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
// �� ���̵� ã�� ��Ʈ�ѷ�
@Controller
public class ReviewSearchController{
	
	@Autowired
	private ReviewDAO reviewDAO;

	@RequestMapping("/reviewsearch")
	public String searchPassResult(HttpServletRequest request) {
		
	    String keyword = request.getParameter("keyword");
	    System.out.println(keyword);
	    keyword = "%"+keyword+"%";
	    
	    String pageStr = request.getParameter("page");
		int page = 1; // �⺻������
		if (pageStr != null) { // ����ϱ⸦ ���ϴ� �������� ���� ������ �������
			page = Integer.parseInt(pageStr);
		}
		int maxRecord = 10; // ���������� ������ �ִ� ���ڵ� ��
		int skip = (page - 1) * maxRecord; //

		List<ReviewBean> list = reviewDAO.search(keyword, skip, maxRecord);

		int totalRecord = reviewDAO.selectCnt(); // ��ü �����Ͱ���

		int totalPage = totalRecord / maxRecord; // ��ü������ ��
		if (totalRecord % maxRecord != 0) {
			totalPage = totalPage + 1;
		}
		request.setAttribute("reviewList", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("page", page);


		return "reviewView/review";
	}
}
