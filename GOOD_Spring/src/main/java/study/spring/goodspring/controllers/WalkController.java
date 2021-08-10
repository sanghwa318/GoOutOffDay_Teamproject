package study.spring.goodspring.controllers;

import java.util.ArrayList;
import java.util.HashMap;
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
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.BookMark;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.model.WalkLog;
import study.spring.goodspring.model.WalkSetGoal;
import study.spring.goodspring.service.BookMarkService;
import study.spring.goodspring.service.WalkCourseService;
import study.spring.goodspring.service.WalkLogService;
import study.spring.goodspring.service.WalkSetGoalService;

@Controller
public class WalkController {

	/** Service 패턴 구현체 주입 */
	@Autowired
	WalkCourseService walkCourseService; // 코스목록
	@Autowired
	BookMarkService bookmarkService; // 코스목록
	@Autowired
	WebHelper webHelper;
	@Autowired
	WalkLogService walkLogService; // 걷기기록하기
	@Autowired
	WalkSetGoalService walkSetGoalService;
	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/**
	 * 걷기페이지 메인 메서드
	 */
	@RequestMapping(value = "/walkPage/walk_index.do", method = RequestMethod.GET)
	public ModelAndView walk_index(Model model, HttpServletResponse response) {

		List<WalkCourse> output = null;

		try {
			output = walkCourseService.getWalkCourseRandomList(null);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("output", output);
		// walkPage/walk_index.jsp파일을 View로 지정
		return new ModelAndView("walkPage/walk_index");
	}

	/**
	 * 걷기 기록하기로 얻어진 위,경도값을 db에 저장하기 위한 가상의 페이지
	 * 
	 * @param wat_latitude  watchposition 함수로 얻어지는 위도 값
	 * @param wat_longitude watchposition 함수로 얻어지는 경도 값
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_record.do", method = RequestMethod.POST)
	public Map<String, Object> walkRecord(
			@RequestParam(value = "wat_latitude") String wat_latitude,
			@RequestParam(value = "wat_longitude") String wat_longitude,
			@RequestParam(value = "wat_timestamp") long wat_timestamp, 
			@RequestParam(value = "count") int count) {
		WalkLog input = new WalkLog();
		Member loginInfo = (Member) webHelper.getSession("login_info");

		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setLat(wat_latitude);
		input.setLon(wat_longitude);
		input.setWalking_time(wat_timestamp);

		try {
			if (count == 0) {
				walkLogService.startRecord(input);
			} else if (count != 0) {
				walkLogService.addWalkLog(input);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return webHelper.getJsonData();
	}

	/**
	 * 걷기 기록하기를 중지를 위한 가상의 페이지. 가장 마지막 로그의 event_name을 종료로 바꾼다.
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_recordEnd.do", method = RequestMethod.POST)
	public Map<String, Object> walkRecordEnd(@RequestParam(value = "course_name") String course_name) {
		if (course_name != null) {
			WalkLog input = new WalkLog();
			Member loginInfo = (Member) webHelper.getSession("login_info");

			input.setUser_info_user_no(loginInfo.getUser_no());
			input.setCourse_name(course_name);
			try {
				walkLogService.endRecord(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				walkLogService.updateCourseName(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			webHelper.redirect(null, "코스 이름을 입력하세요.");
		}
		return webHelper.getJsonData();
	}

	/**
	 * 코스 이름 중복검사
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_courseNameUniqueCheck.do", method = RequestMethod.POST)
	public Map<String, Object> courseNameUniqueCheck(@RequestParam(value = "course_name") String course_name) {

		WalkLog input = new WalkLog();
		Member loginInfo = (Member) webHelper.getSession("login_info");

		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setCourse_name(course_name);
		Map<String, Object> map = new HashMap<String, Object>();
		String result = "true";
		try {
			int count=walkLogService.courseNameUniqueCheck(input);
			if(count>0) {
				return webHelper.getJsonWarning("중복된 코스이름입니다. 다시 입력해주세요.");				
			}
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		map.put("result", result);
		return webHelper.getJsonData(map);
	}

	@RequestMapping(value = "/walkPage/walk_hallOfFame.do", method = RequestMethod.GET)
	public String walk_hallOfFame(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_hallOfFame.jsp파일을 View로 지정
		return "walkPage/walk_hallOfFame";
	}

	/**
	 * 걷기(코스) 상세 페이지
	 * 
	 * @param CPI_IDX  코스목록 기본키
	 * @return
	 */
	@RequestMapping(value = "/walkPage/walk_detailCourse.do", method = RequestMethod.GET)
	public ModelAndView walk_detailCourse(Model model, HttpServletRequest request, HttpServletResponse response,
			// 포인트 지점(기본키)
			@RequestParam(value = "CPI_IDX") int CPI_IDX) {

		// 데이터 조회에 필요한 값을 beans에 전달
		WalkCourse input = new WalkCourse();
		input.setCPI_IDX(CPI_IDX);

		// 조회 결과를 저장할 객체 선언
		WalkCourse output = null;
		BookMark bookinput = new BookMark();
		List<WalkCourse> output_path = null;
		int outputcount = 0;

		if (request.getSession().getAttribute("login_info") == null) {

			
			try {
				output = walkCourseService.getWalkCourseItem(input);
				bookinput.setCategory_id(output.getCOURSE_CATEGORY_NM());
				bookinput.setService_id(output.getCOURSE_NAME());
				output_path = walkCourseService.getWalkCoursePath(input);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			Member loginInfo = (Member) webHelper.getSession("login_info");
			bookinput.setUser_info_user_no(loginInfo.getUser_no());

			try {
				output = walkCourseService.getWalkCourseItem(input);
				bookinput.setCategory_id(output.getCOURSE_CATEGORY_NM());
				bookinput.setService_id(output.getCOURSE_NAME());
				outputcount = bookmarkService.BookMarkUniqueCheck(bookinput);
				output_path = walkCourseService.getWalkCoursePath(input);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		// view 처리
		model.addAttribute("output", output);
		model.addAttribute("outputcount", outputcount);
		model.addAttribute("output_path", output_path);

		// walkPage/walk_detailCourse.jsp파일을 View로 지정
		return new ModelAndView("/walkPage/walk_detailCourse");
	}

	/**
	 * 걷기(코스) 목록 페이지
	 * 
	 * @param keyword  검색어
	 * @param category 코스분류 카테고리
	 * @param area     지역구 카테고리
	 * @param order    정렬 카테고리
	 * @param nowPage  페이지네이션
	 * @return
	 */
	@RequestMapping(value = "/walkPage/walk_search.do", method = RequestMethod.GET)
	public ModelAndView walk_search(Model model, HttpServletResponse response,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 유형별(코스카테고리별)
			@RequestParam(value = "category", required = false) String category,
			// 지역별(코스카테고리별)
			@RequestParam(value = "area", required = false) String area,
			// 정렬(코스카테고리별)
			@RequestParam(value = "order", required = false) String order,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)
		
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		WalkCourse input = new WalkCourse();
		input.setSOUTH_NORTH_DIV_NM(keyword);
		input.setLEAD_TIME(keyword);
		input.setCOURSE_LEVEL(keyword);
		input.setRELATE_SUBWAY(keyword);
		input.setCOURSE_NAME(keyword);
		input.setCPI_NAME(keyword);
//		input.setDISTANCE(keyword);
//		input.setTRAFFIC_INFO(keyword);

		// 유형별(코스카테고리별)
		input.setCOURSE_CATEGORY_NM(category);
		// 지역별(코스카테고리별)
		input.setAREA_GU(area);
		// 정렬(코스카테고리별)
		input.setOrder(order);

		List<WalkCourse> output = null; // 조회 결과가 저장될 객체
		List<List<WalkCourse>> output_path_item = new ArrayList<List<WalkCourse>>(); // 조회 결과가 저장될 객체

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
			for (int i=0; i<output.size(); i++) {
				String input_path = output.get(i).getCOURSE_NAME();
				WalkCourse item = new WalkCourse();
				item.setCOURSE_NAME(input_path);
				List<WalkCourse> input_list = walkCourseService.getWalkCourseCourseName(item);
				output_path_item.add(input_list);
				// rowspan을 하기위한 포인트 개수
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("output_path_item", output_path_item);
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		model.addAttribute("area", area);
		model.addAttribute("order", order);
		model.addAttribute("totalCount", totalCount);
		// [페이지네이션]
		model.addAttribute("pageData", pageData);
		// walkPage/walk_search.jsp파일을 View로 지정
		return new ModelAndView("walkPage/walk_search");
	}

	/**
	 * 코스상세 아이템 찜하기
	 * 
	 * @throws Exception
	 **/
	@ResponseBody
	@RequestMapping(value = "/walkPage/BookMark", method = RequestMethod.POST)
	public Map<String, Object> eddBookMark(@RequestParam(value = "svcid", required = false) String svcid,
			@RequestParam(value = "catid", required = false) String catid) throws Exception {

//		int intset = Integer.parseInt(svcid);
		BookMark input = new BookMark();
		Member loginInfo = (Member) webHelper.getSession("login_info");

		WalkCourse Info = new WalkCourse();
		Info.setCOURSE_CATEGORY_NM(catid);
		Info.setCOURSE_NAME(svcid);
//		String stsvcid = Integer.toString(Info.getCPI_IDX());

		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setCategory_id(Info.getCOURSE_CATEGORY_NM());
		input.setService_id(Info.getCOURSE_NAME());

		try {
			// 추가 삭제 구문
			if (bookmarkService.BookMarkUniqueCheck(input) == 1) {
				bookmarkService.deleteBookMark(input);
			} else if (bookmarkService.BookMarkUniqueCheck(input) == 0) {
				bookmarkService.addBookMark(input);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return webHelper.getJsonData();

	}

	/**
	 * 걷기 Log 페이지
	 * 
	 */
	@RequestMapping(value = "/walkPage/walk_log.do", method = RequestMethod.GET)
	public ModelAndView walk_log(Model model) {
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		/* 1) 사용자의 걷기로그 중 코스 이름이 없는 값을 지운다. */
		WalkLog input = new WalkLog();
		input.setUser_info_user_no(loginInfo.getUser_no());
		try {
			walkLogService.deleteNull(input);
		} catch (Exception e1) {
			return webHelper.redirect(null, e1.getLocalizedMessage());
		}
		
		return new ModelAndView("walkPage/walk_log");
	}
	
	/**
	 * 걷기 log의 하위 페이지 myLog
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_myLog.do", method = RequestMethod.GET)
	public ModelAndView walk_myLog(Model model) {
		//사용자 정보조회
		WalkLog input = new WalkLog();
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		input.setUser_info_user_no(loginInfo.getUser_no());
		//조회된 값을 담을 객체 준비
		List<WalkLog> walklog = null;
		List<WalkLog> locList = null;
		//사용자의 걸은 거리와 걸은 시간이 담길 변수
		double distance = 0;
		long time = 0;
		try {
			//사용자가 기록한 코스이름을 조회
			walklog = walkLogService.getCourseName(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (walklog != null) {
			double tmp = 0;
			//사용자가 기록한 코스 수 만큼, 거리와 시간 계산을 반복하고,
			//거리와 시간을 누적시킨다.
			for (int i = 0; i < walklog.size(); i++) {
				
				String course_name = walklog.get(i).getCourse_name();
				input.setCourse_name(course_name);
				
				try {
					WalkLog tmp_time=walkLogService.getTime(input);
					time+=tmp_time.getTime();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				try {
					locList = walkLogService.getLatLonList(input);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (locList != null) {
					for (int j = 0; j < locList.size() - 1; j++) {
						double fromlat = Double.parseDouble(locList.get(j).getLat());
						double fromlon = Double.parseDouble(locList.get(j).getLon());
						double tolat = Double.parseDouble(locList.get(j + 1).getLat());
						double tolon = Double.parseDouble(locList.get(j + 1).getLon());

						tmp += walkLogService.distance(fromlat, fromlon, tolat, tolon, "meter");
					}
				}

			}
			distance = tmp;
		}
		
		//view 처리
		model.addAttribute("time", time);
		model.addAttribute("distance", distance);
		return new ModelAndView("/walkPage/walk_myLog");
	}
	
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_logCompare.do", method = RequestMethod.GET)
	public ModelAndView walk_logCompare(Model model) {
		//사용자 정보조회
		WalkLog input = new WalkLog();
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		input.setUser_info_user_no(loginInfo.getUser_no());
		//조회된 값을 담을 객체 준비
		List<WalkLog> walklog = null;
		List<WalkLog> locList = null;
		//사용자의 걸은 거리와 걸은 시간이 담길 변수
		double distance = 0;
		long time = 0;
		try {
			//사용자가 기록한 코스이름을 조회
			walklog = walkLogService.getCourseName(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (walklog != null) {
			double tmp = 0;
			//사용자가 기록한 코스 수 만큼, 거리와 시간 계산을 반복하고,
			//거리와 시간을 누적시킨다.
			for (int i = 0; i < walklog.size(); i++) {
				
				String course_name = walklog.get(i).getCourse_name();
				input.setCourse_name(course_name);
				
				try {
					WalkLog tmp_time=walkLogService.getTime(input);
					time+=tmp_time.getTime();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				try {
					locList = walkLogService.getLatLonList(input);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (locList != null) {
					for (int j = 0; j < locList.size() - 1; j++) {
						double fromlat = Double.parseDouble(locList.get(j).getLat());
						double fromlon = Double.parseDouble(locList.get(j).getLon());
						double tolat = Double.parseDouble(locList.get(j + 1).getLat());
						double tolon = Double.parseDouble(locList.get(j + 1).getLon());

						tmp += walkLogService.distance(fromlat, fromlon, tolat, tolon, "meter");
					}
				}

			}
			distance = tmp;
		}
		/**DB에 있는 전체 walklog에 대한 거리와 시간 계산.*/
		//조회된 값을 담을 객체 준비
		List<WalkLog> walklog_all = null;
		List<WalkLog> locList_all = null;
		//전체사용자의 걸은 거리와 걸은 시간이 담길 변수
		double dist_all=0;
		long time_all=0;
		try {
			walklog_all=walkLogService.getCourseName();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(walklog_all !=null) {
			double tmp2 = 0;
			long tmp_time=0;
			//코스 수 만큼, 거리와 시간 계산을 반복하고,
			//거리와 시간을 누적시킨다.
			for (int i = 0; i < walklog_all.size(); i++) {
				
				String course_name = walklog_all.get(i).getCourse_name();
				input.setCourse_name(course_name);
				
				try {
					tmp_time+=walkLogService.getTime(input).getTime();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				try {
					locList_all = walkLogService.getLatLonList(input);
				} catch (Exception e) {
					e.printStackTrace();
				}
				if (locList != null) {
					for (int j = 0; j < locList_all.size() - 1; j++) {
						double fromlat = Double.parseDouble(locList_all.get(j).getLat());
						double fromlon = Double.parseDouble(locList_all.get(j).getLon());
						double tolat = Double.parseDouble(locList_all.get(j + 1).getLat());
						double tolon = Double.parseDouble(locList_all.get(j + 1).getLon());

						tmp2 += walkLogService.distance(fromlat, fromlon, tolat, tolon, "meter");
					}
				}

			}
			int usercount = 0;
			try {
				usercount = walkLogService.getUserNoList().size();
			} catch (Exception e) {
				webHelper.redirect(null, e.getLocalizedMessage());
			}
			//누적값을 기록하기 서비스를 이용한 회원 수로 나누어 평균을 구한다.
			time_all = tmp_time/usercount;
			dist_all = tmp2/usercount;
		}
		
		//view 처리
		model.addAttribute("time_all", time_all);
		model.addAttribute("dist_all", dist_all);
		model.addAttribute("time", time);
		model.addAttribute("distance", distance);
		return new ModelAndView("walkPage/walk_logCompare");
	}

	@RequestMapping(value = "/walkPage/walk_logSetGoal.do", method = RequestMethod.GET)
	public ModelAndView walk_logSetGoal(Model model
			) {
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		int userNo=loginInfo.getUser_no();
		WalkSetGoal input = new WalkSetGoal();
		input.setUser_info_user_no(userNo);
		
		WalkSetGoal output = null;
		List<WalkSetGoal> outputList = null;
		
		

		
		//사용자의 걸은 거리와 걸은 시간이 담길 변수
		double distance = 0;
		long time = 0;
		
		try {
			//사용자 목표 데이터 중 가장 최근의 데이터를 조회
			output = walkSetGoalService.getGoalItem(input);
			
			outputList = walkSetGoalService.getGoalList(input); //사용자가 추가한 목표 전체 리스트
			
			//사용자가 기록한 코스 중 목표 기간에 해당하는 데이터를 조회			
			List<WalkLog> walkLog =null; //코스이름이 담길 list
			List<WalkLog> locList = null; //거리계산을 위한 좌표값을 담을 List
			WalkLog input_courseName = new WalkLog();
			input_courseName.setUser_info_user_no(userNo);
			
			//코스이름 추출
			walkLog = walkLogService.getCnInTerm(input_courseName);
			
			//받아온 코스이름에서 시간과 거리계산
			if (walkLog != null) {
				double tmp = 0;
				//사용자가 기록한 코스 수 만큼, 거리와 시간 계산을 반복하고,
				//거리와 시간을 누적시킨다.
				for (int i = 0; i < walkLog.size(); i++) {
					
					String course_name = walkLog.get(i).getCourse_name();
					input_courseName.setCourse_name(course_name);
					
					try {
						WalkLog tmp_time=walkLogService.getTime(input_courseName);
						time+=tmp_time.getTime();
					} catch (Exception e1) {
						e1.printStackTrace();
					}
					
					try {
						locList = walkLogService.getLatLonList(input_courseName);
					} catch (Exception e) {
						e.printStackTrace();
					}
					if (locList != null) {
						for (int j = 0; j < locList.size() - 1; j++) {
							double fromlat = Double.parseDouble(locList.get(j).getLat());
							double fromlon = Double.parseDouble(locList.get(j).getLon());
							double tolat = Double.parseDouble(locList.get(j + 1).getLat());
							double tolon = Double.parseDouble(locList.get(j + 1).getLon());

							tmp += walkLogService.distance(fromlat, fromlon, tolat, tolon, "meter");
						}
					}

				}
				distance = tmp;
			}
			
			// walk_setgoal 테이블의 성취율 업데이트
			int setgoal_time=output.getSetgoal_time()*60;
			int setgoal_distance=output.getSetgoal_distance()*1000;
			
			input.setTime_achieve((float)(time/setgoal_time));
			input.setDistance_achieve((float) (distance/setgoal_distance));
			output = walkSetGoalService.editAchieve(input);
			
		} catch (Exception e) {
			webHelper.redirect(null, e.getLocalizedMessage());
		}
		model.addAttribute("time", time);
		model.addAttribute("distance", distance);
		model.addAttribute("goalList", outputList);
		model.addAttribute("goalItem", output);
		return new ModelAndView("walkPage/walk_logSetGoal");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_logSetGoalOk.do", method = RequestMethod.POST)
	public Map<String, Object> walk_logSetGoalOk(Model model,
			@RequestParam(value="setgoal_day", defaultValue="0")int setgoal_day, //기간
		@RequestParam(value="setgoal_distance",defaultValue="0")int setgoal_distance, //목표거리
		@RequestParam(value="setgoal_time",defaultValue="0")int setgoal_time //목표시간
			) {
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		if(setgoal_day==0) {
			webHelper.redirect(null, "기간을 설정해주세요.");
		}
		if(setgoal_distance==0) {
			webHelper.redirect(null, "목표 거리를 설정해주세요.");
		}
		if(setgoal_time==0) {
			webHelper.redirect(null, "목표 시간을 설정해주세요.");
		}
		
		WalkSetGoal input = new WalkSetGoal();
		input.setUser_info_user_no(loginInfo.getUser_no());
		input.setSetgoal_day(setgoal_day);
		input.setSetgoal_distance(setgoal_distance);
		input.setSetgoal_time(setgoal_time);
		
		try {
			walkSetGoalService.addGoalItem(input);
		} catch (Exception e) {
			webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.getJsonData();
	}
	
	/**
	 * 걷기 코스 지도
	 */
	@ResponseBody
	@RequestMapping(value = "/walkPage/walk_map.do", method = RequestMethod.GET)
	public Map<String, Object> walk_map(
			@RequestParam(value="courseName")String course_name) {
		WalkCourse input = new WalkCourse();
		input.setCOURSE_NAME(course_name);
		List<WalkCourse> output = null;
		
		try {
			output = walkCourseService.getWalkCourseMapList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	}
}
