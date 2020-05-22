package rt.koko.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.AddressBookPage;
import rt.koko.domain.AddressBookPageCommand;
import rt.koko.domain.AddressBookVO;
import rt.koko.service.AddressBookService;

@Controller
@Log4j
@RequestMapping("/addressbook/*")
@AllArgsConstructor
public class AddressBookController {

	@Setter(onMethod_ = @Autowired)
	private AddressBookService service;

//연락처 전체목록
/*@GetMapping("/list")
public String AddressBookList(Model model){
	log.info("연락처 전체목록 입니당.");
	log.info("연락처 페이징 입니당.");
	model.addAttribute("list",service.AddressBookList());
	return "addressbook/list";
}*/
	
//연락처 전체목록 
@GetMapping("/list")
	public void AddressBookList(AddressBookPage page,Model model){
		log.info("연락처 전체목록 입니당.");
		log.info("연락처 페이징 입니당:" + page);
		model.addAttribute("list",service.AddressBookListwithPaging(page));
		int total = service.TotalCount(page);
		System.out.println("전체 글 갯수" + total);
		model.addAttribute("pageMaker", new AddressBookPageCommand(page, total));
	
	}
	

@GetMapping(value = "/listJson", produces = MediaType.APPLICATION_JSON_VALUE)
@ResponseBody
public List<AddressBookVO> addressBookListJson() {
		
	return service.AddressBookList();
}


//연락처 등록
@RequestMapping(value="/insert" , method = {RequestMethod.POST})
public String AddressBookInsert(AddressBookVO address, @RequestParam("post") String post, @RequestParam("roadAddress") String roadAddress, @RequestParam("jibunAddress") String jibunAddress, @RequestParam("m_id") String m_id){
	log.info("연락처 등록입니당.");
	String juso = post + roadAddress + jibunAddress;
	System.out.println("GROUP : " + address.getAd_group());
	address.setM_id(m_id);
	System.out.println("아이디가" +  address.getM_id() + "이다.");
	address.setAd_address(juso);
	System.out.println("EMAIL : " + address.getAd_email());
	System.out.println(address.getAd_address());
	System.out.println(address.getAd_regdate());
	
	service.AddressBookInsert(address);
	
	return "redirect:/addressbook/list";
}

//연락처 세부목록
@GetMapping(value = "/detail/{ad_seq}",

produces = {
	MediaType.APPLICATION_XML_VALUE,
	MediaType.APPLICATION_JSON_UTF8_VALUE})

public ResponseEntity<AddressBookVO> AddressBookDetail(
		@PathVariable("ad_seq") Long ad_seq){
	log.info("연락처 세부목록 입니다.");

	return new ResponseEntity<>(service.AddressBookDetail(ad_seq), HttpStatus.OK);
}


//연락처 수정
	@RequestMapping(method = { RequestMethod.PUT,	RequestMethod.PATCH, RequestMethod.POST }, 
			value = "/update/{ad_seq}", 
			consumes = "application/json", 
			produces = { MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<String> update(@RequestBody AddressBookVO address, @PathVariable("ad_seq") Long ad_seq) {
		log.info("연락처 수정하기로 왔습니당");
		
	

		log.info("ad_seq는" + ad_seq);
		address.setAd_seq(ad_seq);

		//address.setAd_regdate(todaydate);
		//address.setAd_updatedate(todaydate);
		log.info("update" + address);
			
					return service.AddressBookUpdate(address) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
//연락처 삭제
@DeleteMapping(
		value = "/delete/{ad_seq}" , produces = {MediaType.TEXT_PLAIN_VALUE})
public ResponseEntity<String> delete(@PathVariable("ad_seq") Long ad_seq){
	log.info("delete:" + ad_seq);
			
	return service.AddressBookDelete(ad_seq) == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
}
}
