package rt.koko.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String m_id;
	private String m_password;
	private String m_name;
	private String m_email;
	private String m_position;
}
