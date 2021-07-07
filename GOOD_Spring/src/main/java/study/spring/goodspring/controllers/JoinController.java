package study.spring.goodspring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController {

	/**
	 * introduce 메인 페이지
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/assets/api/idUniqueCheck.do", method = RequestMethod.GET)
	public String introduce() {

		return "assets/api/idUniqueCheck";
	}
}
