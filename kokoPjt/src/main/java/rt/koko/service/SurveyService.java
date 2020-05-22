package rt.koko.service;

import java.util.List;

import rt.koko.domain.AnswerCommand;
import rt.koko.domain.SCriteria;
import rt.koko.domain.SurveyCommand;

public interface SurveyService {
	public SurveyCommand showSurvey(int s_seq);
	public void save(AnswerCommand acommand);
	public List<AnswerCommand> showResult(int s_seq);
	public void registerSurvey(SurveyCommand scommand); 
	public List<SurveyCommand> getList();
	public boolean remove(int s_seq);
	public boolean modify(SurveyCommand scommand);
	public List<SurveyCommand> listAll(SCriteria scri);
	public int countArticle(SCriteria scri);
}
