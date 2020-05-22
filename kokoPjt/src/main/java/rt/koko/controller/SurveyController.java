package rt.koko.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import rt.koko.domain.AnswerCommand;
import rt.koko.domain.MemberCommand;
import rt.koko.domain.SCriteria;
import rt.koko.domain.SurveyCommand;
import rt.koko.service.MemberService;
import rt.koko.service.SurveyService;

@Controller
@RequestMapping("/Survey/*")
public class SurveyController {
	@Autowired
	private SurveyService surveyService;

	// @RequestMapping("/Slist")
	// public void Slist(Model model){
	// List<SurveyCommand> Slist = surveyService.getList();
	// model.addAttribute("Slist", Slist);
	//
	// }

	@RequestMapping("/SRegister")
	public void surveyform() {
		System.out.println("등록창나와라라");
	}

	@RequestMapping("/SModify")
	public void updateform(@RequestParam int s_seq, Model model) {
		SurveyCommand scommand = surveyService.showSurvey(s_seq);
		model.addAttribute("scommand", scommand);
		System.out.println("설문수정하러고고");
	}

	@RequestMapping("/SurveyForm")
	public void show_survey(Model model, @RequestParam int s_seq) {
		SurveyCommand scommand = surveyService.showSurvey(s_seq);
		System.out.println(scommand.getQuestion());
		model.addAttribute("scommand", scommand);
		
		Date today = new Date();
		Date end_date = surveyService.showSurvey(s_seq).getExpire_date();
		System.out.println("today : " + today);
		System.out.println("END DATE : " + end_date);

		int x = end_date.compareTo(today);
		model.addAttribute("limit", x);
	}

	@RequestMapping(value = "/register_survey.do")
	public String register_survey(SurveyCommand scommand, @RequestParam("expire_datess") String expire) {
		Date expire_date = null;
		SimpleDateFormat simple_expire = new SimpleDateFormat("yyyy-MM-dd");
		try {
			expire_date = simple_expire.parse(expire);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		scommand.setExpire_date(expire_date);
		surveyService.registerSurvey(scommand);
		return "redirect:/Survey/Slist";
	}

	@RequestMapping(value = "/save_survey.do")
	public String save_survey(AnswerCommand acommand) {
		surveyService.save(acommand);
		return "redirect:/Survey/Slist";
	}

	@RequestMapping(value = "/show_result.do")
	public String show_result(Model model, @RequestParam int s_seq) {
		Map<String, Object> map = new HashMap<>();
		SurveyCommand scommand = surveyService.showSurvey(s_seq);
		List<AnswerCommand> items = surveyService.showResult(s_seq);

		map.put("scommand", scommand);
		map.put("list", items);
		String result = "";

		for (int i = 0; i < items.size(); i++) {
			if (result != "") {
				result += ",";
			}
			result += "['" + items.get(i).getAno() + "', " + items.get(i).getRate() + "]";
		}

		model.addAttribute("map", map);
		model.addAttribute("result", result);
		System.out.println(map);
		return "/Survey/SResult";
	}

	@RequestMapping(value = "/remove")
	public String remove(@RequestParam int s_seq, RedirectAttributes rttr) {
		if (surveyService.remove(s_seq)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/Survey/Slist";
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify(SurveyCommand scommand, @RequestParam("expire_datess") String expire,
			RedirectAttributes rttr) {
		System.out.println("이까지오니");

		Date expire_date = null;
		SimpleDateFormat simple_expire = new SimpleDateFormat("yyyy-MM-dd");
		try {
			expire_date = simple_expire.parse(expire);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		scommand.setExpire_date(expire_date);

		if (surveyService.modify(scommand)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/Survey/Slist";
	}

	@RequestMapping(value = "/Slist")
	public void searchList(Model model, SCriteria scri) {
		Map<String, Object> map = new HashMap<>();
		List<SurveyCommand> Slist = surveyService.listAll(scri);
		int count = surveyService.countArticle(scri);
		map.put("Slist", Slist);
		map.put("count", count);
		model.addAttribute("map", map);
	}

}
