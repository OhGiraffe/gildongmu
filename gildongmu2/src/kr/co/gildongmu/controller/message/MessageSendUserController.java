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
public class MessageSendUserController {

	@Autowired
	private MessageDAO messgaeDAO;
	
	@RequestMapping("/message_sendUser")
	public String messageSendUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String m_sendID = (String) session.getAttribute("result_id");
		int m_num = 0;
		String m_receiveID = request.getParameter("m_receiveID");
		String m_message = request.getParameter("m_message");
		
		MessageBean message = new MessageBean(m_num, m_sendID, m_receiveID, m_message, "N", null);
		messgaeDAO.sendMessage(message);
		
		UserBean user = new UserBean();
		user = messgaeDAO.select(m_receiveID);
		request.setAttribute("userinfo", user);

		return "/userView/userinfo";
	}
	
	@RequestMapping("/message_sendDetailUser")
	public String messageSendDetailUser(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("result_id");
		int m_num = 0;
		String m_receiveID = request.getParameter("m_receiveID");
		String m_message = request.getParameter("m_message");
		
		MessageBean message = new MessageBean(m_num, id, m_receiveID, m_message, "N", null);
		messgaeDAO.sendMessage(message);
		
		ArrayList<MessageBean> list = new ArrayList<MessageBean>();
		list = (ArrayList<MessageBean>) messgaeDAO.receiveReceiveMessage(id);
		request.setAttribute("receiveReceiveMessage", list);
		
		ArrayList<MessageBean> list2 = new ArrayList<MessageBean>();
		list2 = (ArrayList<MessageBean>) messgaeDAO.receiveSendMessage(id);
		request.setAttribute("receiveSendMessage", list2);

		return "/messageView/message";
	}
}
