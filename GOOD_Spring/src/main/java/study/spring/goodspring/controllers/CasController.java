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
import study.spring.goodspring.model.CasShowExh;
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
			@RequestParam(value = "keyword", required = false, defaultValue = "ShowExh") String keyword,
			@RequestParam(value = "keyword2", required = false, defaultValue = "문화") String keyword2) {

		CasShowExh input = new CasShowExh();
		input.setService_tag(keyword);

		List<CasShowExh> output = null;
		try {
			output = CasService.getShowExhList(input);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		CasOther input2 = new CasOther();
		
		input2.setDIV_COL(keyword2);

		List<CasOther> output2 = null;
		try {
			output2 = CasService.getOtherList(input2);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("keyword", keyword);
		model.addAttribute("keyword2", keyword2);
		model.addAttribute("output", output);
		model.addAttribute("output2", output2);
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
