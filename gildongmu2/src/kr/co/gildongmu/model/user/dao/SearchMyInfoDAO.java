package kr.co.gildongmu.model.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class SearchMyInfoDAO {

	@Autowired
	private SqlSession session;

	public String searchId(String u_name, String u_tel) {

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("u_name", u_name);
		map.put("u_tel", u_tel);

		String u_id = session.selectOne("searchMyInfo.selectid", map);

		return u_id;
	}

	
	public String searchPass(String u_id, String u_email) {
		
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("u_id", u_id);
			map.put("u_email", u_email);

			String u_pass = session.selectOne("searchmyinfo.selectpass", map);

		return u_pass;
	}


}
