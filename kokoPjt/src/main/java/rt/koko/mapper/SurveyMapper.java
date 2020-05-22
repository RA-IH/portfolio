package rt.koko.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import rt.koko.domain.AnswerCommand;
import rt.koko.domain.SCriteria;
import rt.koko.domain.SurveyCommand;

public interface SurveyMapper {
	public SurveyCommand selectOne(int s_seq);
	public void insertAnswer(AnswerCommand acommand);
	public List<AnswerCommand> selectList(int s_seq);
	public void insertSurvey(SurveyCommand scommand);
	public List<SurveyCommand> getList();
	public int delete(int s_seq);
	public int update(SurveyCommand scommand);
	public List<SurveyCommand> listAll(SCriteria scri);
	public int countArticle(SCriteria scri);
}
