package kr.co.gildongmu.controller.user.write;


import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.board.bean.BoardBean;
import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.board.bean.ReviewReplyBean;
import kr.co.gildongmu.model.board.dao.ReviewDAO;
import kr.co.gildongmu.model.board.dao.ReviewReplyDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
// ¸®ºä ¾²±â
@Controller
public class ReviewWriteController{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;
	
	@RequestMapping("/write_review")
	public String write_review() {
		return "reviewView/write_review";
	}
	
	@RequestMapping("/write_r")
	public String write_r(HttpServletRequest request) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		
		
		int maxSize = 1024 * 1024 * 5;
		String savePath = request.getSession().getServletContext().getRealPath("reviewimg");
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		MultipartFile file = multi.getFile("r_image");
		String filename = file.getOriginalFilename();
		
		String id = (String) session.getAttribute("result_id");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String img_fileFullPath = savePath + "\\" + filename;
		
		ReviewBean bean = new ReviewBean(0, id, title, content, null , 0, img_fileFullPath);
		
		reviewDAO.insert(bean);
		ReviewBean reviewbean = reviewDAO.select(bean.getR_num());
		
		List<ReviewReplyBean> replyList = reviewReplyDAO.selectAll(bean.getR_num());
		
		request.setAttribute("reviewBean", reviewbean);
		request.setAttribute("replyList", replyList);
		
		return "reviewView/view_review";
	}
}