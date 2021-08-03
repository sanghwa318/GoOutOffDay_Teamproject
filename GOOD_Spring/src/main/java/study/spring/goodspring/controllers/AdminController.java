package study.spring.goodspring.controllers;

import java.util.Locale;

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
	@RequestMapping(value = "adminPage/admin_index.do", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		return new ModelAndView ("adminPage/admin_index");
		
	}
	

}
