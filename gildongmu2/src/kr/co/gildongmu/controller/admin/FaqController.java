package kr.co.gildongmu.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 관리자 메뉴에서 게시판목록 보기
@Controller
public class FaqController{
	
	@RequestMapping("/faq")
	public String faq() {
		return "adminView/faq";
	}
}

