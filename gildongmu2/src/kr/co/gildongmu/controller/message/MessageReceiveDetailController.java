package kr.co.gildongmu.controller.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.message.bean.MessageBean;
import kr.co.gildongmu.model.message.dao.MessageDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageReceiveDetailController {

	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping("/message_receiveDetail")
	public String messageReceiveDetail(HttpServletRequest request){
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		MessageBean message = new MessageBean();
		message = messageDAO.messageReceiveDetail(m_num);
		if (message.getM_read().equals("N")) {
			messageDAO.readMessage(m_num);
		}
		
		UserBean user = new UserBean();
		user = messageDAO.select(message.getM_sendID());
		request.setAttribute("userinfo", user);
		
		request.setAttribute("messageReceiveDetail", message);
		
		return "/messageView/messageReceiveDetail";
	}
}
