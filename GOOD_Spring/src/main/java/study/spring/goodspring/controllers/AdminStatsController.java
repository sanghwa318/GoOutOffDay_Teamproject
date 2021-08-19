package study.spring.goodspring.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.UserTrafficLog;
import study.spring.goodspring.service.AdminService;
import study.spring.goodspring.service.MemberService;
import study.spring.goodspring.service.UserTrafficLogService;

@RestController
public class AdminStatsController {
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@Autowired
	WebHelper webHelper;

	@Autowired
	AdminService adminService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	UserTrafficLogService userTrafficLogService;
	
	@RequestMapping(value="adminPage/admin_stats_login", method=RequestMethod.GET)
	public ModelAndView loginStats(Model model,
			@RequestParam(value="interval", defaultValue="day")String interval) {
		UserTrafficLog input = new UserTrafficLog();
		input.setInterval(interval);
		List<UserTrafficLog> userTrafficLog =null;
		try {
			userTrafficLog=userTrafficLogService.loginCountInterval(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int cnt=0;
		for(int i=0; i<userTrafficLog.size(); i++) {
		cnt+=userTrafficLog.get(i).getLog_cnt();
		}
		model.addAttribute("output", userTrafficLog);
		model.addAttribute("cnt", cnt);
		return new ModelAndView("adminPage/admin_stats_login");
		
	}
}
