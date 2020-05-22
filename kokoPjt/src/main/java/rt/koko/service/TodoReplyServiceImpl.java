package rt.koko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.Criteria;
import rt.koko.domain.ReplyPageCommand;
import rt.koko.domain.TodoReplyCommand;
import rt.koko.mapper.TodoReplyMapper;

@Service
@Log4j
public class TodoReplyServiceImpl implements TodoReplyService{
	
	@Setter(onMethod_ = {@Autowired})
	private TodoReplyMapper mapper;

	@Override
	public int todoReplyInsert(TodoReplyCommand reply) {
		log.info("reply insert...");
		return mapper.todoReplyInsert(reply);
	}

	@Override
	public TodoReplyCommand todoReplyRead(int br_seq) {
		log.info("reply read...");
		return mapper.todoReplyRead(br_seq);
	}

	@Override
	public int todoReplyDelete(int br_seq) {
		log.info("reply delete...");
		return mapper.TodoReplyDelete(br_seq);
	}

	@Override
	public int todoReplyUpdate(TodoReplyCommand reply) {
		log.info("reply update...");
		return mapper.TodoReplyUpdate(reply);
	}

	@Override
	public List<TodoReplyCommand> getListWithPaging(Criteria cri, int b_seq) {
		log.info("reply List read..." + b_seq);
		return mapper.getListWithPaging(cri, b_seq);
	}

	@Override
	public ReplyPageCommand getListPage(Criteria cri, int b_seq) {
		log.info("get List Page...");
		return new ReplyPageCommand(mapper.getReplyCount(b_seq),
				mapper.getListWithPaging(cri, b_seq));
	}
	
	
	
}
