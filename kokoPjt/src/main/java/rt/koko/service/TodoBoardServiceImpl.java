package rt.koko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.AuthorityCommand;
import rt.koko.domain.BoardFileCommand;
import rt.koko.domain.Criteria;
import rt.koko.domain.ProjectCommand;
import rt.koko.domain.TodoBoardCommand;
import rt.koko.mapper.AuthorityMapper;
import rt.koko.mapper.BoardFileMapper;
import rt.koko.mapper.TodoBoardMapper;

@Service
@Log4j
@AllArgsConstructor
public class TodoBoardServiceImpl implements TodoBoardService {
	
	private TodoBoardMapper mapper;
	private BoardFileMapper fileMapper;
	private AuthorityMapper authorityMapper;
	
	@Override
	public ProjectCommand projectGet(String p_no) {
		log.info("project Get...");
		return mapper.projectGet(p_no);
	}
	
	@Override
	public List<TodoBoardCommand> todoBoardListRead(Criteria cri) {
		log.info("board list paging..." + cri);
		//cri.setP_no(p_no);
		return mapper.getListWithPaging(cri);
	}
	
	@Transactional
	@Override
	public void todoBoardInsert(TodoBoardCommand board) {
		log.info("todoBoardList insert...");
		
		mapper.todoBoardInsert(board);
		if(board.getFileList() == null || board.getFileList().size() <= 0){
			return;
		}
		board.getFileList().forEach(boardFile -> {
			boardFile.setB_seq(board.getB_seq());
			fileMapper.boardFileInsert(boardFile);
		});
	}
	
	@Transactional
	@Override
	public boolean todoBoardUpdate(TodoBoardCommand board) {
		log.info("board update...");
		
		fileMapper.boardFileDeleteAll(board.getB_seq());
		
		boolean modifyResult = mapper.todoBoardUpdate(board) == 1;
		
		if(modifyResult && board.getFileList() != null &&
				board.getFileList().size() > 0){
			board.getFileList().forEach(boardFile -> {
			boardFile.setB_seq(board.getB_seq());
			fileMapper.boardFileInsert(boardFile);
			});
		}
		
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean todoBoardDelete(int b_seq) {
		log.info("board Delete...");
		fileMapper.boardFileDeleteAll(b_seq);
		return mapper.todoBoardDelete(b_seq) == 1;
	}

	@Override
	public void todoBoardInsertSelectKey(TodoBoardCommand board) {
		log.info("board insertSelectKey...");
		
		mapper.todoBoardInsertSelectKey(board);
		
		if(board.getFileList() == null || board.getFileList().size() <= 0){
			return;
		}
		board.getFileList().forEach(boardFile -> log.info(boardFile));
		board.getFileList().forEach(boardFile -> {
			boardFile.setB_seq(board.getB_seq());
			fileMapper.boardFileInsert(boardFile);
		});
	}

	@Override
	public TodoBoardCommand todoBoardDetail(int b_seq) {
		log.info("board Detail...");
		return mapper.todoBoardDetail(b_seq);
	}

	@Override
	public int getTotal(String p_no) {
		log.info("get total count...");
		return mapper.getTotalCount(p_no);
	}

	@Override
	public List<BoardFileCommand> getFileList(int b_seq) {
		log.info("get board file List...");
		return fileMapper.fileList(b_seq);
	}
	
	@Override
	public String authorityCheck(String m_id, String p_no) {
		AuthorityCommand a = authorityMapper.boardAuthorityRead(m_id, p_no);
		System.out.println(a);
		System.out.println(m_id);
		System.out.println(p_no);
		return authorityMapper.boardAuthorityRead(m_id, p_no).getA_board();
	}

	@Override
	public int boardTypeCount(String b_type, String p_no) {
		log.info("board Type Count...");
		return mapper.boardTypeCount(b_type, p_no);
	}

	@Override
	public boolean adminAuthorityCheck(String m_id, String p_no) {
		log.info("admin authority Check..");
		return authorityMapper.adminAuthorityRead(m_id, p_no).equals("y");
	}

	@Override
	public List<TodoBoardCommand> todoBoardTypeSort(Criteria cri, String b_type) {
		log.info("board type sort...");
		return mapper.todoBoardTypeSort(cri, b_type);
	}
	
//
//	@Override
//	public void deleteBoardFile(int b_seq) {
//		log.info("get board file remove all...");
//		fileMapper.boardFileDeleteAll(b_seq);
//	}
	
}
