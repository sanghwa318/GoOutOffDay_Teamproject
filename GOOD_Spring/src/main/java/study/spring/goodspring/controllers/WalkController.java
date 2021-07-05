package study.spring.goodspring.controllers;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




@Controller

public class WalkController {
	
	/**
	 * 걷기페이지 메인 메서드
	 */
	@RequestMapping(value = "/walkPage/walk_index.do", method = RequestMethod.GET)
		public String walk_index(Model model, HttpServletRequest request, HttpServletResponse response) {
			// walkPage/walk_index.jsp파일을 View로 지정 
			return "walkPage/walk_index";
		}
	
	@RequestMapping(value="/walkPage/walk_hallOfFame.do", method=RequestMethod.GET)
	public String walk_hallOfFame(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_hallOfFame.jsp파일을 View로 지정
		return "walkPage/walk_hallOfFame";
	}
	
	@RequestMapping(value="/walkPage/walk_search.do", method=RequestMethod.GET)
	public String walk_search(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_search.jsp파일을 View로 지정
		return "walkPage/walk_search";
	}
	
	@RequestMapping(value="/walkPage/walk_log.do", method=RequestMethod.GET)
	public String walk_log(Model model, HttpServletRequest request, HttpServletResponse response) {
		// walkPage/walk_log.jsp파일을 View로 지정
		return "walkPage/walk_log";
	}
	
	

	
	
}








