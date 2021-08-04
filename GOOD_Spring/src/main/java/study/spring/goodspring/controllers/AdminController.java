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

import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Inquiry;
import study.spring.goodspring.service.AdminService;

@Controller
public class AdminController {
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@Autowired
	WebHelper webHelper;
	
	@Autowired
	AdminService adminService;
	
	/**
	 * 관리자 메인페이지 
	 * 
	 * 
	 */
	@RequestMapping(value = "/adminPage/admin_index.do", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		
		return new ModelAndView ("adminPage/admin_index");
	}
	
	/**
	 * 1:1 문의 조회 (관리자)
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/adminPage/admin_inquiry.do", method = RequestMethod.GET)
	public ModelAndView adminInquiry(Model model) {
		
		/* 1) 데이터 조회하기 */
		List<Inquiry> output = null;

		try {
			// 데이터 조회
			output = adminService.getInquiryListAdmin(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// 3) View 처리
		model.addAttribute("output", output);
		return new ModelAndView ("adminPage/admin_inquiry");
	}
	
	/**
	 * 1:1문의 상세
	 * @param model
	 * @param QnA_no
	 * @return
	 */
	@RequestMapping(value = "/adminPage/admin_inquiryDetail.do", method = RequestMethod.GET)
	public ModelAndView adminInquiryDetail(Model model,
			@RequestParam(value="QnA_no") int QnA_no) {
		
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
	public ModelAndView InquiryAnswerOk(Model model) {
		
		Inquiry input = new Inquiry();

		Inquiry output = null;

		try {
			output = adminService.addInquiryAdmin(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return webHelper.redirect(contextPath + "/adminPage/admin_inquiryDetail.do" + "?QnA_no=" + output.getQnA_no(),
				"작성되었습니다.");

	}

	
	
	
	@RequestMapping(value = "/adminPage/admin_member.do", method = RequestMethod.GET)
	public ModelAndView adminMember(Model model) {
		
		return new ModelAndView ("adminPage/admin_member");
	}
	
	@RequestMapping(value = "/adminPage/admin_userCourse.do", method = RequestMethod.GET)
	public ModelAndView adminUserCourse(Model model) {
		
		return new ModelAndView ("adminPage/admin_userCourse");
	}
	
	@RequestMapping(value = "/adminPage/admin_stats.do", method = RequestMethod.GET)
	public ModelAndView adminStats(Model model) {
		
		return new ModelAndView ("adminPage/admin_stats");
	}
	
	@RequestMapping(value = "/adminPage/admin_notice.do", method = RequestMethod.GET)
	public ModelAndView adminNotice(Model model) {
		
		return new ModelAndView ("adminPage/admin_notice");
	}

}
