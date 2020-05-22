package rt.koko.mapper;

import java.util.List;

import rt.koko.domain.AddressBookPage;
import rt.koko.domain.AddressBookVO;

public interface AddressBookMapper {
	
	public List<AddressBookVO> AddressBookList();
	public List<AddressBookVO> AddressBookListwithPaging(AddressBookPage page);
	public void AddressBookInsert(AddressBookVO address);
	public AddressBookVO AddressBookDetail(long ad_seq);
	public int  AddressBookDelete(long ad_seq);
	public int AddressBookUpdate(AddressBookVO address);
	public int TotalCount(AddressBookPage page);


	
}
