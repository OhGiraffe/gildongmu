package kr.co.gildongmu.controller.user.search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 리뷰 글 보기
@Controller
public class ReviewController {

	@Autowired
	private ReviewDAO reviewDAO;

	@RequestMapping("/review")
	public String review(HttpServletRequest request) {

		String r_id = (String) request.getSession().getAttribute("result_id");
		String pageStr = request.getParameter("page");
		int page = 1; // 기본페이지
		if (pageStr != null) { // 출력하기를 원하는 페이지에 대한 정보를 얻었을때
			page = Integer.parseInt(pageStr);
		}
		int maxRecord = 10; // 한페이지에 보여줄 최대 레코드 수
		int skip = (page - 1) * maxRecord; //

		List<ReviewBean> reviewlist = reviewDAO.selectPage(skip, maxRecord);

		int totalRecord = reviewDAO.selectCnt(); // 전체 데이터개수

		int totalPage = totalRecord / maxRecord; // 전체페이지 수
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