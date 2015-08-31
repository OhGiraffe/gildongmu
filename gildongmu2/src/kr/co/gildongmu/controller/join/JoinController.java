package kr.co.gildongmu.controller.join;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.join.dao.JoinDAO;
import kr.co.gildongmu.model.login.bean.UserBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class JoinController{
	
	@Autowired
	private JoinDAO joinDAO; 
	
	@RequestMapping("/join")
	public String join(HttpServletRequest request) {
		return "joinView/join";
	}
	
	@RequestMapping("/joinAction")
	public String joinAction(HttpServletRequest request) {
		
		int maxSize = 1024 * 1024 * 5;
		String savePath = request.getSession().getServletContext().getRealPath("userimg");
		
		MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;
		
		MultipartFile file = multi.getFile("u_image");
		String filename = file.getOriginalFilename();
		
		String id = multi.getParameter("write_id");
		String pass = multi.getParameter("u_pass1");
		String name = multi.getParameter("u_name");
		int age = Integer.parseInt(multi.getParameter("u_age"));
		String gen = multi.getParameter("u_gen");
		String email = multi.getParameter("u_email");
		String zipcode1 = multi.getParameter("u_zipcode1");
		String zipcode2 = multi.getParameter("u_zipcode2");
		String zipcode = zipcode1 + "-" + zipcode2;
		String addr = multi.getParameter("u_addr");
		String tel = multi.getParameter("u_tel");
		
		String realFileNm = "";
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String today = formatter.format(new java.util.Date());
        realFileNm = today + UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
        String m_fileFullPath = savePath + "\\" + realFileNm;

		File inputfile = new File(m_fileFullPath);
		try {
			file.transferTo(inputfile);
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UserBean user = new UserBean(id, name, pass, m_fileFullPath, age, gen, zipcode, addr, tel, email, 0, 0, 0, 0);
		joinDAO.insert(user);
		
		request.setAttribute("u_name", name);
		
		return "joinView/join_result";
	}

}
