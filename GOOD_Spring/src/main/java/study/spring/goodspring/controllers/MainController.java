package study.spring.goodspring.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.model.CAS;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.SearchService;

@Controller
public class MainController {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	SearchService searchService;

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
	public String myPageIndex() {
		return ("myPage/myPage_index");
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
	public String myPage_accountEdit() {

		return "myPage/myPage_accountEdit";
	}

	/**
	 * 통합검색 페이지
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/mainPage/search.do", method = RequestMethod.GET)
	public ModelAndView Search(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {

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
			// 데이터 조회하기
			output_w = searchService.getSearchWalkCourseList(input_w);
			output_m = searchService.getSearchMyCourseList(input_m);
			output_c = searchService.getSearchCrewList(input_c);
			output_cas = searchService.getSearchCASList(input_cas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View 처리
		model.addAttribute("keyword", keyword);
		model.addAttribute("output_w", output_w);
		model.addAttribute("output_m", output_m);
		model.addAttribute("output_c", output_c);
		model.addAttribute("output_cas", output_cas);
		
		return new ModelAndView("/mainPage/search");
	}

}
