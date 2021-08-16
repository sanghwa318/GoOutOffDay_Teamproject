package study.spring.goodspring.controllers;

import java.io.IOException;
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
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewMember;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.CrewPostLike;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.MyCourseLike;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.service.CrewMemberService;
import study.spring.goodspring.service.CrewPostLikeService;
import study.spring.goodspring.service.CrewPostService;
import study.spring.goodspring.service.CrewService;
import study.spring.goodspring.service.MemberService;
import study.spring.goodspring.service.MyCourseService;

@Controller
public class CommController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;
	
	@Autowired
	MemberService memberService;

	@Autowired
	CrewService crewService;

	@Autowired
	CrewPostService crewPostService;

	@Autowired
	CrewMemberService crewMemberService;
	
	@Autowired
	MyCourseService myCourseService;
	
	@Autowired
	CrewPostLikeService crewPostLikeService;
	
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/*
	 * comm_index
	 */
	@RequestMapping(value = "/commPage/comm_index.do", method = RequestMethod.GET)
	public ModelAndView commindex(Model model){
		
		// 나만의 코스 시작
		List<MyCourses> mycourses = null;
		
		// 크루 시작
		List<Crew> crew = null;
		
		try {
			// 데이터 조회하기
			crew = crewService.getCrewList(null);
			mycourses = myCourseService.getMyCourseList(null);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("crew", crew);
		model.addAttribute("mycourses", mycourses);

		return new ModelAndView("commPage/comm_index");
	}

	/*
	 * comm_crew_bbs
	 */
	@RequestMapping(value = "/commPage/comm_crew_bbs.do", method = RequestMethod.GET)
	public ModelAndView crewbbs(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			//크루번호
			@RequestParam(value = "crew_no", defaultValue = "0") int crew_no,
			//크루 이름
			@RequestParam(value = "crew_name", defaultValue = "0") String crew_name,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) throws Exception {

		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();

		// 1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0; // 전체 게시글 수
		int listCount = 8; // 한 페이지당 표시할 항목 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수


		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();
		input.setCrew_no(crew_no);
		input.setUser_info_user_no(userNo);
		input.setCrew_name(crew_name);

		// 조회결과가 저장될 객체
		Crew output = null;
		//크루 데이터 불러오기
		output = crewService.getCrewItem(input);

		

		CrewPost crewpost = new CrewPost();
		crewpost.setPost_title(keyword);
		crewpost.setPost_content(keyword);
		crewpost.setPost_crew(crew_name);
		
		List<CrewPost> crewpostoutput = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체
		

		try {
			// 전체 게시글 수 조회
			totalCount = crewPostService.getCrewPostCount(crewpost);
			// 전체 게시글 수 조회
			crewpostoutput = crewPostService.selectCrewPostList(crewpost);

			// 페이지 번호 계산 --> 계산 결과를 로그로 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 BEANS의 static 변수에 저장
			CrewPost.setOffset(pageData.getOffset());
			CrewPost.setListCount(pageData.getListCount());

			// 데이터 조회하기
			crewpostoutput = crewPostService.selectCrewPostList(crewpost);
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}


		// 3) View 처리
		model.addAttribute("output", output);  //크루정보 
		model.addAttribute("crewpostoutput", crewpostoutput);
		model.addAttribute("pageData", pageData);
		model.addAttribute("login_info", login_info);
		return new ModelAndView("commPage/comm_crew_bbs");

	}

	/*
	 * comm_crew_info
	 */
	@RequestMapping(value = "/commPage/comm_crew_info.do", method = RequestMethod.GET)
	public ModelAndView crewinfo(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "crew_no", defaultValue = "0") int crew_no) {

		Member login_info = (Member) webHelper.getSession("login_info");
		
		if (login_info == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}

		int userNo = login_info.getUser_no();

		// 1) 유효성 검사
		if (crew_no == 0) {
			return webHelper.redirect(null, "조회된 크루가 없습니다.");
		}

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();
		input.setCrew_no(crew_no);
		input.setUser_info_user_no(userNo);

		Crew output = null;

		try {
			// 데이터 조회하기
			output = crewService.getCrewItem(input);
			
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
		model.addAttribute("output", output);
		return new ModelAndView("commPage/comm_crew_info");
	}

	/*
	 * comm_crew_info_ok.do
	 */
	@RequestMapping(value = "/commPage/comm_crew_info_ok", method = RequestMethod.GET)
	public ModelAndView crewinfoOk(Model model,
			@RequestParam(value = "crew_no", defaultValue = "0") int crew_no,
			@RequestParam(value = "crew_name", defaultValue = "") String crew_name)
	{

		Member login_info = (Member) webHelper.getSession("login_info");

		int userNo = login_info.getUser_no();

		// 1)데이터 저장
		CrewMember input = new CrewMember();
		input.setUser_info_user_no(userNo);
		input.setCrew_crew_no(crew_no);
		input.setCrew_name(crew_name);

		Crew output = new Crew();
		output.setCrew_no(crew_no);
		
		try {
			if(crewMemberService.RegexCrewMemberList(input)) {
				return webHelper.redirect(null, "이미 가입된 크루입니다.");
			}
			// 데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값이 저장
			crewMemberService.addCrewMember(input);
			crewService.updateCrewMemberCount(output);
			

		} catch (Exception e) {
			e.getLocalizedMessage();
		}

		return webHelper.redirect(contextPath + "/commPage/comm_crew_bbs.do?crew_no=" + input.getCrew_crew_no() + "&crew_name=" + input.getCrew_name(), "가입되었습니다.");
	}

	/*
	 * comm_crew_myCrew
	 */

	@RequestMapping(value = "/commPage/comm_crew_myCrew.do", method = RequestMethod.GET)
	public ModelAndView mycrew(Model model,
			// 조건
			@RequestParam(value = "order", defaultValue = "1") int order,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		Member login_info = (Member) webHelper.getSession("login_info");

		if (login_info == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}

		int userNo = login_info.getUser_no();

		// 1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0; // 전체 게시글 수
		int listCount = 8; // 한 페이지당 표시할 항목 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();
		input.setUser_info_user_no(userNo);

		List<Crew> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = crewService.getJoinedCrewCount(input);

			// 전체 게시글 수 조회
			output = crewService.selectJoinedCrew(input);

			// 페이지 번호 계산 --> 계산 결과를 로그로 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 BEANS의 static 변수에 저장
			Crew.setOffset(pageData.getOffset());
			Crew.setListCount(pageData.getListCount());
			Crew.setOrder(order);

			// 데이터 조회하기
			output = crewService.selectJoinedCrew(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("commPage/comm_crew_myCrew");
	}

	/*
	 * comm_crew 1) 목록페이지
	 */

	@RequestMapping(value = "/commPage/comm_crew.do", method = RequestMethod.GET)
	public ModelAndView crew(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 지역 버튼
			@RequestParam(value = "crew_area", required = false) String region,
			// 조건 버튼
			@RequestParam(value = "order", defaultValue = "1") int order,
			// 크루 종류
			@RequestParam(value = "crew_category", required = false) String crew_category,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		
		// 1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0; // 전체 게시글 수
		int listCount = 8; // 한 페이지당 표시할 항목 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();

		input.setCrew_name(keyword);
		input.setCrew_sinto(keyword);
		input.setCrew_area(region);
		input.setCrew_category(crew_category);
		
		Member login_info = (Member) webHelper.getSession("login_info");
		
		List<Crew> output = null; // 조회결과가 저장될 객체
		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체

		try {
			// 전체 게시글 수 조회
			totalCount = crewService.getCrewCount(input);

			// 전체 게시글 수 조회
			output = crewService.getCrewList(input);

			// 페이지 번호 계산 --> 계산 결과를 로그로 출력
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 BEANS의 static 변수에 저장
			Crew.setOffset(pageData.getOffset());
			Crew.setListCount(pageData.getListCount());
			Crew.setOrder(order);

			// 데이터 조회하기
			output = crewService.getCrewList(input);
			

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		

		// 3) View 처리
		model.addAttribute("keyword", keyword);
		model.addAttribute("region", region);
		model.addAttribute("output", output);
		model.addAttribute("pageData", pageData);
		model.addAttribute("login_info", login_info);

		return new ModelAndView("commPage/comm_crew");
	}

	/*
	 * comm_crew_post
	 */
	@RequestMapping(value = "/commPage/comm_crew_post.do", method = RequestMethod.GET)
	public ModelAndView crewPost(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "post_no", defaultValue = "") int post_no) {

		Member login_info = (Member) webHelper.getSession("login_info");
		int user_no = login_info.getUser_no();
		

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		CrewPost post = new CrewPost();
		post.setPost_no(post_no);
		post.setUser_info_user_no(user_no);

		CrewPost postout = null;
		CrewPost postout2 = null;
		CrewPost postout3 = null;
		
		Member member =null;
		Crew crew =null;
		
		
		try {
			
			//게시글 조회수 증가
			crewPostService.updateHits(post);
			
			// 데이터 조회하기
			postout = crewPostService.selectCrewPost(post);
			postout2 = crewPostService.getCrewNoPostCount(post);
			postout3 = crewPostService.selectCrewUser(post);
			
			int userNo=postout.getUser_info_user_no();
			member= memberService.selectItemByNo(userNo);
			int crewNo = postout2.getCrew_no();
			crew = crewService.getCrewItemByNo(crewNo);
			
		} catch (Exception e) {
			e.getLocalizedMessage();
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
		model.addAttribute("post", post);
		model.addAttribute("postout", postout);
		model.addAttribute("postout2", postout2);
		model.addAttribute("postout3", postout3);
		model.addAttribute("member", member);
		model.addAttribute("crew", crew);
		return new ModelAndView("/commPage/comm_crew_post");
	}

	/*
	 * comm_crew_postEdit
	 */
	@RequestMapping(value = "/commPage/comm_crew_postEdit.do", method = RequestMethod.GET)
	public ModelAndView crewPostEdit(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "post_no", defaultValue = "") int post_no) {

		Member login_info = (Member) webHelper.getSession("login_info");
		
		// 1) 현재 게시물 글 정보 조회
		CrewPost post = new CrewPost();
		post.setPost_no(post_no);
		

		CrewPost postout = null;
		CrewPost postout2 = null;
		CrewPost postout3 = null;
		
		Member member =null;
		Crew crew =null;
		
		int total = 0;
		
		try {
			//현재 게시물 데이터 조회하기
			postout = crewPostService.selectCrewPost(post);
			
			if(login_info.getUser_no() != postout.getUser_info_user_no()) {
				webHelper.redirect(null, "게시글 작성자만 수정가능합니다.");
			}
			
			postout2 = crewPostService.getCrewNoPostCount(post);
			postout3 = crewPostService.selectCrewUser(post);
			
			int userNo=postout.getUser_info_user_no();
			member= memberService.selectItemByNo(userNo);
			int crewNo = postout2.getCrew_no();
			crew = crewService.getCrewItemByNo(crewNo);
			
		} catch (Exception e) {
			e.getLocalizedMessage();
//			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
		model.addAttribute("post", post);
		model.addAttribute("postout", postout);
		model.addAttribute("postout2", postout2);
		model.addAttribute("postout3", postout3);
		model.addAttribute("member", member);
		model.addAttribute("crew", crew);
		model.addAttribute("total", total);
		
		
		return new ModelAndView("/commPage/comm_crew_postEdit");
	}
	
	/*
	 * comm_crew_postEdit_ok
	 */
	@RequestMapping(value = "/commPage/comm_crew_postEdit_ok", method = RequestMethod.POST)
	public ModelAndView crewPostEdit(Model model, HttpServletResponse response, HttpServletRequest request,
			// 제목
			@RequestParam(value = "post_title", defaultValue = "") String title,
			// 내용
			@RequestParam(value = "post_content", defaultValue = "") String content,
			//게시물 번호
			@RequestParam(value = "post_no", defaultValue = "") int post_no) {

		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();

		// 1) 데이터 저장
		CrewPost input = new CrewPost();
		input.setPost_title(title);
		input.setPost_content(content);
		input.setUser_info_user_no(userNo);
		input.setPost_no(post_no);
		
		
		CrewPost postout = null;

		try {

			// 데이터 수정
			crewPostService.upadateCrewPost(input);
			//변경된 게시물 데이터 조회하기
			postout = crewPostService.selectCrewPost(input);
			
		} catch (Exception e) {
			e.getLocalizedMessage();
		}

		// 3) 결과를 확인하기 위한 페이지 이동

		return webHelper.redirect(
				contextPath + "/commPage/comm_crew_post.do?post_no=" + input.getPost_no(),
				"게시글이 수정되었습니다.");


	}
	
	/*
	 * comm_crew_postWrite 작성 폼 페이지
	 */
	@RequestMapping(value = "/commPage/comm_crew_postWrite.do", method = RequestMethod.GET)
	public ModelAndView crewPostWrite(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "post_crew", defaultValue = "") String post_crew,
			@RequestParam(value = "crew_no", defaultValue = "") int crew_no) {

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();

		input.setCrew_name(post_crew);
		input.setCrew_no(crew_no);

		Crew output = null;

		try {
			// 데이터 조회하기
			output = crewService.getCrewItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
		model.addAttribute("output", output);
		return new ModelAndView("commPage/comm_crew_postWrite");
	}

	/*
	 * comm_crew_postWrite_ok 작성 폼에 대한 action 페이지
	 */
	@RequestMapping(value = "/commPage/comm_crew_postWrite_ok", method = RequestMethod.POST)
	public void crewPostWrite(Model model, HttpServletResponse response, HttpServletRequest request,
			// 제목
			@RequestParam(value = "post_title", defaultValue = "") String title,
			// 내용
			@RequestParam(value = "post_content", defaultValue = "") String content,
			// 크루이름
			@RequestParam(value = "post_crew", defaultValue = "") String post_crew,
			//크루번호
			@RequestParam(value = "crew_no", defaultValue = "") int crew_no) {

		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();

		// 1) 데이터 저장
		CrewPost input = new CrewPost();
		input.setPost_title(title);
		input.setPost_content(content);
		input.setUser_info_user_no(userNo);
		input.setPost_crew(post_crew);

		Crew output = new Crew();
		output.setCrew_no(crew_no);

		try {
			// 데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값이 저장
			crewPostService.insertCrewPost(input);
			output = crewService.getCrewItem(output);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}

		// 2) 결과를 확인하기 위한 페이지 이동
		String redirectUrl = contextPath + "/commPage/comm_crew_post.do?post_no=" + input.getPost_no();

		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	/*
	 * 크루 게시글 삭제
	 */
@RequestMapping(value="/commPage/comm_crew_postDelete_ok.do", method = RequestMethod.GET)
public ModelAndView crewPostDelete(Model model,
		//포스트 번호
		@RequestParam(value = "post_no", defaultValue = "") int post_no,
		//크루 번호
		@RequestParam(value = "crew_no", defaultValue = "") int crew_no,
		//크루 이름
		@RequestParam(value = "crew_name", defaultValue = "") String crew_name) {
	
	// 삭제 가능한 사용자 정보
	Member login_info = (Member) webHelper.getSession("login_info");
	int userNo = login_info.getUser_no();
		
	// 1) 삭제하는 게시물
	CrewPost input = new CrewPost();
	input.setPost_no(post_no);
	input.setCrew_no(crew_no);
	input.setCrew_name(crew_name);
	
	CrewPost output = null;
	
	try {
		// 로그인한 사용자와 작성자 정보가 같은 경우 삭제
		output = crewPostService.selectCrewPost(input);
		
		if(login_info.getUser_no() == output.getUser_info_user_no() || login_info.isUser_admin() == true) {
			crewPostService.deleteCrewPost(input);
		}else {
			return webHelper.redirect(null, "작성자만 삭제가능합니다.");
		}
		
		
	} catch (Exception e) {
		webHelper.redirect(null, e.getLocalizedMessage());
	}
	
	
	return webHelper.redirect(contextPath + "/commPage/comm_crew_bbs.do?crew_no=" + input.getCrew_no() + "&crew_name=" + input.getCrew_name(),null);
	
}

/**
 * 좋아요 검사
 * @param post_no
 * @return
 */
@ResponseBody
@RequestMapping(value= "/commPage/comm_crew_post/isLike", method = RequestMethod.POST)
public Map<String, Object> isLike(@RequestParam(value="post_no", defaultValue="0")int post_no){
	Map<String, Object> map = new HashMap<String, Object>();
	/** 1) 현재 글의 좋아요 수*/
	try {
		int count=crewPostLikeService.selectLike(post_no);
		map.put("count",count);
	} catch (Exception e1) {
		webHelper.getJsonWarning(e1.getLocalizedMessage());
	}
	/** 2)사용자가 좋아요를 했는지 검사*/
	//로그인 세션정보가 있으면 세션정보의 user_no와 
	//현재 post_no로 좋아요 된 글인지 확인한다.
	if(webHelper.getSession("login_info")!=null) {
		Member loginInfo = (Member) webHelper.getSession("login_info");
		int user_no = loginInfo.getUser_no();
		CrewPostLike like=new CrewPostLike();
		like.setPost_no(post_no);
		like.setUser_no(user_no);
		int isLike =0;
		
		try {
			isLike = crewPostLikeService.likeUniqueCheck(like);
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
@RequestMapping(value = "/commPage/comm_crew_post/addLike", method = RequestMethod.POST)
public Map<String, Object> addLike(Model model, @RequestParam(value = "post_no") int post_no) {
	
	if(webHelper.getSession("login_info")==null) {
		webHelper.getJsonWarning("로그인 정보 없음");
	}else {
		Member loginInfo=(Member)webHelper.getSession("login_info");
		CrewPostLike input = new CrewPostLike();
		input.setPost_no(post_no);
		input.setUser_no(loginInfo.getUser_no());
		try {
			crewPostLikeService.addLike(input);
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
@RequestMapping(value = "/commPage/comm_crew_post/deleteLike", method = RequestMethod.POST)
public Map<String, Object> deleteLike(Model model, @RequestParam(value = "post_no") int post_no) {
	
	if(webHelper.getSession("login_info")==null) {
		webHelper.getJsonWarning("로그인 정보 없음");
	}else {
		Member loginInfo=(Member)webHelper.getSession("login_info");
		CrewPostLike input = new CrewPostLike();
		input.setPost_no(post_no);
		input.setUser_no(loginInfo.getUser_no());
		try {
			crewPostLikeService.deleteLike(input);
		} catch (Exception e) {
			webHelper.getJsonWarning("좋아요 취소 실패");
		}
	}		
	return webHelper.getJsonData();
}


}
