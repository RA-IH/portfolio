package rt.koko.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import rt.koko.domain.Criteria;
import rt.koko.domain.ReplyPageCommand;
import rt.koko.domain.TodoReplyCommand;

public interface TodoReplyService {
	// 댓글 등록
	public int todoReplyInsert(TodoReplyCommand reply);
	// 특정 댓글 조회
	public TodoReplyCommand todoReplyRead(int br_seq);
	// 댓글 삭제
	public int todoReplyDelete(int br_seq);
	// 댓글 수정
	public int todoReplyUpdate(TodoReplyCommand reply);
	// 댓글 리스트 가져오기
	public List<TodoReplyCommand> getListWithPaging(Criteria cri, int b_seq);
	// 글별 댓글 총 개수
	public ReplyPageCommand getListPage(Criteria cri, int b_seq);
	
}
