package study.spring.goodspring.controllers;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.WalkCourseService;




@Controller

public class WalkController {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	WalkCourseService walkCourseService; // 코스목록
	
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/**
	 * 걷기페이지 메인 메서드
	 */
	@RequestMapping(value = "/walkPage/walk_index.do", method = RequestMethod.GET)
		public String walk_index(Model model, HttpServletRequest request, HttpServletResponse response) {
			// walkPage/walk_index.jsp파일을 View로 지정 
			return "walkPage/walk_index";
		}
	
	@RequestMapping(value="/walkPage/walk_hallOfFame.do", method=RequestMethod.GET)
	public String walk_hallOfFame(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_hallOfFame.jsp파일을 View로 지정
		return "walkPage/walk_hallOfFame";
	}
	
	@RequestMapping(value="/walkPage/walk_search.do", method=RequestMethod.GET)
	public String walk_search(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value="keyword", required=false) String keyword,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		// [페이지네이션] 변수 객체 추가
		int totalCount = 0;
		int listCount = 10;
		int pageCount = 5;
		PageData pageData = null;
		// [페이지네이션] 변수 객체 추가 (종료)
		
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		WalkCourse input = new WalkCourse();
		input.setCrs_name(keyword);
		input.setArea(keyword);
		input.setType(keyword);
		input.setDistance(keyword);
		input.setLevel(keyword);
		
		List<WalkCourse> output = null; //조회 결과가 저장될 객체
       
		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = walkCourseService.getWalkCourseCount(null);
			// 데이터 조회하기
			output = walkCourseService.getWalkCourseList(input);
		} catch (Exception e) {e.printStackTrace();}
		
		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		// walkPage/walk_search.jsp파일을 View로 지정
		return "walkPage/walk_search";
	}
	
	@RequestMapping(value="/walkPage/walk_log.do", method=RequestMethod.GET)
	public String walk_log(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_log.jsp파일을 View로 지정
		return "walkPage/walk_log";
	}
	
	

	
	
}








