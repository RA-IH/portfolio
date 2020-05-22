package rt.koko.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import rt.koko.domain.BoardFileCommand;
import rt.koko.domain.Criteria;
import rt.koko.domain.ProjectCommand;
import rt.koko.domain.TodoBoardCommand;

public interface TodoBoardService {
	
	public ProjectCommand projectGet(String p_no);
	
	// 게시글 읽기
	//public List<TodoBoardCommand> todoBoardListRead(String p_no);
	public List<TodoBoardCommand> todoBoardListRead(Criteria cri);
	//public List<TodoBoardCommand> getListWithPaging(Criteria cri);
	// 게시글 세부사항
	public TodoBoardCommand todoBoardDetail(int b_seq);
	// 게시글 등록
	public void todoBoardInsert(TodoBoardCommand board);
	public void todoBoardInsertSelectKey(TodoBoardCommand board);
	// 게시글 수정
	public boolean todoBoardUpdate(TodoBoardCommand board);
	// 게시글 삭제
	public boolean todoBoardDelete(int b_seq);
	// 전체 게시글 수
	public int getTotal(String p_no);
	
	public List<BoardFileCommand> getFileList(int b_seq);
//	public void deleteBoardFile(int b_seq);
	// 글 작성 권한 확인
	public String authorityCheck(String m_id, String p_no);
	
	// 관리자 권한 확인
	public boolean adminAuthorityCheck(String m_id, String p_no);
	
	// 타입별 글 갯수
	public int boardTypeCount(String b_type, String p_no);
	// 타입별 게시글 불러오기
	public List<TodoBoardCommand> todoBoardTypeSort(Criteria cri, String b_type);
	
}
