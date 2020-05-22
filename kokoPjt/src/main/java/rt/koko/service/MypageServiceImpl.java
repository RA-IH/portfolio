package rt.koko.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import rt.koko.domain.MemberCommand;
import rt.koko.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService {

	@Setter(onMethod_= @Autowired)
	private PasswordEncoder pwencoder;
	
	@Setter(onMethod_ = @Autowired)
	private MypageMapper mapper;

	@Override
	public void EditMyPage(MemberCommand m) {
		System.out.println("사용자가 바꾸는 비밀번호 : " + m.getM_password());
		m.setM_password(pwencoder.encode(m.getM_password()));
		mapper.update(m);
	}
	
	
	
}
