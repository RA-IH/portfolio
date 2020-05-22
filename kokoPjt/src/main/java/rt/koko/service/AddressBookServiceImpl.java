package rt.koko.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.AddressBookPage;
import rt.koko.domain.AddressBookVO;
import rt.koko.mapper.AddressBookMapper;

@Log4j
@Service
@AllArgsConstructor
public class AddressBookServiceImpl implements AddressBookService {

private AddressBookMapper mapper;

	@Override
	public List<AddressBookVO> AddressBookListwithPaging(AddressBookPage page) {
		log.info("연락처 전체 조회입니당");
		log.info("페이징처리:"  + page);
		System.out.println("---------------------------------------------------");
		return mapper.AddressBookListwithPaging(page);
	}
	
	@Override
		public void AddressBookInsert(AddressBookVO address) {
			
			System.out.println("INSERT");
			
			mapper.AddressBookInsert(address);
			
		}
	

	@Override
	public AddressBookVO AddressBookDetail(long ad_seq) {
		log.info("연락처 세부사항 조회입니당.");
		return mapper.AddressBookDetail(ad_seq);
	}

	@Override
	public int AddressBookDelete(long ad_seq) {
		log.info("연락처 삭제입니당.");
		return mapper.AddressBookDelete(ad_seq);
	}

	@Override
	public int AddressBookUpdate(AddressBookVO address) {
		log.info("연락처 수정입니당.");
		
		
		return mapper.AddressBookUpdate(address);
	}



	@Override
	public List<AddressBookVO> AddressBookList() {
		log.info("연락처 전체 조회입니당");
		System.out.println("---------------------------------------------------");
		return mapper.AddressBookList();
	}

	@Override
	public int TotalCount(AddressBookPage page) {
		log.info("총 글갯수");
		return mapper.TotalCount(page);
	}



	

}
