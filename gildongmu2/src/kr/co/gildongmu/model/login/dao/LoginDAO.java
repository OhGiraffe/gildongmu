package kr.co.gildongmu.model.login.dao;

import java.util.HashMap;

import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class LoginDAO {
	
	@Autowired
	private SqlSession session;


	public HashMap<String, String> login(String id, String pass) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pass", pass);

		UserBean user = (UserBean) session.selectOne("login.idpass", map);

		HashMap<String, String> result_map = new HashMap<String, String>();
		
		if(user == null){
			result_map.put("id", null);
			result_map.put("check", "f");
			result_map.put("name", null);
		}
		else if (id.equals(user.getU_id())) {
			result_map.put("id", user.getU_id());
			result_map.put("check", "t");
			result_map.put("name", user.getU_name());
		}
		
		return result_map;
	}
}
