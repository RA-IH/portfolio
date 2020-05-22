package rt.koko.domain;

import java.util.Date;

import lombok.Data;

//컬럼 13개
@Data
public class AddressBookVO {
	
	private String m_id;
	private long ad_seq;
	private String ad_name;
	private String ad_number;
	private String ad_email;
	private String ad_group;
	private String ad_company;
	private String ad_department;
	private String ad_address;
	private String ad_memo;
	private Date ad_regdate;
	private Date ad_updatedate;
	
}
