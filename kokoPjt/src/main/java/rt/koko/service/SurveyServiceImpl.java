package rt.koko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import rt.koko.domain.AnswerCommand;
import rt.koko.domain.SCriteria;
import rt.koko.domain.SurveyCommand;
import rt.koko.mapper.SurveyMapper;

@Log4j
@Service
public class SurveyServiceImpl implements SurveyService {
	@Setter(onMethod_ = @Autowired)
	private SurveyMapper mapper;

	@Override
	public SurveyCommand showSurvey(int s_seq) {// 문제 보기
		log.info("show_survey"+ s_seq);
		return mapper.selectOne(s_seq);
	}

	@Override
	public void save(AnswerCommand acommand) { // 응답을 저장
		log.info("save_answer"+ acommand);
		mapper.insertAnswer(acommand);
	}

	@Override
	public List<AnswerCommand> showResult(int s_seq) {// 설문 결과
		log.info("show_result"+ s_seq);
		return mapper.selectList(s_seq);
	}

	@Override
	public void registerSurvey(SurveyCommand scommand) {// 설문 등록
		log.info("register_survey"+ scommand);
		mapper.insertSurvey(scommand);
	}

	@Override
	public List<SurveyCommand> getList() {// 설문 목록
		log.info("getList");		
		return mapper.getList();
	}

	@Override
	public boolean remove(int s_seq) {// 설문 삭제
		log.info("remove"+ s_seq);
		return mapper.delete(s_seq) == 1;
	}

	@Override
	public boolean modify(SurveyCommand scommand) {
		log.info("modify"+ scommand);
		return mapper.update(scommand) == 1;
	}

	@Override
	public List<SurveyCommand> listAll(SCriteria scri) {
		log.info("search");
		return mapper.listAll(scri);
	}

	@Override
	public int countArticle(SCriteria scri) {
		log.info("countArticle");
		return mapper.countArticle(scri);
	}
	
}

