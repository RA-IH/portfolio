package rt.koko.mapper;

import java.util.List;

import rt.koko.domain.BoardFileCommand;

public interface BoardFileMapper {
	public void boardFileInsert(BoardFileCommand boardFile);
	public void boardFileDelete(String bf_uuid);
	public List<BoardFileCommand> fileList(int b_seq);
	public void boardFileDeleteAll(int b_seq);
}
