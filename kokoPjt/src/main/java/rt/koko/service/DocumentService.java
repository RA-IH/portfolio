package rt.koko.service;

import java.util.List;

import rt.koko.domain.DocumentPageVO;
import rt.koko.domain.DocumentVO;

public interface DocumentService {

	public void documentInsert(DocumentVO document); // 글쓰기
	public DocumentVO documentDetail(Long doc_seq); // 세부보기
	public boolean documentUpdate(DocumentVO document); // 수정
	public boolean documentDelete(Long doc_seq); // 삭제
	public List<DocumentVO> documentList(); //전체목록
	//public List<DocumentVO> documentList(DocumentPageVO docPage); //전체목록(+페이징)
	
}
