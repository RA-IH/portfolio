package rt.koko.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.DocumentPageVO;
import rt.koko.domain.DocumentVO;
import rt.koko.mapper.DocumentMapper;

@Service
@AllArgsConstructor
@Log4j
public class DocumentServiceImpl implements DocumentService {
	private DocumentMapper mapper;

	@Override
	public void documentInsert(DocumentVO document) {
		log.info("Insert 서비스: " + document);
		mapper.documentInsert(document);

	}

	@Override
	public DocumentVO documentDetail(Long doc_seq) {
		log.info("documentDetail 서비스: " + doc_seq);
		
		return mapper.documentDetail(doc_seq); //import: documentMapper
	}

	@Override
	public boolean documentUpdate(DocumentVO document) {
		log.info("documentUpdate 서비스: " + document);
		
		return mapper.documentUpdate(document) == 1;
	}

	@Override
	public boolean documentDelete(Long doc_seq) {
		log.info("documentDelete 서비스: " + doc_seq);
		
		return mapper.documentDelete(doc_seq) == 1;
	}

	@Override
	public List<DocumentVO> documentList() {
		log.info("documentList 서비스");
		
		return mapper.documentList();
	}
	
//	@Override
//	public List<DocumentVO> documentList(DocumentPageVO docPage) {
//		log.info("documentList 서비스+페이징처리" + docPage);
//		
//		return mapper.documentListPaging(docPage);
//	}

}
