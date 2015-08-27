package kr.co.gildongmu.controller.user.search;

import javax.servlet.http.HttpServletRequest;

import kr.co.gildongmu.model.board.dao.LocalDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// 지역불러오는 컨트롤러
@Controller
public class LocalController{
	
	@Autowired
	private LocalDAO localDAO;
	
	@RequestMapping("/gyeonggido")
	public String gyeonggido() {
		return "localView/gyeonggido";
	}
	
	@RequestMapping("/anseong")
	public String anseong() {
		return "localView/anseong";
	}
	@RequestMapping("/gapyeong")
	public String gapyeong() {
		return "localView/gapyeong";
	}
	@RequestMapping("/gwacheon")
	public String gwacheon() {
		return "localView/gwacheon";
	}
	@RequestMapping("/hwaseong")
	public String hwaseong() {
		return "localView/hwaseong";
	}
	@RequestMapping("/paju")
	public String paju() {
		return "localView/paju";
	}
	@RequestMapping("/pyeongtaek")
	public String pyeongtaek() {
		return "localView/pyeongtaek";
	}
	@RequestMapping("/seongnam")
	public String seongnam() {
		return "localView/seongnam";
	}
	@RequestMapping("/yangpyeong")
	public String yangpyeong() {
		return "localView/yangpyeong";
	}
	@RequestMapping("/yeoju")
	public String yeoju() {
		return "localView/yeoju";
	}
	@RequestMapping("/yeoncheon")
	public String yeoncheon() {
		return "localView/yeoncheon";
	}
	
	
	@RequestMapping("/localsearch")
	public String localsearch(HttpServletRequest request) {

		String name = request.getParameter("l_name");
		String l_image = localDAO.select(name);
		request.setAttribute("l_image", l_image);
		
		return "localView/local_result";
	}
}
