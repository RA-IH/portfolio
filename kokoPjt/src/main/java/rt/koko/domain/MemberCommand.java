package rt.koko.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MemberCommand {
	
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_position;
	
	public MemberCommand() {}
	
	public MemberCommand(String m_id, String m_password) {
		super();
		this.m_id = m_id;
		this.m_password = m_password;
	}

}
