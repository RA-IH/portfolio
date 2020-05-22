package rt.koko.service;

import java.util.List;

import rt.koko.domain.AddressBookPage;
import rt.koko.domain.AddressBookVO;

public interface AddressBookService {
	
	//등록
	public void AddressBookInsert(AddressBookVO address);
	//목록보기 페이징
	public List<AddressBookVO> AddressBookListwithPaging(AddressBookPage page);
	//세부사항보기
	public AddressBookVO AddressBookDetail(long ad_seq);
	//수정
	public int AddressBookUpdate(AddressBookVO address);
	//삭제
	public int  AddressBookDelete(long ad_seq);
	//목록보기
	public List<AddressBookVO> AddressBookList();
	//글갯수
	public int TotalCount(AddressBookPage page);
	
}
