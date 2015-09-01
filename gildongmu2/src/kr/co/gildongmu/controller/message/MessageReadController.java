package kr.co.gildongmu.controller.message;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.message.dao.MessageDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageReadController {

	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping("/message_read")
	public String messageRead(HttpServletRequest request) {
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		messageDAO.readMessage(m_num);
		
		return"/messageView/message";
	}
}
