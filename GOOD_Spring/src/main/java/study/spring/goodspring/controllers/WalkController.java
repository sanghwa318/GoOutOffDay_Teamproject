package study.spring.goodspring.controllers;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller

public class WalkController {
	
	/**
	 * 걷기페이지 메인 메서드
	 */
	@RequestMapping(value = "/walkPage/walk_index.do", method = RequestMethod.GET)
		public String walk_index() {
			// walkPage/walk_index.jsp파일을 View로 지정 
			return "walkPage/walk_index";
		}
	
	
}
