package kr.co.gildongmu.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// ������ �޴����� �Խ��Ǹ�� ����
@Controller
public class FaqController{
	
	@RequestMapping("/faq")
	public String faq() {
		return "adminView/faq";
	}
}

