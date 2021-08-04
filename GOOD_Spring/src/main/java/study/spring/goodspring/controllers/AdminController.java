package study.spring.goodspring.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/**
	 * 관리자 메인페이지 
	 * 
	 * 
	 */
	@RequestMapping(value = "/adminPage/admin_index.do", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		
		return new ModelAndView ("adminPage/admin_index");
	}
	
	@RequestMapping(value = "/adminPage/admin_inquiry.do", method = RequestMethod.GET)
	public ModelAndView adminInquiry(Model model) {
		
		return new ModelAndView ("adminPage/admin_inquiry");
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
