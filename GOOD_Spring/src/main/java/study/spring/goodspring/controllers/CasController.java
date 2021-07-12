package study.spring.goodspring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.CasOther;
import study.spring.goodspring.service.CasService;

@Controller
public class CasController {
	@Autowired
	WebHelper WebHelper;
	@Autowired
	RegexHelper RegexHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@Autowired
	CasService CasService;

	/** 문화체육 메인페이지 메서드 **/
	@RequestMapping(value = "/casPage/cas_index.do", method = RequestMethod.GET)
	public ModelAndView cas_index(Model model,
			@RequestParam(value = "keyword_exp", required = false, defaultValue = "문화") String keyword_exp,
			@RequestParam(value = "keyword_imp", required = false, defaultValue = "교육") String keyword_imp,
			@RequestParam(value = "keyword_sport", required = false, defaultValue = "체육") String keyword_sport,
			@RequestParam(value = "keyword_borrow", required = false, defaultValue = "대관") String keyword_borrow) {
		
		// 문화 창의 체험 시작
		CasOther input_exp = new CasOther();

		input_exp.setDIV_COL(keyword_exp);

		List<CasOther> output_exp = null;
		try {
			output_exp = CasService.getOtherList(input_exp);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}

		// 문화 창의 체험 끝
		
		// 교육 자기계발 시작
		CasOther input_imp = new CasOther();
		input_imp.setDIV_COL(keyword_imp);

		List<CasOther> output_imp = null;
		try {
			output_imp = CasService.getOtherList(input_imp);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 교육 자기계발 끝
		
		// 체육시설 시작
		CasOther input_sport = new CasOther();
		input_sport.setDIV_COL(keyword_sport);

		List<CasOther> output_sprot = null;
		try {
			output_sprot = CasService.getOtherList(input_sport);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 체육시설 끝
		
		// 시설대관 시작
		CasOther input_borrow = new CasOther();
		input_borrow.setDIV_COL(keyword_borrow);

		List<CasOther> output_borrow = null;
		try {
			output_borrow = CasService.getOtherList(input_borrow);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 시설대관 끝
		
		model.addAttribute("keyword_exp", keyword_exp);
		model.addAttribute("keyword_imp", keyword_imp);
		model.addAttribute("keyword_sport", keyword_sport);
		model.addAttribute("keyword_borrow", keyword_borrow);
		
		model.addAttribute("output_exp", output_exp);
		model.addAttribute("output_imp", output_imp);
		model.addAttribute("output_sprot", output_sprot);
		model.addAttribute("output_borrow", output_borrow);
		return new ModelAndView("casPage/cas_index");
	}

	/** 문화체육 카테고리 리스트페이지 메서드 **/
	@RequestMapping(value = "/casPage/cas_themeList.do", method = RequestMethod.GET)
	public String cas_ThemeList(Model model,
			// GET 파라미터 받기
			@RequestParam(value = "cas", defaultValue = "") String cas,
			@RequestParam(value = "order", defaultValue = "") String order) {

		String result = null;
		String iconurl = null;

		if (cas == null || cas.equals("")) {
			return "casPage/cas_index";
		}

		if (cas.equals("exp")) {
			result = "문화 창의 체험";
			iconurl = "'../assets/icon_img/창의 체험 아이콘.png'";
		} else if (cas.equals("showExh")) {
			result = "공연 전시";
			iconurl = "'../assets/icon_img/공연전시문화 아이콘.png'";
		} else if (cas.equals("imp")) {
			result = "교육 자기 계발";
			iconurl = "'../assets/icon_img/자기계발 아이콘.png'";
		} else if (cas.equals("sportsFac")) {
			result = "체육시설";
			iconurl = "'../assets/icon_img/체육시설 아이콘.png'";
		}

		// 파라미터 값을 View에게 전달
		model.addAttribute("cas", cas);
		model.addAttribute("result", result);
		model.addAttribute("iconurl", iconurl);
		model.addAttribute("order", order);
		return "casPage/cas_themeList";
	}
}
