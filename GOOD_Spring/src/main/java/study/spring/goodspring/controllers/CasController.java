package study.spring.goodspring.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.BookMark;
import study.spring.goodspring.model.CAS;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.BookMarkService;
import study.spring.goodspring.service.CasService;

@Controller
public class CasController {
	@Autowired
	RetrofitHelper retrofitHelper;
	@Autowired
	WebHelper WebHelper;
	@Autowired
	RegexHelper RegexHelper;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@Autowired
	CasService CasService;

	@Autowired
	BookMarkService bookMarkService;

	/** 문화체육 메인페이지 메서드 **/
	@RequestMapping(value = "/casPage/cas_index.do", method = RequestMethod.GET)
	public ModelAndView cas_index(Model model,
			@RequestParam(value = "keyword_exp", required = false, defaultValue = "문화") String keyword_exp,
			@RequestParam(value = "keyword_imp", required = false, defaultValue = "교육") String keyword_imp,
			@RequestParam(value = "keyword_sport", required = false, defaultValue = "체육") String keyword_sport,
			@RequestParam(value = "keyword_borrow", required = false, defaultValue = "대관") String keyword_borrow) {

		// 문화 창의 체험 시작
		CAS input_exp = new CAS();

		input_exp.setDIV_COL(keyword_exp);

		List<CAS> output_exp = null;

		try {
			output_exp = CasService.getOtherList(input_exp);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}

		// 문화 창의 체험 끝

		// 교육 자기계발 시작
		CAS input_imp = new CAS();
		input_imp.setDIV_COL(keyword_imp);

		List<CAS> output_imp = null;

		try {
			output_imp = CasService.getOtherList(input_imp);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 교육 자기계발 끝

		// 체육시설 시작
		CAS input_sport = new CAS();
		input_sport.setDIV_COL(keyword_sport);

		List<CAS> output_sprot = null;

		try {
			output_sprot = CasService.getOtherList(input_sport);
		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}
		// 체육시설 끝

		// 시설대관 시작
		CAS input_borrow = new CAS();
		input_borrow.setDIV_COL(keyword_borrow);

		List<CAS> output_borrow = null;

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
			@RequestParam(value = "cas", required = false, defaultValue = "") String cas,
			@RequestParam(value = "order", required = false, defaultValue = "") String order,
			@RequestParam(value = "page", defaultValue = "1") int nowPage, HttpServletRequest request,
			HttpServletResponse response) {

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
		CAS input_theme = new CAS();
		input_theme.setDIV_COL(cas);

		List<CAS> output_theme = null;

		input_theme.setMINCLASSNM(order);

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

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = CasService.getOtherCount(input_theme);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			CAS.setOffset(pageData.getOffset());
			CAS.setListCount(pageData.getListCount());

		} catch (Exception e) {
			return WebHelper.redirect(null, e.getLocalizedMessage());
		}

		// 찜하기
		BookMark bookinput = new BookMark();
		
		BookMark bookUnique = new BookMark();
		
		List<BookMark> outputUnique = null;
		
		if (request.getSession().getAttribute("login_info") == null) {

			try {
				output_theme = CasService.getOtherCategoryList(input_theme);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} else {
			Member loginInfo = (Member) WebHelper.getSession("login_info", new Member());

			bookinput.setUser_info_user_no(loginInfo.getUser_no());
			// 조회
			bookinput.setCategory_id(input_theme.getDIV_COL());
			bookinput.setService_id(input_theme.getSVCID());
			
			bookUnique.setUser_info_user_no(loginInfo.getUser_no());
			
			// 저장
			try {
				output_theme = CasService.getOtherCategoryList(input_theme);
				outputUnique = bookMarkService.BookMarkSelectList(bookUnique);
						
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		// 파라미터 값을 View에게 전달
		model.addAttribute("cas", cas);
		model.addAttribute("result", result);
		model.addAttribute("iconurl", iconurl);
		model.addAttribute("order", order);
		model.addAttribute("output_theme", output_theme);
		// [페이지네이션]
		model.addAttribute("pageData", pageData);

		// 찜목록 확인
		model.addAttribute("outputUnique", outputUnique);
		return new ModelAndView("casPage/cas_themeList");
	}

	/** 상세페이지 **/
	@RequestMapping(value = "/casPage/cas_detail.do", method = RequestMethod.GET)
	public ModelAndView detail(Model model, @RequestParam(value = "SVCID", defaultValue = "") String SVCID,
			HttpServletRequest request, HttpServletResponse response, Object handler) {

		/** 1) 유효성 검사 **/
		// 값이존재하지 않는다면 조회불가능하므로 필수값으로 처리
		if (SVCID == "") {
			return WebHelper.redirect(null, "조회된 항목이 없습니다.");
		}

		/** 2) 데이터 조회 **/
		CAS input = new CAS();
		input.setSVCID(SVCID);

		// 조회된 결과를 저장할 객체 선언
		CAS output = null;

		// 찜하기
		BookMark bookinput = new BookMark();

		int outputcount = 0;

		if (request.getSession().getAttribute("login_info") == null) {

			try {
				output = CasService.getOtherItem(input);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			Member loginInfo = (Member) WebHelper.getSession("login_info", new Member());

			bookinput.setUser_info_user_no(loginInfo.getUser_no());

			// 조회
			bookinput.setCategory_id(input.getDIV_COL());
			bookinput.setService_id(input.getSVCID());

			// 저장
			try {
				output = CasService.getOtherItem(input);
				outputcount = bookMarkService.BookMarkUniqueCheck(bookinput);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		/** 3) View 처리 **/
		model.addAttribute("output", output);
		model.addAttribute("outputcount", outputcount);

		return new ModelAndView("/casPage/cas_detail");
	}

	/**
	 * 문화체육 아이템 찜하기
	 * 
	 * @throws Exception
	 **/
	@ResponseBody
	@RequestMapping(value = "/casPage/BookMark", method = RequestMethod.POST)
	public Map<String, Object> eddBookMark(@RequestParam(value = "svcid", required = false) String svcid,
			@RequestParam(value = "catid", required = false) String catid) throws Exception {

		BookMark input = new BookMark();
		Member loginInfo = (Member) WebHelper.getSession("login_info");

		CAS Info = new CAS();
		Info.setDIV_COL(catid);
		Info.setSVCID(svcid);

		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setCategory_id(Info.getDIV_COL());
		input.setService_id(Info.getSVCID());

		
		try {

			if (bookMarkService.BookMarkUniqueCheck(input) >= 1) {
				bookMarkService.deleteBookMark(input);
			} else if (bookMarkService.BookMarkUniqueCheck(input) == 0) {
				bookMarkService.addBookMark(input);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return WebHelper.getJsonData();
	}
}
