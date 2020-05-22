package rt.koko.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TodoReplyVO {
	private int br_seq;
	private String br_contents;
	private Date br_regdate;
	private Date br_lastUpdate;
	private int b_seq;
	private String m_id;
}
