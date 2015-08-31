package kr.co.gildongmu.controller.login;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.gildongmu.model.login.dao.LoginDAO;
import kr.co.gildongmu.model.login.dao.LoginManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// �α��� ��Ʈ�ѷ�
@Controller
public class LoginController{
	
	@Autowired
	private LoginDAO loginDAO;
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request, 
						@RequestParam(value="id") String id,
						@RequestParam(value="pass") String pass) {

		LoginManager loginManager = LoginManager.getInstance();
		HttpSession session = request.getSession();
		HashMap<String, String> result_map = new HashMap<String, String>();
		result_map = loginDAO.login(id, pass);

		String mapId = result_map.get("id");
		String mapName = result_map.get("name");
		String mapCheck = result_map.get("check");
		
		if (mapId != null && mapCheck.equals("t")) { 
			//�α��� ����
			if (!loginManager.isUsing(mapId)) {
				loginManager.setSession(session, mapId);
				request.getSession().setAttribute("result_id", mapId);
				request.getSession().setAttribute("result_name", mapName);
				request.getSession().setAttribute("result_check", mapCheck);
			} 
			//�α��� �Ǿ�����
			else {
				request.setAttribute("result_check", "i");
			}
			
		//���̵� ��� Ʋ��
		} else if(mapId == null && mapCheck.equals("f")){
			request.setAttribute("result_check", mapCheck);
		}

		return "loginView/login_result";
	}
	
	@RequestMapping("/kill_login")
	public String kill_login(HttpServletRequest request,
						@RequestParam(value="id") String id,
						@RequestParam(value="pass") String pass) {

		LoginManager loginManager = LoginManager.getInstance();
		HttpSession session = request.getSession();
		HttpServletResponse res = null;

		HashMap<String, String> result_map = new HashMap<String, String>();
		result_map = loginDAO.login(id, pass);

		String mapId = result_map.get("id");
		String mapName = result_map.get("name");
		String mapCheck = result_map.get("check");
		
		if (mapId != null && mapCheck.equals("t")) { 
			loginManager.removeSession(id);
			loginManager.setSession(session, mapId);
			request.getSession().setAttribute("result_id", mapId);
			request.getSession().setAttribute("result_name", mapName);
			request.getSession().setAttribute("result_check", mapCheck);
		//���̵� ��� Ʋ��
		} else if(mapId == null && mapCheck.equals("f")){
			request.setAttribute("result_check", mapCheck);
		}

		return "loginView/login_result";
	}
}
