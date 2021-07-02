package study.spring.goodspring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CasController {
	/** 문화체육 메인페이지 메서드 **/
	@RequestMapping(value = "/casPage/cas_index.do", method = RequestMethod.GET)
	public String cas_index() {
		// casPage/cas_index.jsp파일을 View로 지정 
		return "casPage/cas_index";
	}
}
