package rt.koko.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.MemberCommand;
import rt.koko.domain.ProjectCommand;
import rt.koko.mapper.MemberMapper;

@Log4j
@Service
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public String loginRead(String m_id) {
		log.info("login Read...");
		return mapper.loginRead(m_id);

	}

	@Override
	public List<ProjectCommand> projectRead(String m_id, HttpSession session) {
		//String m_id = (String) session.getAttribute("m_id");
		log.info("projectList");
		List<ProjectCommand> list = mapper.projectRead(m_id);
		session.setAttribute("projectList", list);
		return list;
	}

	@Override
	public MemberCommand memberRead(String m_id) {
		return mapper.memberRead(m_id);
	}
	
	/*@Override
	public MemberVO loginRead(String m_id, String m_password) {
		log.info("login Read...");
		return mapper.loginRead(m_id, m_password);
	}*/
	
	
}
