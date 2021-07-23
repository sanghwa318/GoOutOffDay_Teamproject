package study.spring.goodspring.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.CrewMember;
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
	public ModelAndView crewmemberjoin(Model model, HttpServletResponse response,
		@RequestParam(value = "crew_crew_no", defaultValue = "0") int crew_no) {
		int count = 0;
		//1)데이터 저장
		CrewMember input = new CrewMember();
		input.setCrew_crew_no(crew_no);
		
		List<CrewMember> output = null;
		
		
		try {
			
			// 데이터 조회하기
			output = crewMemberService.getCrewMemberList(input);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		model.addAttribute("output", output);
		return new ModelAndView("commPage/comm_crew_memberJoin");
	}
}
