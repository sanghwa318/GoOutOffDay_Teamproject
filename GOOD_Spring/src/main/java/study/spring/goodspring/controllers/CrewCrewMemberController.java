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
	
	/**
	 * 크루멤버 추방 처리
	 */
	@RequestMapping(value = "/commPage/comm_crew_memberJoin_delete", method = RequestMethod. GET)
	public ModelAndView delete(Model model,
			@RequestParam(value="crew_crew_no", defaultValue="0") int crew_crew_no) {
		
		/** 1) 파라미터 유효성 검사 */
		if(crew_crew_no == 0) {
			return webHelper.redirect(null, "멤버번호가 없습니다.");
		}
		/** 2) 데이터 삭제하기 */
		CrewMember input = new CrewMember();
		input.setMember_no(crew_crew_no);
		
		try {
			crewMemberService.deleteCrewMember(input); // 데아터 삭제
			
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		/** 3) 페이지 이동 */
		return new ModelAndView("commPage/comm_crew_memberJoin");
	}
}
