package study.spring.goodspring.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewMember;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.CrewMemberService;
import study.spring.goodspring.service.CrewPostService;
import study.spring.goodspring.service.CrewService;

@Controller
public class CommController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	CrewService crewService;

	@Autowired
	CrewPostService crewPostService;
	
	@Autowired
	CrewMemberService crewMemberService;

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
	public ModelAndView crewbbs(Model model, 
			@RequestParam(value = "crew_no", defaultValue = "0") int crew_no,
			// 조건 버튼
			@RequestParam(value = "order", defaultValue = "1") int order,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		
		
		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();

		// 1) 페이지 구현에 필요한 변수값 생성
		int totalCount = 0; // 전체 게시글 수
		int listCount = 8; // 한 페이지당 표시할 항목 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수
		
		// 1) 유효성 검사
		if (crew_no == 0) {
			return webHelper.redirect(null, "조회된 크루가 없습니다.");
		}

		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();
		input.setCrew_no(crew_no);
		input.setUser_info_user_no(userNo);

		// 조회결과가 저장될 객체
		Crew output = null;

		CrewPost crewpost = new CrewPost();
		List<CrewPost> crewpostoutput = null; // 조회결과가 저장될 객체

		PageData pageData = null; // 페이지 번호를 계산할 결과가 저장될 객체

		try {
			 //전체 게시글 수 조회
//					totalCount = crewPostService.getCrewCount(input);
			// 전체 게시글 수 조회
			crewpostoutput = crewPostService.selectCrewPostList(crewpost);

			// 페이지 번호 계산 --> 계산 결과를 로그로 출력
					pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT절에서 사용될 값을 BEANS의 static 변수에 저장
					Crew.setOffset(pageData.getOffset());
					Crew.setListCount(pageData.getListCount());
					Crew.setOrder(order);

			// 데이터 조회하기
			output = crewService.getCrewItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 3) View 처리
//				model.addAttribute("keyword",keyword);
//				model.addAttribute("region",region);
//				model.addAttribute("pageData", pageData);

		// 3) View 처리
		model.addAttribute("output", output);
		model.addAttribute("crewpostoutput", crewpostoutput);
		return new ModelAndView("commPage/comm_crew_bbs");

	}

	/*
	 * comm_crew_info
	 */
	@RequestMapping(value = "/commPage/comm_crew_info.do", method = RequestMethod.GET)
	public ModelAndView crewinfo(Model model, 
			HttpServletRequest request,
			 HttpServletResponse response,
			@RequestParam(value = "crew_no", defaultValue = "0") int crew_no) {

		// 1) 유효성 검사
		if (crew_no == 0) {
			return webHelper.redirect(null, "조회된 크루가 없습니다.");
		}
		
		
		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		Crew input = new Crew();
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
		return new ModelAndView("commPage/comm_crew_info");
	}

	/*
	 * comm_crew_info_ok.do
	 */
	@RequestMapping(value = "/commPage/comm_crew_info_ok.do", method = RequestMethod.GET)
	public void crewinfoOk(Model model,HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "crew_no", defaultValue = "0") int crew_no) {
		
		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();
		
		
		//1)데이터 저장
		CrewMember input = new CrewMember();
		input.setUser_info_user_no(userNo);
		input.setCrew_crew_no(crew_no);
		
		Crew output = new Crew();
		output.setCrew_no(crew_no);
		
		try {
			//데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값이 저장
			crewMemberService.addCrewMember(input);
			crewService.updateCrewMemberCount(output);
			
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		
		// 3) 결과를 확인하기 위한 페이지 이동
		String redirectUrl = contextPath + "/commPage/comm_crew_bbs.do?crew_no=" + input.getCrew_crew_no();

		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}


	}


	/*
	 * comm_crew_myCrew
	 */

	@RequestMapping(value = "/commPage/comm_crew_myCrew.do", method = RequestMethod.GET)
	public ModelAndView mycrew(Model model,
			//조건
			@RequestParam(value = "order", defaultValue = "1") int order,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		
		Member login_info = (Member) webHelper.getSession("login_info");
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
			@RequestParam(value = "crew_regeion", required = false) String region,
			// 조건 버튼
			@RequestParam(value = "order", defaultValue = "1") int order,
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

		return new ModelAndView("commPage/comm_crew");
	}
	
	
	

	/*
	 * comm_crew_post
	 */
	@RequestMapping(value = "/commPage/comm_crew_post.do", method = RequestMethod.GET)
	public ModelAndView crewPost(Model model,
			HttpServletRequest request,
			 HttpServletResponse response,
			@RequestParam(value = "post_no", defaultValue = "") int post_no) {
		
		
		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();
		
		// 2) 데이터 조회하기
		// 조회에 필요한 조건값을 Beans에 담는다
		CrewPost post = new CrewPost();
		post.setPost_no(post_no);
		post.setUser_info_user_no(userNo);
		
		CrewPost postout = null;
		
		CrewPost input = new CrewPost();
		input.setPost_no(post_no);
		
		CrewPost postout2 = null;
		
		CrewPost postout3 = null;
		
		try {
			// 데이터 조회하기
		postout = crewPostService.selectCrewPost(input);
		postout2 = crewPostService.getCrewNoPostCount(input);
		postout3 = crewPostService.selectCrewUser(input);
		} catch (Exception e) {
			e.getLocalizedMessage();
//			return webHelper.redirect(null, e.getLocalizedMessage());
		}
	

		// 3) View 처리
		model.addAttribute("postout", postout);
		model.addAttribute("postout2", postout2);
		model.addAttribute("postout3", postout3);
		return new ModelAndView("/commPage/comm_crew_post");
	}

	/*
	 * comm_crew_postEdit
	 */
	@RequestMapping(value = "/commPage/comm_crew_postEdit.do", method = RequestMethod.GET)
	public String crewPostEdit(Model model) {

		return "commPage/comm_crew_postEdit";
	}

	/*
	 * comm_crew_postWrite 작성 폼 페이지
	 */
	@RequestMapping(value = "/commPage/comm_crew_postWrite.do", method = RequestMethod.GET)
	public ModelAndView crewPostWrite(Model model,
			HttpServletRequest request,
			 HttpServletResponse response,
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
	@RequestMapping(value = "/commPage/comm_crew_postWrite_ok.do", method = RequestMethod.POST)
	public void crewPostWrite(Model model, HttpServletResponse response, HttpServletRequest request,
			// 제목
			@RequestParam(value = "post_title", defaultValue = "") String title,
			// 내용
			@RequestParam(value = "post_content", defaultValue = "") String content,
			// 크루이름
			@RequestParam(value = "post_crew", defaultValue = "") String post_crew,
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

		// 3) 결과를 확인하기 위한 페이지 이동
		String redirectUrl = contextPath + "/commPage/comm_crew_post.do?post_no=" +input.getPost_no();

		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
