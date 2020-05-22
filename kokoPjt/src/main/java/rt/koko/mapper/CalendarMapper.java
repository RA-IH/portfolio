package rt.koko.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import rt.koko.domain.CalendarVO;

public interface CalendarMapper {

	//@Select("select * from CALENDER where CA_SEQ > 0")
	public List<CalendarVO> getList();
	
	public void insert(CalendarVO calendar);
	
	public void insertSelectKey(CalendarVO calendar);
	
	public CalendarVO read(int CA_SEQ);
	
	public int delete(int CA_SEQ);
	
	public int update(CalendarVO calendar);
}
