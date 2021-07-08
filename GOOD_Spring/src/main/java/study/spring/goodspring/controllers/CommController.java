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
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;

@Controller
public class CommController {
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	CrewService crewService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	
	
	/*
	 * comm_index
	 */
	@RequestMapping(value = "/commPage/comm_index.do", method = RequestMethod.GET)
	public String commindex(Model model) {
		
		return "commPage/comm_index";
	}
	
	/*
	 * comm_crew_bbs
	 */
	@RequestMapping(value = "/commPage/comm_crew_bbs.do", method = RequestMethod.GET)
	public String crewbbs(Model model) {
		
		return "commPage/comm_crew_bbs";
	}
	/*
	 * comm_crew_info
	 *  2) 상세페이지
	 */
	@RequestMapping(value = "/commPage/comm_crew_info.do", method = RequestMethod.GET)
	public String crewinfo(Model model) {
		
		return "commPage/comm_crew_info";
	}
	/*
	 * comm_crew_memberJoin
	 */
	@RequestMapping(value = "/commPage/comm_crew_memberJoin.do", method = RequestMethod.GET)
	public String crewmemberjoin(Model model) {
		
		return "commPage/comm_crew_memberJoin";
	}
	
	/*
	 * comm_crew_myCrew
	 */
	
	@RequestMapping(value = "/commPage/comm_crew_myCrew", method = RequestMethod.GET)
	public String mycrew(Model model) {
		
		return "commPage/comm_crew_myCrew";
	}
	
	/*
	 * comm_crew
	 * 1) 목록페이지
	 */
	
	@RequestMapping(value = "/commPage/comm_crew.do", method = RequestMethod.GET)
	public ModelAndView crew(Model model,
			//검색어
			@RequestParam(value="keyword", required=false) String keyword,
			//페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		//1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0;  // 전체 게시글 수
		int listCount = 5;   // 한 페이지당 표시할 항목 수
		int pageCount = 5;   // 한 그룹당 표시할 페이지 번호 수
		
		
		//2) 데이터 조회하기
		//조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();
		input.setCrew_name(keyword);
 		
		List<Crew> output = null; //조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체
		
		try {
			//전체 게시글 수 조회
			totalCount = crewService.getCrewCount(input);
			
			
			// 전체 게시글 수 조회
			output = crewService.getCrewList(input);
			
			//페이지 번호 계산 --> 계산 결과를 로그로 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			//SQL의 LIMIT절에서 사용될 값을 BEANS의 static 변수에 저장
			Crew.setOffset(pageData.getOffset());
			Crew.setListCount(pageData.getListCount());
			
			//데이터 조회하기
			output = crewService.getCrewList(input);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		//3) View 처리
		model.addAttribute("keyword",keyword);
		model.addAttribute("output",output);
		model.addAttribute("pageData", pageData);
		
		return new ModelAndView("commPage/comm_crew");
	}
	
	
	
	
	/*
	 * comm_myCourse
	 */
	@RequestMapping(value = "/commPage/comm_myCourse.do", method = RequestMethod.GET)
	public String mycourse(Model model) {
		
		return "commPage/comm_myCourse";
	}
	/*
	 * comm_myCourseDetail 
	 */
	@RequestMapping(value = "/commPage/comm_myCourseDetail.do", method = RequestMethod.GET)
	public String mycourseDetail(Model model) {
		
		return "commPage/comm_myCourseDetail";
	}
	/*
	 * comm_myCourseEdit
	 */
	@RequestMapping(value = "/commPage/comm_myCourseEdit.do", method = RequestMethod.GET)
	public String mycourseEdit(Model model) {
		
		return "commPage/comm_myCourseEdit";
	}
	/*
	 * comm_myCourseWrite
	 */
	@RequestMapping(value = "/commPage/comm_myCourseWrite.do", method = RequestMethod.GET)
	public String mycourseWrite(Model model) {
		
		return "commPage/comm_myCourseWrite";
	}
	/*
	 * comm_myPost
	 */
	@RequestMapping(value = "/commPage/comm_myPost.do", method = RequestMethod.GET)
	public String myPost(Model model) {
		
		return "commPage/comm_myPost";
	}
	

	
	
}
