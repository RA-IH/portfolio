package rt.koko.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	private int pageNum;
	private int amount;
	private String p_no;

//	private String type;
//	private String keyword;

	public Criteria() {
		this(1, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public Criteria(int pageNum, int amount, String p_no) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
		this.p_no = p_no;
	}
	
	

//	public String[] getTypeArr() {
//
//		return type == null ? new String[] {} : type.split("");
//	}
//
	public String getListLink() {

		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount());

		return builder.toUriString();
	}
}
