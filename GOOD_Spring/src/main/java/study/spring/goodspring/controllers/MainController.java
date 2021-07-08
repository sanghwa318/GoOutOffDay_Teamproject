package study.spring.goodspring.controllers;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	/**
	 * introduce 메인 페이지
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/mainPage/introduce.do", method = RequestMethod.GET)
	public String introduce() {

		return "mainPage/introduce";
	}
	
	/**
	 * 회원가입 페이지
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/mainPage/join.do", method = RequestMethod.GET)
	public String join() {
		
		return "mainPage/join";
	}
	
	/**
	 * 회원가입 성공 
	 * 
	 * @return String
	 */
	@RequestMapping(value = "/mainPage/join_ok.do", method = RequestMethod.POST)
	public String join_ok() {
		
		return "mainPage/join";
	}
	
	@RequestMapping(value = "/mainPage/login.do", method = RequestMethod.GET)
	public String login(Model model) {
		
		return "mainPage/login";
	}
	@RequestMapping(value = "/mainPage/login_ok.do", method = RequestMethod.GET)
	public String login_ok(Model model) {
		
		return "mainPage/login_ok";
	}
	@RequestMapping(value = "/mainPage/login_findID.do", method = RequestMethod.GET)
	public String login_findID(Model model) {
		
		return "mainPage/login_findID";
	}
	
	@RequestMapping(value = "/myPage/myPage_index.do", method = RequestMethod.GET)
	public String myPageIndex() {
		return ("myPage/myPage_index");
	}
	
	@RequestMapping(value = "/mainPage/login_findPW.do", method = RequestMethod.GET)
	public String login_findPW(Model model) {
		
		return "mainPage/login_findPW";
	}
	
}
