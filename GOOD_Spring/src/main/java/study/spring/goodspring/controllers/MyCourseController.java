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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.UploadItem;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.MyCourseLike;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkLog;
import study.spring.goodspring.service.MemberService;
import study.spring.goodspring.service.MyCourseLikeService;
import study.spring.goodspring.service.MyCourseService;
import study.spring.goodspring.service.MyPostService;
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
	@Autowired
	MyPostService myPostService;
	@Autowired
	MemberService memberService;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	@Autowired
	MyCourseLikeService myCourseLikeService;
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
	public ModelAndView mycourseDetail(Model model, @RequestParam(value = "mycourse_no") int mycourse_no) {

		/* 1) 데이터 조회하기 */
		MyCourses input = new MyCourses();
		input.setMycourse_no(mycourse_no);

		MyCourses output = null;
		Member member =null;
		
		//댓글 수 조회를 담기위한 Beans
		int total = 0;
		
		try {
			// 조회수 증가
			myCourseService.updateHits(input);
			// 데이터 조회
			output = myCourseService.getMyCourseItem(input);
			
			int userNo=output.getUser_info_user_no();
			member= memberService.selectItemByNo(userNo);
			
			// 마이포스트 댓글 수 조회
			total = myCourseService.getMyCourseCmtCount(input);
			
		} catch (Exception e) {
			webHelper.redirect(null, e.getLocalizedMessage());

		}

		/** 2) 글 작성자의 프로필 사진 썸네일 이미지 생성 */
		UploadItem photo = member.getUser_photo();
		if (photo != null) {
			try {
				String thumbPath = webHelper.createThumbnail(photo.getFilePath(), 150, 150, true);

				// 웹 상에서 접근할 수 있는 URL정보 등록
				photo.setFileUrl(webHelper.getUploadUrl(photo.getFilePath()));
				photo.setThumbnailUrl(webHelper.getUploadUrl(thumbPath));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		model.addAttribute("member", member);
		model.addAttribute("output", output);
		model.addAttribute("total", total);
		return new ModelAndView("commPage/comm_myCourseDetail");
	}
	/**
	 * 좋아요 검사
	 * @param mycourse_no
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value= "/commPage/comm_myCourseDetail/isLike", method = RequestMethod.POST)
	public Map<String, Object> isLike(@RequestParam(value="mycourse_no", defaultValue="0")int mycourse_no){
		Map<String, Object> map = new HashMap<String, Object>();
		/** 1) 현재 글의 좋아요 수*/
		try {
			int count=myCourseLikeService.selectLike(mycourse_no);
			map.put("count",count);
		} catch (Exception e1) {
			webHelper.getJsonWarning(e1.getLocalizedMessage());
		}
		/** 2)사용자가 좋아요를 했는지 검사*/
		//로그인 세션정보가 있으면 세션정보의 user_no와 
		//현재 mycourse_no로 좋아요 된 글인지 확인한다.
		if(webHelper.getSession("login_info")!=null) {
			Member loginInfo = (Member) webHelper.getSession("login_info");
			int user_no = loginInfo.getUser_no();
			MyCourseLike like=new MyCourseLike();
			like.setMycourse_no(mycourse_no);
			like.setUser_info_user_no(user_no);
			int isLike =0;
			
			try {
				isLike = myCourseLikeService.likeUniqueCheck(like);
			} catch (Exception e) {
				webHelper.getJsonWarning(e.getLocalizedMessage());
			}
			map.put("isLike", isLike );
		}else {
			map.put("isLike", 0);
		}
		
		return webHelper.getJsonData(map);
	}
	
	/*
	 * 좋아요 추가
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseDetail/addLike", method = RequestMethod.POST)
	public Map<String, Object> addLike(Model model, @RequestParam(value = "mycourse_no") int mycourse_no) {
		
		if(webHelper.getSession("login_info")==null) {
			webHelper.getJsonWarning("로그인 정보 없음");
		}else {
			Member loginInfo=(Member)webHelper.getSession("login_info");
			MyCourseLike input = new MyCourseLike();
			input.setMycourse_no(mycourse_no);
			input.setUser_info_user_no(loginInfo.getUser_no());
			try {
				myCourseLikeService.addLike(input);
			} catch (Exception e) {
				webHelper.getJsonWarning("좋아요 추가 실패");
			}
		}		
		return webHelper.getJsonData();
	}
	
	/*
	 * 좋아요 취소
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseDetail/deleteLike", method = RequestMethod.POST)
	public Map<String, Object> deleteLike(Model model, @RequestParam(value = "mycourse_no") int mycourse_no) {
		
		if(webHelper.getSession("login_info")==null) {
			webHelper.getJsonWarning("로그인 정보 없음");
		}else {
			Member loginInfo=(Member)webHelper.getSession("login_info");
			MyCourseLike input = new MyCourseLike();
			input.setMycourse_no(mycourse_no);
			input.setUser_info_user_no(loginInfo.getUser_no());
			try {
				myCourseLikeService.deleteLike(input);
			} catch (Exception e) {
				webHelper.getJsonWarning("좋아요 취소 실패");
			}
		}		
		return webHelper.getJsonData();
	}

	/*
	 * comm_myCourseEdit 나만의 코스 수정 페이지
	 */
	@RequestMapping(value = "/commPage/comm_myCourseEdit.do", method = RequestMethod.GET)
	public ModelAndView mycourseEdit(Model model, @RequestParam(value = "mycourse_no") int mycourse_no) {
		/* 1) 로그인 세션정보 검사 */
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		WalkLog input = new WalkLog();
		input.setUser_info_user_no(loginInfo.getUser_no());

		List<WalkLog> courseName = null;
		/* 2) 사용자의 걷기로그 중 코스 이름이 없는 값을 지운다. */
		try {
			walkLogService.deleteNull(input);
		} catch (Exception e1) {
			return webHelper.redirect(null, e1.getLocalizedMessage());
		}
		/* 3) 현재 코스 글 정보 조회 */
		MyCourses mycourseInput = new MyCourses();
		mycourseInput.setMycourse_no(mycourse_no);
		MyCourses output = null;

		try {
			output = myCourseService.getMyCourseItem(mycourseInput);

			// 로그인된 사용자의 정보와 코스 작성자가 같을 경우만 연결시킨다.
			if (loginInfo.getUser_no() != output.getUser_info_user_no()) {
				webHelper.redirect(null, "코스 작성자만 수정가능합니다.");
			}
			// 지도 정보를 위한 코스이름 데이터 조회
			courseName = walkLogService.getCourseName(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// 3) View 처리
		model.addAttribute("courseName", courseName);
		model.addAttribute("output", output);
		return new ModelAndView("commPage/comm_myCourseEdit");
	}

	/*
	 * 나만의코스 수정 action 페이지.
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseEditOk", method = RequestMethod.POST)
	public Map<String, Object> mycourseEditOk(Model model, 
			@RequestParam(value = "mycourse_name") String mycourse_name,
			@RequestParam(value = "mycourse_area") String mycourse_area,
			@RequestParam(value = "mycourse_content") String mycourse_content) {
		Member loginInfo = ((Member) webHelper.getSession("login_info"));
		if (mycourse_area == null || mycourse_area == "") {
			return webHelper.getJsonWarning("지역을 선택해주세요.");
		}
		if (mycourse_content == null || mycourse_content == "") {
			return webHelper.getJsonWarning("내용을 입력해주세요.");
		}
		MyCourses input = new MyCourses();
		input.setMycourse_name(mycourse_name);
		input.setMycourse_area(mycourse_area);
		input.setMycourse_content(mycourse_content);
		input.setUser_info_user_no(loginInfo.getUser_no());
		MyCourses output = null;

		try {
			// 데이터 수정하기
			myCourseService.editMyCourse(input);
			output = myCourseService.getMyCoursePost(input);
		} catch (Exception e) {
			webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("output", output);
		return webHelper.getJsonData(map);

	}

	/*
	 * 나만의코스 작성 페이지.
	 */
	@RequestMapping(value = "/commPage/comm_myCourseWrite.do", method = RequestMethod.GET)
	public ModelAndView mycourseWrite(Model model) {
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		WalkLog input = new WalkLog();
		input.setUser_info_user_no(loginInfo.getUser_no());
		
		/* 1) 사용자의 걷기로그 중 코스 이름이 없는 값을 지운다. */
		try {
			walkLogService.deleteNull(input);
		} catch (Exception e1) {
			return webHelper.redirect(null, e1.getLocalizedMessage());
		}

		/* 2) 코스 이름 조회하기 */
		List<WalkLog> courseName = null;
		try {
			// 데이터 조회
			courseName = walkLogService.getCourseName(input);
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
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseWriteOk", method = RequestMethod.POST)
	public Map<String, Object> mycourseWriteOk(Model model, 
			@RequestParam(value = "mycourse_name") String mycourse_name,
			@RequestParam(value = "mycourse_area") String mycourse_area,
			@RequestParam(value = "mycourse_content") String mycourse_content) {
		if (mycourse_name == null || mycourse_name == "") {
			return webHelper.getJsonWarning("코스를 선택해주세요.");
		}
		if (mycourse_area == null || mycourse_area == "") {
			return webHelper.getJsonWarning("지역을 선택해주세요.");
		}
		if (mycourse_content == null || mycourse_content == "") {
			return webHelper.getJsonWarning("내용을 입력해주세요.");
		}

		Member loginInfo = ((Member) webHelper.getSession("login_info"));

		MyCourses input = new MyCourses();
		input.setMycourse_name(mycourse_name);
		input.setMycourse_area(mycourse_area);
		input.setMycourse_content(mycourse_content);
		input.setUser_info_user_no(loginInfo.getUser_no());
		MyCourses output = null;
		
		boolean isUnique;
		try {
			isUnique=myCourseService.courseUniqueChk(input);
			if(isUnique) {
				return webHelper.getJsonError("이미 작성된 코스입니다. 다른 코스를 선택해주세요.");
			}
			// 데이터 추가하기
			output = myCourseService.addMyCourse(input);
					} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("output", output);
		return webHelper.getJsonData(map);
	}

	/*
	 * 나만의코스 작성을 위한 List형태의 좌표값을 json으로 전달한다.
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseGetLoc", method = RequestMethod.POST)
	public Map<String, Object> mycourseGetLoc(@RequestParam(value = "course_name") String course_name) {
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
	 * 나만의코스 상세페이지를 위한 List형태의 좌표값을 json으로 전달한다.
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseDetailGetLoc", method = RequestMethod.POST)
	public Map<String, Object> mycourseDetailGetLoc(@RequestParam(value = "course_name") String course_name) {
		/* 1) 코스 이름으로 좌표값 조회하기 */
		WalkLog input = new WalkLog();
		input.setCourse_name(course_name);

		List<WalkLog> courseName = null;

		try {
			// 데이터 조회
			courseName = walkLogService.getLoc2(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		// 3) json 데이터 전송처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseName", courseName);
		return webHelper.getJsonData(map);
	}

	/*
	 * 나만의코스 리스트페이지를 위한 List형태의 좌표값을 json으로 전달한다.
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseListGetLoc", method = RequestMethod.POST)
	public Map<String, Object> mycourseListGetLoc(@RequestParam(value = "mycourse_no") int mycourse_no) {

		/* 1) 코스 번호로 작성자번호와 코스 이름을 가져오기 위해 객체 생성. */
		MyCourses mycourse = new MyCourses();
		mycourse.setMycourse_no(mycourse_no);

		/* 2) 코스 번호로 작성자번호와 코스 이름을 가져온다. */
		MyCourses mycourse_result = null;
		try {
			mycourse_result = myCourseService.getMyCourseItem(mycourse);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		int user_no = mycourse_result.getUser_info_user_no();
		String course_name = mycourse_result.getMycourse_name();

		/* 3) 유저 번호와 코스 이름으로 좌표값 조회하기 */
		WalkLog input = new WalkLog();
		input.setCourse_name(course_name);
		input.setUser_info_user_no(user_no);

		// 좌표값을 담을 List 객체
		List<WalkLog> courseName = null;

		try {
			// 데이터 조회
			courseName = walkLogService.getLoc(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		// 4) json 데이터 전송처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("courseName", courseName);
		return webHelper.getJsonData(map);
	}

	/**
	 * 나만의코스 삭제 처리 action 페이지
	 * 
	 * @param mycourse_no 나만의코스 글번호
	 * @return ModelAndView
	 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_myCourseDeleteOk", method = RequestMethod.GET)
	public Map<String, Object> mycourseDeleteOk(Model model, @RequestParam(value = "mycourse_no") int mycourse_no) {
		// 삭제처리를 위한 객체 준비
		MyCourses input = new MyCourses();
		input.setMycourse_no(mycourse_no);
		MyCourses output = null;
		// 현재 사용자 정보 조회
		Member loginInfo = ((Member) webHelper.getSession("login_info"));

		try {
			// 로그인된 사용자의 정보와 코스 작성자가 같을 경우만 연결시킨다.
			output = myCourseService.getMyCourseItem(input);
			if (loginInfo.getUser_no() != output.getUser_info_user_no()) {
				return webHelper.getJsonWarning("코스 작성자만 삭제가능합니다.");
			} else {
				// 삭제처리
				myCourseService.deleteMyCourse(input);
			}
		} catch (Exception e) {
			webHelper.redirect(null, e.getLocalizedMessage());
		}
		return webHelper.getJsonData();

	}

	/*
	 * comm_myPost 내가 쓴 글 페이지
	 */
	@RequestMapping(value = "/commPage/comm_myPost.do", method = RequestMethod.GET)
	public ModelAndView myPost(Model model) {
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if (loginInfo == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}
		int user_no = loginInfo.getUser_no();

		List<MyCourses> mycourse = null;
		List<CrewPost> crewpost = null;
		List<Object> list=null;
		try {
			mycourse = myPostService.getMyCoursePost(user_no);
			crewpost = myPostService.getCrewPost(user_no);
			
			list = myPostService.sortPost(mycourse, crewpost);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		model.addAttribute("list", list);
		return new ModelAndView("commPage/comm_myPost");
	}
}