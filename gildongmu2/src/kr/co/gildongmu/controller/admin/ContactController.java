package kr.co.gildongmu.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// ������ �޴����� �Խ��Ǹ�� ����
@Controller
public class ContactController{
	
	@RequestMapping("/contact")
	public String contact() {
		return "adminView/contact";
	}
}

