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

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.model.WalkLog;
import study.spring.goodspring.service.WalkCourseService;
import study.spring.goodspring.service.WalkLogService;




@Controller

public class WalkController {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	WalkCourseService walkCourseService; // 코스목록
	@Autowired
	WebHelper webHelper;
	@Autowired
	WalkLogService walkLogService; //걷기기록하기
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
	/**
	 * 걷기 기록하기로 얻어진 위,경도값을 db에 저장하기 위한 가상의 페이지
	 * @param wat_latitude watchposition 함수로 얻어지는 위도 값
	 * @param wat_longitude watchposition 함수로 얻어지는  경도 값
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_record.do", method = RequestMethod.POST)
	public Map<String, Object> walkRecord(
			@RequestParam(value="wat_latitude")double wat_latitude,
			@RequestParam(value="wat_longitude")double wat_longitude,
			@RequestParam(value="wat_timestamp")long wat_timestamp,
			@RequestParam(value="count")int count
			) {
		WalkLog input = new WalkLog();
		Member loginInfo = (Member) webHelper.getSession("login_info");
		
		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setLat(wat_latitude);
		input.setLon(wat_longitude);
		input.setWalking_time(wat_timestamp);
		
		try {
			if(count==0) {
				walkLogService.startRecord(input);
			}else if(count!=0) {
			walkLogService.addWalkLog(input);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return webHelper.getJsonData();
	}
	
	/**
	 * 걷기 기록하기로 얻어진 위,경도값을 db에 저장하기 위한 가상의 페이지
	 * @param wat_latitude watchposition 함수로 얻어지는 위도 값
	 * @param wat_longitude watchposition 함수로 얻어지는  경도 값
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_recordEnd.do", method = RequestMethod.POST)
	public Map<String, Object> walkRecordEnd() {
		WalkLog input = new WalkLog();
		Member loginInfo = (Member) webHelper.getSession("login_info");
		
		input.setUser_info_user_no(loginInfo.getUser_no());
		
		try {
				walkLogService.endRecord(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return webHelper.getJsonData();
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
			// 유형별(코스카테고리별)
			@RequestParam(value="category", required=false) String category,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value="page", defaultValue="1") int nowPage) {
		
		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)
		
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		WalkCourse input = new WalkCourse();
		input.setCOURSE_CATEGORY_NM(keyword);
		input.setSOUTH_NORTH_DIV_NM(keyword);
		input.setAREA_GU(keyword);
		input.setDISTANCE(keyword);
		input.setLEAD_TIME(keyword);
		input.setCOURSE_LEVEL(keyword);
		input.setRELATE_SUBWAY(keyword);
		input.setTRAFFIC_INFO(keyword);
		input.setCOURSE_NAME(keyword);
		input.setCPI_NAME(keyword);

		// 유형별(코스카테고리별)
		input.setCOURSE_CATEGORY_NM(category);
		
		List<WalkCourse> output = null; //조회 결과가 저장될 객체
       
		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = walkCourseService.getWalkCourseCount(input);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
			WalkCourse.setOffset(pageData.getOffset());
			WalkCourse.setListCount(pageData.getListCount());
			
			// 데이터 조회하기
			output = walkCourseService.getWalkCourseList(input);
		} catch (Exception e) {e.printStackTrace();}
		
		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("keyword", keyword);
		// [페이지네이션]
		model.addAttribute("pageData", pageData);
		// walkPage/walk_search.jsp파일을 View로 지정
		return "walkPage/walk_search";
	}
	
	@RequestMapping(value="/walkPage/walk_log.do", method=RequestMethod.GET)
	public String walk_log(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_log.jsp파일을 View로 지정
		return "walkPage/walk_log";
	}
	
	

	
	
}








