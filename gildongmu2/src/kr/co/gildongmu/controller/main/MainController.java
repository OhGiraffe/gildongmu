package kr.co.gildongmu.controller.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.main.dao.ReviewBestDAO;
import kr.co.gildongmu.model.main.dao.SearchRankDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// 관리자 메뉴에서 게시판목록 보기
@Controller
public class MainController {

	@Autowired
	private SearchRankDAO searchRankDAO;
	
	@Autowired
	private ReviewBestDAO reviewBestDAO;
	
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request) {
		List<UserBean> ranklist = searchRankDAO.select();
		UserBean temp;
		int indexMin;
		
	    for (int i = 0; i < ranklist.size() - 1; i++) {
	    	indexMin = i;
	        for (int j = i + 1; j < ranklist.size(); j++) {
	        	//참석률
	        	int BaseArating = (int)((double)ranklist.get(indexMin).getU_attend()/ (double)ranklist.get(indexMin).getU_apply() * 100);
	        	int Arating = (int)((double)ranklist.get(j).getU_attend()/ (double)ranklist.get(j).getU_apply() * 100);
	        	
				//rating = String.format("%.1f", ratingnum);
	        	//평점
				float BaseGrating = (float)ranklist.get(indexMin).getU_grade()/ (float)ranklist.get(indexMin).getU_npeople();
				float Grating = (float)ranklist.get(j).getU_grade()/ (float)ranklist.get(j).getU_npeople();
	        	
	        	if(ranklist.get(indexMin).getU_level() <= ranklist.get(j).getU_level()){
	        		if ( BaseArating < Arating && BaseGrating < Grating) {
	        			indexMin = j;
	        		}
	        	}
	        }
	        
	        temp = ranklist.get(indexMin);
	        ranklist.set(indexMin, ranklist.get(i));
	        ranklist.set(i, temp);
	        
	    }
		
		
		List<ReviewBean> reviewlist = reviewBestDAO.select();
		
		for (int i=0; i<reviewlist.size(); i++) {
			String[] splitpath = reviewlist.get(i).getR_image().split("\\\\");
			String path = "/"+splitpath[8]+"/"+splitpath[9]+"/"+splitpath[10];
			reviewlist.get(i).setR_image(path);
		}
		
		request.setAttribute("rankList", ranklist);
		request.setAttribute("reviewList", reviewlist);
		
		return "mainView/main";
	}

}
