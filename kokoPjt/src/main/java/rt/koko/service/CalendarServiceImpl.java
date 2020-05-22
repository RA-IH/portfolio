package rt.koko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.CalendarVO;
import rt.koko.mapper.CalendarMapper;

@Log4j
@Service
@AllArgsConstructor
public class CalendarServiceImpl implements CalendarService{

	@Setter(onMethod_ =@Autowired)
	private CalendarMapper mapper;

	@Override
	public void register(CalendarVO calendar) {
		
		log.info("register...." + calendar);
		mapper.insert(calendar);
		
	}

	@Override
	public CalendarVO get(int CA_SEQ) {
		
		log.info("get......" + CA_SEQ);
		
		return mapper.read(CA_SEQ);
	}

	@Override
	public boolean modify(CalendarVO calendar) {
		
		log.info("modify....." + calendar);
		
		return mapper.update(calendar) == 1;
	}

	@Override
	public boolean remove(int CA_SEQ) {
		
		log.info("remove......." + CA_SEQ);
		
		return mapper.delete(CA_SEQ) == 1;
	}

	@Override
	public List<CalendarVO> getList() {
		
		log.info("getList.....");
		
		return mapper.getList();
	}
}
