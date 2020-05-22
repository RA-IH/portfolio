package rt.koko.service;

import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import rt.koko.mapper.AuthorityMapper;

@Service
@Log4j
public class AdminServiceImpl implements AdminService{
	
	private AuthorityMapper authorityMapper;
	
	@Override
	public boolean authorityCheck(String m_id, String p_no) {		
		return authorityMapper.adminAuthorityRead(m_id, p_no).equals("y");
	}	
}
