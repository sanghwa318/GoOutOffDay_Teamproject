package study.spring.goodspring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.service.CrewMemberService;
import study.spring.goodspring.service.CrewPostService;
import study.spring.goodspring.service.CrewService;

@Controller
public class CrewCrewMemberController {
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
	 * comm_crew_memberJoin
	 */
	@RequestMapping(value = "/commPage/comm_crew_memberJoin.do", method = RequestMethod.GET)
	public String crewmemberjoin(Model model) {
		

		return "commPage/comm_crew_memberJoin";
	}
}
