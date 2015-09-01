package kr.co.gildongmu.model.message.dao;

import java.nio.channels.SeekableByteChannel;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.gildongmu.model.board.bean.ReviewBean;
import kr.co.gildongmu.model.login.bean.UserBean;
import kr.co.gildongmu.model.message.bean.MessageBean;


public class MessageDAO {
	@Autowired
	private SqlSession session;
	
	public MessageDAO() {
			
	}
	
	// ���� ������
	public int sendMessage(MessageBean message) {
		return session.insert("message.sendMessage", message);	
	 }
	
	// �������� ��������
	public List<MessageBean> receiveReceiveMessage(String id) {
		List<MessageBean> list = session.selectList("message.receiveReceiveMessage", id);
	    return list;	
	 }
	
	// �������� ��������
	public List<MessageBean> receiveSendMessage(String id) {
		List<MessageBean> list = session.selectList("message.receiveSendMessage", id);
	    return list;	
	 }
	
	// ���� ����
	public boolean deleteMessage(int m_num) {
		int t = session.delete("message.deleteMessage", m_num);
		if (t > 0)
			return true;
		return false;
	 }
	 
	 // ���� �б�üũ
	 public void readMessage(int m_num) {
		 session.update("message.readMessage", m_num);
			
	}
	 
	 // ����
	 public UserBean select(String id) {
		 UserBean user = new UserBean();
		 user = session.selectOne("message.select",id);
		 return user;	
	}
	 
	 // �������� �б�
	 public MessageBean messageReceiveDetail(int m_num) {
		 MessageBean message = new MessageBean();
		 message = session.selectOne("message.messageReceiveDetail",m_num);
		 return message;	
	}
}
