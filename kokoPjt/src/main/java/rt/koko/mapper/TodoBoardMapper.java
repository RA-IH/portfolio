package rt.koko.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import rt.koko.domain.Criteria;
import rt.koko.domain.ProjectCommand;
import rt.koko.domain.TodoBoardCommand;

public interface TodoBoardMapper {
	
///////////////////////////// Board /////////////////////////////
	// project List
	public ProjectCommand projectGet(String p_no);
	// 게시글 페이징처리 리스트
	public List<TodoBoardCommand> getListWithPaging(Criteria cri);
		
	// todoBoard 세부사항
	public TodoBoardCommand todoBoardDetail(int b_seq);
	// todoBoardList 읽기
	public List<TodoBoardCommand> todoBoardListRead(String p_no);
	// 게시글 추가
	public void todoBoardInsert(TodoBoardCommand board);
	public void todoBoardInsertSelectKey(TodoBoardCommand board);
	// 게시글 삭제
	public int todoBoardDelete(int b_seq);
	// 게시글 수정
	public int todoBoardUpdate(TodoBoardCommand board);
	
	// 전체 게시글 수
	public int getTotalCount(String p_no);
	// 타입별 글 갯수
	public int boardTypeCount(@Param("b_type") String b_type, @Param("p_no") String p_no);
	// 타입별 게시글 불러오기
	public List<TodoBoardCommand> todoBoardTypeSort(@Param("cri") Criteria cri,
													@Param("b_type") String b_type);
	
}
