package rt.koko.domain;

import java.util.Date;

import lombok.Data;

@Data
public class SurveyCommand {
	private int s_seq;
	private String question;
	private String ans1;
	private String ans2;
	private String ans3;
	private String ans4;
	private String status;
	private Date s_regdate;
	private Date expire_date;	
	private String m_id;

}
