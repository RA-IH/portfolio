package rt.koko.domain;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProjectCommand implements Serializable{
	private String p_no;
	private String p_name;
	private Date p_startdate;
	private Date p_enddate;
	private String p_admin;
	
	public ProjectCommand() {}
}
