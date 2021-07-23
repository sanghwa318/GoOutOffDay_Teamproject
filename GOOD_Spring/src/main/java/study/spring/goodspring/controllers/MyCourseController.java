package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkLog;
import study.spring.goodspring.service.MyCourseService;
import study.spring.goodspring.service.WalkLogService;

@Controller
public class MyCourseController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	MyCourseService myCourseService;
	@Autowired
	WalkLogService walkLogService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/*
	 * comm_myCourse 나만의 코스 목록 페이지
	 */
	@RequestMapping(value = "/commPage/comm_myCourse.do", method = RequestMethod.GET)
	public ModelAndView mycourse(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		// 1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0; // 전체 게시글 수
		int listCount = 8; // 한 페이지당 표시할 항목 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		MyCourses input = new MyCourses();

		input.setMycourse_name(keyword);
		input.setMycourse_content(keyword);
		input.setMycourse_area(keyword);

		List<MyCourses> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = myCourseService.getMyCourseCount(input);

			// 전체 게시글 수 조회
			output = myCourseService.getMyCourseList(input);

			// 페이지 번호 계산 --> 계산 결과를 로그로 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 BEANS의 static 변수에 저장
			MyCourses.setOffset(pageData.getOffset());
			MyCourses.setListCount(pageData.getListCount());

			// 데이터 조회하기
			output = myCourseService.getMyCourseList(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
		model.addAttribute("keyword", keyword);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		return new ModelAndView("commPage/comm_myCourse");
	}

	/*
	 * 
	 * comm_myCourseDetail 나만의코스 상세 정보 페이지
	 */
	@RequestMapping(value = "/commPage/comm_myCourseDetail.do", method = RequestMethod.GET)
	public ModelAndView mycourseDetail(Model model,
			@RequestParam(value="mycourse_no")int mycourse_no) {
		
		/* 1) 데이터 조회하기 */
		MyCourses input = new MyCourses();
		input.setMycourse_no(mycourse_no);

		MyCourses output=null;

		try {
			//조회수 증가
			myCourseService.updateHits(input);
			//데이터 조회
			output= myCourseService.getMyCourseItem(input);
		} catch (Exception e) {
			webHelper.redirect(null, e.getLocalizedMessage());
			
		}		
		
		
		/* 3) 지도 생성을 위한 좌표값 조회하기 */
		//아직
		
		model.addAttribute("output", output);
		return new ModelAndView("commPage/comm_myCourseDetail");
	}

	/*
	 * comm_myCourseEdit
	 */
	@RequestMapping(value = "/commPage/comm_myCourseEdit.do", method = RequestMethod.GET)
	public String mycourseEdit(Model model) {

		return "commPage/comm_myCourseEdit";
	}

	/*
	 * 나만의코스 작성 페이지.
	 */
	@RequestMapping(value = "/commPage/comm_myCourseWrite.do", method = RequestMethod.GET)
	public ModelAndView mycourseWrite(Model model) {
		/* 1) 코스 이름 조회하기 */
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		WalkLog input = new WalkLog();
		input.setUser_info_user_no(loginInfo.getUser_no());

		List<WalkLog> courseName = null;

		try {
			// 데이터 조회
			courseName = walkLogService.getCoureName(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// 3) View 처리
		model.addAttribute("courseName", courseName);
		return new ModelAndView("commPage/comm_myCourseWrite");
	}

	
	
	/*
	 * 나만의코스 작성 action 페이지.
	 */
	@RequestMapping(value = "/commPage/comm_myCourseWriteOk.do", method = RequestMethod.POST)
	public ModelAndView mycourseWriteOk(Model model,
			@RequestParam(value = "mycourse_name") String mycourse_name,
			@RequestParam(value = "mycourse_area") String mycourse_area,
			@RequestParam(value = "mycourse_content") String mycourse_content) {
		Member loginInfo = ((Member) webHelper.getSession("login_info"));

		
		MyCourses input = new MyCourses();
		input.setMycourse_name(mycourse_name);
		input.setMycourse_area(mycourse_area);
		input.setMycourse_content(mycourse_content);
		input.setUser_info_user_no(loginInfo.getUser_no());
		MyCourses output=null;
		
		
		
		try {
			// 데이터 추가하기
			myCourseService.addMyCourse(input);
			output= myCourseService.getMyCoursePost(input);
		} catch (Exception e) {
			webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		return webHelper.redirect(contextPath+"commPage/comm_myCourseDetail.do"+"?mycourse_no="+output.getMycourse_no(), "작성되었습니다.");

	}
	/*
	 * 나만의코스 작성을 위한 List형태의 좌표값을 json으로 전달한다.
	 */
	@RequestMapping(value = "/commPage/comm_myCourseGetLoc.do", method = RequestMethod.GET)
	public Map<String, Object> mycourseGetLoc(@RequestParam(value="course_name")String course_name) {
		/* 1) 코스 이름 조회하기 */
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		WalkLog input = new WalkLog();
		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setCourse_name(course_name);
		
		List<WalkLog> courseName = null;

		try {
			// 데이터 조회
			courseName = walkLogService.getLoc(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		// 3) json 데이터 전송처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseName", courseName);
		return webHelper.getJsonData(map);
	}
	
	/*
	 * comm_myPost
	 */
	@RequestMapping(value = "/commPage/comm_myPost.do", method = RequestMethod.GET)
	public String myPost(Model model) {

		return "commPage/comm_myPost";
	}
}