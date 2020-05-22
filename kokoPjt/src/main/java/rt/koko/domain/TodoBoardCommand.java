package rt.koko.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class TodoBoardCommand implements Serializable{
	private int b_seq;
	private String m_id;
	private String bl_no;
	private String b_title;
	private String b_contents;
	private String b_type;
	private String b_scope;
	private String b_hitcount;
	private Date b_regdate;
	private Date b_lastUpdate;
	
	private String p_no;
	private List<BoardFileCommand> fileList;
	//private MemberCommand member;

}
