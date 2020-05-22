package rt.koko.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.MemberCommand;
import rt.koko.domain.MemberVO;
import rt.koko.service.MemberService;

@Controller
@Log4j
@SessionAttributes("login")
@RequestMapping("/login/*")
@AllArgsConstructor
public class CommonContoller {
	
	private MemberService service;
	
	// main2 이동
	@RequestMapping(value = "/main2", method = {RequestMethod.GET})
	public void main(){
		//return "/login/main2";
	}
	
	// 로그인 액션
	@RequestMapping(value = "/loginAction", method = {RequestMethod.GET})
	public String loginRead(HttpServletRequest request) {
		System.out.println("loginRead controller");
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User user = (User) authentication.getPrincipal(); 
	    String m_id =user.getUsername();
	    String password = service.loginRead(m_id);
	    	   
		HttpSession session = request.getSession();

		MemberCommand loginInfo = service.memberRead(m_id);
		loginInfo.setM_password(password);
		session.setAttribute("login", loginInfo);
		service.projectRead(m_id, session);
		
	    return "/login/main2";
	}

	
	@RequestMapping(value = "/logout")
	public void logout(){

	}
	
}
