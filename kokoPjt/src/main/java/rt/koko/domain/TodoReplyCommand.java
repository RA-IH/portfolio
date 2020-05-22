package rt.koko.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class TodoReplyCommand{
	private int br_seq;
	private String br_contents;
	private Date br_regdate;
	private Date br_lastUpdate;
	private int b_seq;
	private String m_id;
}
