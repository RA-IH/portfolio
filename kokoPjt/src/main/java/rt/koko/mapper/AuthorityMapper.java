package rt.koko.mapper;

import org.apache.ibatis.annotations.Param;

import rt.koko.domain.AuthorityCommand;

public interface AuthorityMapper {
	// 글 작성 권한 확인
	public AuthorityCommand boardAuthorityRead(@Param("m_id")String m_id,
										@Param("p_no")String p_no);

	public String adminAuthorityRead(@Param("m_id")String m_id,
										@Param("p_no")String p_no);
}
