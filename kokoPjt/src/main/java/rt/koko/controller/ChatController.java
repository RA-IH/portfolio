package rt.koko.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Chat/*")
public class ChatController {

	@RequestMapping(value = "/kokoChat")
	public void kokoChat(){
		
	}
	
	@RequestMapping(value ="/videocall")
	public void videoCall(){
		
	}

}
