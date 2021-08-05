package study.spring.goodspring.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.CAS;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.SearchService;

@Controller
public class MainController {

	/** Service 패턴 구현체 주입 */
	@Autowired
	SearchService searchService;
	// 웹헬퍼
	@Autowired
	WebHelper webHelper;
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	/**
	 * introduce 메인 페이지
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/mainPage/introduce.do", method = RequestMethod.GET)
	public String introduce() {

		return "mainPage/introduce";
	}

	/**
	 * 회원가입 페이지
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/mainPage/join.do", method = RequestMethod.GET)
	public String join() {

		return "mainPage/join";
	}

	/**
	 * 회원가입 성공
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/mainPage/join_ok.do", method = RequestMethod.POST)
	public String join_ok() {

		return "mainPage/join";
	}

	@RequestMapping(value = "/mainPage/login.do", method = RequestMethod.GET)
	public String login(Model model) {

		return "mainPage/login";
	}

	@RequestMapping(value = "/mainPage/login_ok.do", method = RequestMethod.GET)
	public String login_ok(Model model) {

		return "mainPage/login_ok";
	}

	@RequestMapping(value = "/mainPage/login_findID.do", method = RequestMethod.GET)
	public String login_findID(Model model) {

		return "mainPage/login_findID";
	}

	@RequestMapping(value = "/myPage/myPage_index.do", method = RequestMethod.GET)
	public ModelAndView myPageIndex() {
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		return new ModelAndView("myPage/myPage_index");
	}

	@RequestMapping(value = "/mainPage/login_findPW.do", method = RequestMethod.GET)
	public String login_findPW(Model model) {

		return "mainPage/login_findPW";
	}

	/**
	 * 마이 페이지 회원 수정 페이지
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/myPage/myPage_accountEdit.do", method = RequestMethod.GET)
	public ModelAndView myPage_accountEdit() {
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		return new ModelAndView("myPage/myPage_accountEdit");
	}


	/**
	 * 통합검색 페이지 [걷기목록]
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/mainPage/search.do", method = RequestMethod.GET)
	public ModelAndView SearchW(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수값 생성 */
		// [페이지네이션] 변수 추가
		int totalCountW = 0; // 전체 게시글 수 (걷기 목록)
		int totalCountM = 0; // 전체 게시글 수 (나만의 코스)
		int totalCountC = 0; // 전체 게시글 수 (크루)
		int totalCountCAS = 0; // 전체 게시글 수 (문화체육)
		
		int listCount = 4; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageDataW = null; // (걷기목록)
		PageData pageDataM = null; // (나만의 코스)
		PageData pageDataC = null; // (크루)
		PageData pageDataCAS = null; // (문화체육)
		// [페이지네이션] 변수 추가 (종료)

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		// 걷기 코스
		WalkCourse input_w = new WalkCourse();
		input_w.setCOURSE_CATEGORY_NM(keyword);
		input_w.setSOUTH_NORTH_DIV_NM(keyword);
		input_w.setAREA_GU(keyword);
		input_w.setDISTANCE(keyword);
		input_w.setLEAD_TIME(keyword);

		input_w.setCOURSE_LEVEL(keyword);
		input_w.setRELATE_SUBWAY(keyword);
		input_w.setTRAFFIC_INFO(keyword);
		input_w.setCONTENT(keyword);
		input_w.setCOURSE_NAME(keyword);

		input_w.setREG_DATE(keyword);
		input_w.setDETAIL_COURSE(keyword);
		input_w.setCPI_NAME(keyword);
		input_w.setCPI_CONTENT(keyword);

		// 나만의 코스
		MyCourses input_m = new MyCourses();
		input_m.setMycourse_name(keyword);
		input_m.setMycourse_area(keyword);
		input_m.setMycourse_content(keyword);
		
		// 크루
		Crew input_c = new Crew();
		input_c.setCrew_name(keyword);
		input_c.setCrew_area(keyword);
		input_c.setCrew_sinto(keyword);
		input_c.setCrew_category(keyword);
		
		// 문화체육
		CAS input_cas = new CAS();
		input_cas.setMAXCLASSNM(keyword);
		input_cas.setMINCLASSNM(keyword);
		input_cas.setSVCSTATNM(keyword);
		input_cas.setSVCNM(keyword);
		input_cas.setPLACENM(keyword);
		
		input_cas.setUSETGTINFO(keyword);
		input_cas.setAREANM(keyword);
		input_cas.setTELNO(keyword);
		
		// 조회 결과가 저장될 객체
		List<WalkCourse> output_w = null;
		List<MyCourses> output_m = null;
		List<Crew> output_c = null;
		List<CAS> output_cas = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCountW = searchService.getSearchWalkCourseCount(input_w); // (걷기 목록)
			totalCountM = searchService.getSearchMyCourseCount(input_m); // (나만의 코스)
			totalCountC = searchService.getSearchCrewCount(input_c); // (크루)
			totalCountCAS = searchService.getSearchCASCount(input_cas); // (문화체육)
			
			// [페이지네이션] 페이지 번호 계산
			pageDataW = new PageData(nowPage, totalCountW, listCount, pageCount); // (걷기 목록)
			pageDataM = new PageData(nowPage, totalCountM, listCount, pageCount); // (나만의 코스)
			pageDataC = new PageData(nowPage, totalCountC, listCount, pageCount);  // (크루)
			pageDataCAS = new PageData(nowPage, totalCountCAS, listCount, pageCount); // (문화체육)

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			// (1) 걷기 목록
			WalkCourse.setOffset(pageDataW.getOffset());
			WalkCourse.setListCount(pageDataW.getListCount());
			// (2) 나만의 코스
			MyCourses.setOffset(pageDataM.getOffset());
			MyCourses.setListCount(pageDataM.getListCount());
			// (3) 크루
			Crew.setOffset(pageDataC.getOffset());
			Crew.setListCount(pageDataC.getListCount());
			// (3) 문화체육
			CAS.setOffset(pageDataCAS.getOffset());
			CAS.setListCount(pageDataCAS.getListCount());
			
			// 데이터 조회하기
			output_w = searchService.getSearchWalkCourseList(input_w); // (걷기 목록)
			output_m = searchService.getSearchMyCourseList(input_m); // (나만의 코스)
			output_c = searchService.getSearchCrewList(input_c);  // (크루)
			output_cas = searchService.getSearchCASList(input_cas); // (문화체육)

		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("keyword", keyword);
		model.addAttribute("output_w", output_w);
		model.addAttribute("output_m", output_m);
		model.addAttribute("output_c", output_c);
		model.addAttribute("output_cas", output_cas);
		model.addAttribute("pageDataW", pageDataW);
		model.addAttribute("pageDataM", pageDataM);
		model.addAttribute("pageDataC", pageDataC);
		model.addAttribute("pageDataCAS", pageDataCAS);

		return new ModelAndView("/mainPage/search");
	}
	
}
