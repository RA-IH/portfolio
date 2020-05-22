package rt.koko.controller;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.Setter;
import rt.koko.domain.MemberCommand;
import rt.koko.service.MypageService;

@Controller
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private MypageService service;
	
	
	@GetMapping("/")
	public String home(){
		return "home";
	}
	
	@RequestMapping(value = "/Mypage/mypage")
	public String Mypage(){
		return "/mypage/mypage";
	}
	
	
	@RequestMapping(value = "/Mypage/mypageAction")
	public String MypageAction(HttpSession session, MemberCommand editm){
		MemberCommand m = (MemberCommand) session.getAttribute("login");
		System.out.println(m.getM_password());
		System.out.println(m.getM_email());
		System.out.println("-----------");
		
		
		editm.setM_id(m.getM_id());
		editm.setM_name(m.getM_name());
		editm.setM_position(m.getM_position());
		
		
		service.EditMyPage(editm);
		
		return "/login/logout";
	}
	
}
