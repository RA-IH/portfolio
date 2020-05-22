package rt.koko.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import rt.koko.domain.Criteria;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.ReplyPageCommand;
import rt.koko.domain.TodoReplyCommand;
import rt.koko.service.TodoReplyService;

@RequestMapping("/replies/")
@RestController
@Log4j
@AllArgsConstructor
public class TodoReplyController {
	
	private TodoReplyService service;
	
	// 등록
	@PostMapping(value = "/insert", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> insert(@RequestBody TodoReplyCommand reply) {

		log.info("TodoReplyCommand: " + reply);

		int insertCount = service.todoReplyInsert(reply);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value = "/{br_seq}", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<TodoReplyCommand> detail(@PathVariable("br_seq") int br_seq) {

		log.info("reply detail: " + br_seq);

		return new ResponseEntity<>(service.todoReplyRead(br_seq), HttpStatus.OK);
	}
	
	// 리스트 조회
	@GetMapping(value = "/pages/{b_seq}/{page}", 
			produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReplyPageCommand> getList(@PathVariable("page") int page, @PathVariable("b_seq") int b_seq) {

		Criteria cri = new Criteria(page, 10);
		
		log.info("get Reply List bno: " + b_seq);

		log.info("cri:" + cri);
		ReplyPageCommand replyC = service.getListPage(cri, b_seq);
		System.out.println(replyC);

		return new ResponseEntity<>(replyC, HttpStatus.OK);
	}
	
	// 수정
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/{br_seq}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> update(@RequestBody TodoReplyCommand reply, @PathVariable("br_seq") int br_seq) {

		reply.setBr_seq(br_seq);

		log.info("br_seq: " + br_seq);
		log.info("reply: " + reply);

		return service.todoReplyUpdate(reply) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);

	}
	
	// 삭제
	@DeleteMapping(value = "/{br_seq}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("br_seq") int br_seq) {

		log.info("reply delete: " + br_seq);
		int count = service.todoReplyDelete(br_seq);
		log.info(count);

		return count == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}
