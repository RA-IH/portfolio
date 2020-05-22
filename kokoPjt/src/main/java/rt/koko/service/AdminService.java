package rt.koko.service;

public interface AdminService {
	// 권한 확인
	public boolean authorityCheck(String m_id, String p_no);
}
