package rt.koko.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import rt.koko.service.TodoReplyService;

@RequestMapping("/admin/")
@Controller
@Log4j
@AllArgsConstructor
public class AdminController {
	
	@RequestMapping(value = "/admin")
	public void adminPage(String p_no){
		
	}
}
