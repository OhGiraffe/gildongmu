package kr.co.gildongmu.controller.user.write;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
public class ReviewModifyController{
	
	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private ReviewReplyDAO reviewReplyDAO;

	
	@RequestMapping("/modify_r")
	public String modify_r(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		int maxSize = 1024 * 1024 * 5;
		String savePath = request.getSession().getServletContext().getRealPath("reviewimg");
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		MultipartFile file = multi.getFile("r_image");
		String filename = file.getOriginalFilename();
		
		String id = (String) session.getAttribute("result_id");
		int r_num = Integer.parseInt(request.getParameter("num"));
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		String realFileNm = "";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new java.util.Date());
        realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
        String img_fileFullPath = savePath + "\\" + realFileNm;

		File inputfile = new File(img_fileFullPath);
		try {
			file.transferTo(inputfile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		ReviewBean bean = new ReviewBean(r_num, title, content, img_fileFullPath);
		reviewDAO.modify(bean);
		
		ReviewBean reivewbean = reviewDAO.select(r_num);
		
		reviewDAO.count(r_num);
	
		List<ReviewReplyBean> replyList = reviewReplyDAO.selectAll(r_num);
		
		request.setAttribute("reviewBean", reivewbean);
		request.setAttribute("replyList", replyList);

		return "reviewView/view_review";
	}
}