package study.spring.goodspring.controllers;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	
	@RequestMapping(value = "mainPage/join.do", method = RequestMethod.GET)
	public String join(Model model) {
		
		return "mainPage/join";
	}
	
	@RequestMapping(value = "mainPage/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "mainPage/login";
	}
	@RequestMapping(value = "mainPage/login_ok.do", method = RequestMethod.GET)
	public String login_ok(Model model) {
		
		return "mainPage/login_ok";
	}
	@RequestMapping(value = "mainPage/login_findID.do", method = RequestMethod.GET)
	public String login_findID(Model model) {
		
		return "mainPage/login_findID";
	}
	
	@RequestMapping(value = "mainPage/login_findPW.do", method = RequestMethod.GET)
	public String login_findPW(Model model) {
		
		return "mainPage/login_findPW";
	}
	
}