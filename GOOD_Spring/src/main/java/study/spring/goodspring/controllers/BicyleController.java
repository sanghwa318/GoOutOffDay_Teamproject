package study.spring.goodspring.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import study.spring.goodspring.helper.WebHelper;

@Controller

/**
 * 자전거 메인 페이지
 */
public class BicyleController {
	@Autowired
	WebHelper webHelper;
	
	@RequestMapping(value = "/bicyclePage/bicycle_index.do", method = RequestMethod.GET)
	public Map<String, Object> bicyle_index(Model model,
			@RequestParam(required = false, defaultValue = "") String keyword) {
		
		return webHelper.getJsonData(data);
	}
}
