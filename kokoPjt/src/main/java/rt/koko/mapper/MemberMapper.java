package rt.koko.mapper;

import java.util.List;

import rt.koko.domain.MemberCommand;
import rt.koko.domain.ProjectCommand;


public interface MemberMapper {
	String loginRead(String m_id);
	MemberCommand memberRead(String m_id);
	List<ProjectCommand> projectRead(String m_id);
}
