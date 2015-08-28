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
// 내 아이디 찾기 컨트롤러
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
		int page = 1; // 기본페이지
		if (pageStr != null) { // 출력하기를 원하는 페이지에 대한 정보를 얻었을때
			page = Integer.parseInt(pageStr);
		}
		int maxRecord = 10; // 한페이지에 보여줄 최대 레코드 수
		int skip = (page - 1) * maxRecord; //

		List<ReviewBean> list = reviewDAO.search(keyword, skip, maxRecord);

		int totalRecord = reviewDAO.selectCnt(); // 전체 데이터개수

		int totalPage = totalRecord / maxRecord; // 전체페이지 수
		if (totalRecord % maxRecord != 0) {
			totalPage = totalPage + 1;
		}
		request.setAttribute("reviewList", list);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("page", page);


		return "reviewView/review";
	}
}
