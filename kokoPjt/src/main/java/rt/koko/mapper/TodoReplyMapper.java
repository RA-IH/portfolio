package rt.koko.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import rt.koko.domain.Criteria;
import rt.koko.domain.TodoReplyCommand;

public interface TodoReplyMapper {
	// 댓글 등록
	public int todoReplyInsert(TodoReplyCommand reply);
	// 댓글 조회
	public TodoReplyCommand todoReplyRead(int br_seq);
	// 댓글 삭제
	public int TodoReplyDelete(int br_seq);
	// 댓글 수정
	public int TodoReplyUpdate(TodoReplyCommand reply);
	// 댓글 리스트 가져오기
	public List<TodoReplyCommand> getListWithPaging(@Param("cri") Criteria cri,
													@Param("b_seq") int b_seq);
	// 글별 댓글 총 갯수
	public int getReplyCount(int b_seq);
}
