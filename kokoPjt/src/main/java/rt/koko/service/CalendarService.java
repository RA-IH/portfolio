package rt.koko.service;

import java.util.List;

import rt.koko.domain.CalendarVO;

public interface CalendarService {

	public void register(CalendarVO calendar);
	
	public CalendarVO get(int CA_SEQ);
	
	public boolean modify(CalendarVO calendar);
	
	public boolean remove(int CA_SEQ);
	
	public List<CalendarVO> getList();
}
