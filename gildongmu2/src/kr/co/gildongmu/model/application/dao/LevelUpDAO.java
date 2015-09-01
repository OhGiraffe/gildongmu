package kr.co.gildongmu.model.application.dao;

import java.util.HashMap;

import kr.co.gildongmu.model.login.bean.UserBean;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

// LocalDAO
public class LevelUpDAO {

	@Autowired
	private SqlSession session;

	public UserBean select(String id) {
		return session.selectOne("levelUp.select", id);
	}

	public void levelUp(UserBean userbean) {
		HashMap<String, Object> map = new HashMap<String, Object>();
				
		int rating = (int)((double)userbean.getU_attend()/ (double)userbean.getU_apply() * 100);
		if(rating >= 80){
			if(userbean.getU_grade() >= 50 && userbean.getU_attend() >= 10 && userbean.getU_level() != 2){
				map.put("id", userbean.getU_id());
				map.put("level", 2);
				session.update("levelUp.update", map);
			}
			else if(userbean.getU_grade() >= 100 && userbean.getU_attend() >= 20 && userbean.getU_level() != 3){
				map.put("id", userbean.getU_id());
				map.put("level", 3);
				session.update("levelUp.update", map);
			}
			else if(userbean.getU_grade() >= 150 && userbean.getU_attend() >= 30 && userbean.getU_level() != 4){
				map.put("id", userbean.getU_id());
				map.put("level", 4);
				session.update("levelUp.update", map);
			}
			else if(userbean.getU_grade() >= 200 && userbean.getU_attend() >= 40 && userbean.getU_level() != 5){
				map.put("id", userbean.getU_id());
				map.put("level", 5);
				session.update("levelUp.update", map);
			}
		}
		
	}// select
}
