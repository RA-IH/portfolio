package rt.koko.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.CalendarVO;
import rt.koko.service.CalendarService;

@Controller
@RequestMapping("/calendar/*")
@Log4j
@AllArgsConstructor
public class CalendarController {
	
	private CalendarService service;

	@GetMapping("/Calendarindex")
	public String Calendarindex() {
		log.info("calendar index");
		
		return "Calendarindex";
	}
	
/*	@GetMapping("/calendar")
	public String Calendarindex() {
		log.info("calendar");
		
		return "calendar";
	}*/
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		
		model.addAttribute("list", service.getList());
	}
	
	@PostMapping("/register")
	public String register(CalendarVO calendar, RedirectAttributes rttr) {
		
		log.info("register: " + calendar);
		
		service.register(calendar);
		
		rttr.addFlashAttribute("result", calendar.getCA_SEQ());
		
		return "redirect:/calendar/list";
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("CA_SEQ") int CA_SEQ, Model model) {
		
		log.info("/get");
		model.addAttribute("calendar", service.get(CA_SEQ));
	}
	
	
}
