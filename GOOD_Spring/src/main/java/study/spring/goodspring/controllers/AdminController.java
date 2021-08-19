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
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.AdminInquiry;
import study.spring.goodspring.model.Inquiry;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.AdminService;
import study.spring.goodspring.service.MemberService;
import study.spring.goodspring.service.UserTrafficLogService;

@Controller
public class AdminController {
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@Autowired
	WebHelper webHelper;

	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	UserTrafficLogService userTrafficLogService;

	/**
	 * 관리자 메인페이지
	 */
	@RequestMapping(value = "/adminPage/admin_index.do", method = RequestMethod.GET)
	public ModelAndView home(Model model) {

		return new ModelAndView("adminPage/admin_index");
	}

	/**
	 * 1:1 문의 조회 (관리자)
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/adminPage/admin_inquiry.do", method = RequestMethod.GET)
	public ModelAndView adminInquiry(Model model,
			// 답변별
			@RequestParam(value = "answer", required = false) String answer,
			// 유형별
			@RequestParam(value = "category", required = false) String category,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		AdminInquiry input = new AdminInquiry();
		input.setAnswer_yn(answer);
		input.setQnA_category(category);
		

		/* 데이터 조회하기 */
		List<AdminInquiry> output = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = adminService.getInquiryListAdminCount(input);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
			Inquiry.setOffset(pageData.getOffset());
			Inquiry.setOffset(pageData.getListCount());

			// 데이터 조회
			output = adminService.getAdminInquiryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// View 처리
		model.addAttribute("output", output);
		model.addAttribute("answer", answer);
		model.addAttribute("category", category);
		model.addAttribute("pageData", pageData);

		return new ModelAndView("adminPage/admin_inquiry");
	}

	/**
	 * 1:1문의 상세
	 * 
	 * @param model
	 * @param QnA_no
	 * @return
	 */
	@RequestMapping(value = "/adminPage/admin_inquiryDetail.do", method = RequestMethod.GET)
	public ModelAndView adminInquiryDetail(Model model, @RequestParam(value = "QnA_no") int QnA_no) {

		/* 1) 데이터 조회하기 */

		Inquiry input = new Inquiry();
		input.setQnA_no(QnA_no);
		Inquiry output = null;
		try {
			// 데이터 조회
			output = adminService.getInquiryItemAdmin(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// 3) View 처리
		model.addAttribute("output", output);
		return new ModelAndView("adminPage/admin_inquiryDetail");
	}

	/**
	 * 1:1 문의 답변을 위한 action 페이지
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/adminPage/admin_inquiryanswerOk.do", method = RequestMethod.POST)
	public ModelAndView InquiryAnswerOk(Model model, @RequestParam(value = "QnA_no") int QnA_no,
			@RequestParam(value = "Answer_detail") String Answer_detail) {

		Inquiry input = new Inquiry();
		input.setQnA_no(QnA_no);
		input.setAnswer_detail(Answer_detail);
		@SuppressWarnings("unused")
		Inquiry output = null;

		try {
			output = adminService.addInquiryAdmin(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return webHelper.redirect(contextPath + "/adminPage/admin_inquiryDetail.do" + "?QnA_no=" + QnA_no,
				"답변이 작성되었습니다.");
	}

		/**
	    * 관리자 회원관리 페이지
	    */
	   @RequestMapping(value = "/adminPage/admin_member.do", method = RequestMethod.GET)
	   public ModelAndView adminMember(Model model,
	         @RequestParam(value="keyword", required = false) String keyword,
	         @RequestParam(value = "page", defaultValue = "1") int nowPage) {
	 
	       Member input = new Member();
	       input.setUser_name(keyword);
	       
	       // [페이지네이션] 변수 추가
	       int totalCount = 0; // 전체 게시글 수
	       int listCount = 20; // 한페이지단 표시할 목록수
	       int pageCount = 5; // 한그룹당 표시할 페이지 번호수
	       // [페이지네이션] 객체 추가
	       PageData pageData = null;
	       // [페이지네이션] 변수 추가 (종료)
	       
	       /*  데이터 조회하기 */
	       List<Member> output = null;
	        
	       try {
	           
	          // [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
	         totalCount = memberService.getMemberCount(input);
	         // [페이지네이션] 페이지 번호 계산
	         pageData = new PageData(nowPage, totalCount, listCount, pageCount);

	         // SQL의 LIMIT 절에서 사용될 값을 Beans의 static 변수에 저장
	         Member.setOffset(pageData.getOffset());
	         Member.setOffset(pageData.getListCount());
	           // 데이터 조회
	           output = memberService.getAdminMemberList(input);
	        } catch (Exception e) {
	           return webHelper.redirect(null, e.getLocalizedMessage());
	        }
	        // View 처리
	        model.addAttribute("output", output);
	        model.addAttribute("keyword", keyword);
	        model.addAttribute("pageData", pageData);
	        
	        return new ModelAndView ("adminPage/admin_member");
	      }
	
		/**
		 * 관리자 회원 추방 및 관리자 추방 방지
		 */
	   @RequestMapping(value = "/adminPage/admin_member_delete", method = RequestMethod. GET)
	   public ModelAndView delete(Model model,
	         @RequestParam(value="user_id", defaultValue="") String user_id) {
	      
	      
	         
	      /** 조회삭제를 위한 select */
	      Member input = new Member();
	      input.setUser_id(user_id);

	      Member output = null;

	      

	      try {
	         output = adminService.getUserinfoadmin(input);
	
	           if(output.isUser_admin()) {
	        	  return webHelper.redirect(null, "관리자는 추방할 수 없습니다.");
	         }
	         else {
	         adminService.deleteMemberadmin(output); // 데아터 삭제
	         }
	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      
	      /** 3) 페이지 이동 */
	      return webHelper.redirect(contextPath + "/adminPage/admin_member.do?user_id=" + input.getUser_id(), "회원이 추방되었습니다.");
	   }
	
	/**
	 * 회원코스관리 페이지
	 */
	@RequestMapping(value = "/adminPage/admin_userCourse.do", method = RequestMethod.GET)
	public ModelAndView adminUserCourse(Model model) {

		return new ModelAndView("adminPage/admin_userCourse");
	}

	/**
	 * 회원로그 페이지
	 */
	@RequestMapping(value = "/adminPage/admin_stats.do", method = RequestMethod.GET)
	public ModelAndView adminStats(Model model) {

		return new ModelAndView("adminPage/admin_stats");
	}

}
