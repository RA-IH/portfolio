package rt.koko.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AuthorityCommand {
	private String m_id;
	private String p_no;
	private String a_board;
	private String a_admin;
}
