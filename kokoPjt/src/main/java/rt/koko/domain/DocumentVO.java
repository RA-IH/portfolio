package rt.koko.domain;

import java.util.Date;

import lombok.Data;

@Data
public class DocumentVO {
	private Long doc_seq;
	private String doc_title;
	private String doc_content;
	private Date doc_regdate;
	private String m_id;
	
	private String m_name; // member 테이블
	private String c_name; // comapny 테이블
}
