package study.spring.goodspring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

/**
 * 자전거 메인 페이지
 */
public class BicyleController {
	@RequestMapping(value = "/bicyclePage/bicycle_index.do", method = RequestMethod.GET)
	public String bicyle_index() {
		
		return "bicyclePage/bicyle_index";
	}
}
