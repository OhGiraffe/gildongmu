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
public class MessageDeleteController {
	
	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping("message_delete")
	public String messageDelete(HttpServletRequest request) {
		int m_num = Integer.parseInt(request.getParameter("m_num"));
		messageDAO.deleteMessage(m_num);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("result_id");

		ArrayList<MessageBean> list = new ArrayList<MessageBean>();
		list = (ArrayList<MessageBean>) messageDAO.receiveReceiveMessage(id);
		request.setAttribute("receiveReceiveMessage", list);
		
		ArrayList<MessageBean> list2 = new ArrayList<MessageBean>();
		list2 = (ArrayList<MessageBean>) messageDAO.receiveSendMessage(id);
		request.setAttribute("receiveSendMessage", list2);
		
		return "/messageView/message";
	}

}
