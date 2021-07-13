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

import study.spring.goodspring.helper.PageData;
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
	public ModelAndView cas_ThemeList(Model model,
			// GET 파라미터 받기
			@RequestParam(value = "cas", required=false, defaultValue = "") String cas,
			@RequestParam(value = "order", required=false, defaultValue = "") String order,
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		String result = null;
		String iconurl = null;

		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 12; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		// 시설대관 시작
		CasOther input_theme = new CasOther();
		input_theme.setDIV_COL(cas);

		List<CasOther> output_theme = null;

		input_theme.setMINCLASSNM(order);

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = CasService.getOtherCount(null);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			CasOther.setOffset(pageData.getOffset());
			CasOther.setListCount(pageData.getListCount());

			output_theme = CasService.getOtherCategoryList(input_theme);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 시설대관 끝

		if (cas == null || cas.equals("")) {
			return new ModelAndView("casPage/cas_index");
		}

		if (cas.equals("문화")) {
			result = "문화 창의 체험";
			iconurl = "'../assets/icon_img/창의 체험 아이콘.png'";
		} else if (cas.equals("대관")) {
			result = "장소대여";
			iconurl = "'../assets/icon_img/장소대여 아이콘.png'";
		} else if (cas.equals("교육")) {
			result = "교육 자기 계발";
			iconurl = "'../assets/icon_img/자기계발 아이콘.png'";
		} else if (cas.equals("체육")) {
			result = "체육시설";
			iconurl = "'../assets/icon_img/체육시설 아이콘.png'";
		}

		// 파라미터 값을 View에게 전달
		model.addAttribute("cas", cas);
		model.addAttribute("result", result);
		model.addAttribute("iconurl", iconurl);
		model.addAttribute("order", order);
		model.addAttribute("output_theme", output_theme);
		// [페이지네이션]
		model.addAttribute("pageData", pageData);

		return new ModelAndView("casPage/cas_themeList");
	}
}
