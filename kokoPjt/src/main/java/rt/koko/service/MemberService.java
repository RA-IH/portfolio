package rt.koko.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import rt.koko.domain.MemberCommand;
import rt.koko.domain.ProjectCommand;

public interface MemberService {
	//MemberVO loginRead(String m_id, String m_password);
	String loginRead(String m_id);
	MemberCommand memberRead(String m_id);
	List<ProjectCommand> projectRead(String m_id, HttpSession session);
}
