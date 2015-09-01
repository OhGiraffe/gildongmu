package kr.co.gildongmu.controller.message;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.message.bean.MessageBean;
import kr.co.gildongmu.model.message.dao.MessageDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageSendController {

	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping("/message_send")
	public String messageSend(HttpServletRequest request){
		HttpSession session = request.getSession();
		String m_sendID = (String) session.getAttribute("result_id");
		int m_num = 0;
		String m_receiveID = request.getParameter("m_receiveID");
		String m_message = request.getParameter("m_message");
		MessageBean message = new MessageBean(m_num, m_sendID, m_receiveID, m_message, "N", null);
		messageDAO.sendMessage(message);
		
		ArrayList<MessageBean> list = new ArrayList<MessageBean>();
		list = (ArrayList<MessageBean>) messageDAO.receiveReceiveMessage(m_sendID);
		request.setAttribute("receiveReceiveMessage", list);
		
		ArrayList<MessageBean> list2 = new ArrayList<MessageBean>();
		list2 = (ArrayList<MessageBean>) messageDAO.receiveSendMessage(m_sendID);
		request.setAttribute("receiveSendMessage", list2);
		
		return "/messageView/message";
	}
}
