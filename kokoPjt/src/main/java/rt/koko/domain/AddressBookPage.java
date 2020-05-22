package rt.koko.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressBookPage {
	private int pageNum;
	private int amount;
	
	public AddressBookPage(){
		this(1,10);
	}
	public AddressBookPage(int pageNum, int amount){
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
