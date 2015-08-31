package kr.co.gildongmu.model.application.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import kr.co.gildongmu.model.application.bean.StatusBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

// LocalDAO
public class StatusDAO {

	@Autowired
	private SqlSession session;

	public void insert(int num, String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("id", id);
		session.insert("status.insert", map);
	}// select

	public List<StatusBean> select(int num) {

		List<StatusBean> list = session.selectList("status.select", num);

		return list;
	}

	public void incruitUpdate(int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("status", "모집완료");
		session.update("status.update", map);
	}

	public void readyUpdate(int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("status", "준비완료");
		session.update("status.update", map);
	}

	public void tourUpdate(int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("status", "여행완료");
		session.update("status.update", map);
	}

	public void applyChange(int num, String[] id) {
		ArrayList<String> idList = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			idList.add(id[i]);
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("idlist", idList);
		map.put("t", "T");
		map.put("f", "F");

		session.update("status.applyTUpdate", map);
		session.update("status.applyFUpdate", map);
	}

	public void attendChange(int num, String[] id) {
		ArrayList<String> idList = new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			idList.add(id[i]);
		}

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("idlist", idList);
		map.put("t", "T");
		map.put("f", "F");
		map.put("n", "N");

		session.update("status.attendTUpdate", map);
		session.update("status.attendFUpdate", map);
	}

	public void attendChangeNull(int num) { // ID가 아무것도 없다!!!
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("t", "T");
		map.put("f", "F");
		map.put("n", "N");

		session.update("status.attendFUpdateNull", map);
	}

	public void userApplyAttend(int num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		map.put("t", "T");
		map.put("f", "F");
		map.put("n", "N");

		session.update("status.userApply", map);
		session.update("status.userAttend", map);
	}

	public void delete(int num) {
		session.delete("status.delete", num);
	}// select
}
