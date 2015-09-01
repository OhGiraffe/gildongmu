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
public class MessageAlarmController {
	
	@Autowired
	private MessageDAO messageDAO;
	
	@RequestMapping("/message_alarm")
	public String messageAlarm(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("result_id");
		ArrayList<MessageBean> list = new ArrayList<MessageBean>();
		list = (ArrayList<MessageBean>) messageDAO.receiveReceiveMessage(id);
		request.setAttribute("alarmMessage", list);
		
		return "mainView/main";
	}

}
