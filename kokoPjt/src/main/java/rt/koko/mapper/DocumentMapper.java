package rt.koko.mapper;

import java.util.List;

import rt.koko.domain.DocumentPageVO;
import rt.koko.domain.DocumentVO;

public interface DocumentMapper {
	
	public List<DocumentVO> documentList(); //글목록
	public void documentInsert(DocumentVO document); //글입력
	public Integer documentInsertSelectKey(DocumentVO document); //글입력& 생성된 pk값 알아야 될 때 사용
	public DocumentVO documentDetail(Long doc_seq); //게시글보기
	public int documentDelete(Long doc_seq); //글삭제
	public int documentUpdate(DocumentVO document); //글수정
	public List<DocumentVO> documentListPaging(DocumentPageVO docPage); // 페이징
	//public List<DocumentVO> documentListPaging(); // 페이징

	
}
