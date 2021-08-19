package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	public Map<String, Object> loginStats(
			@RequestParam(value="interval", defaultValue="day")String interval) {
		UserTrafficLog input = new UserTrafficLog();
		input.setInterval(interval);
		List<UserTrafficLog> userTrafficLog =null;
		try {
			userTrafficLog=userTrafficLogService.loginCountInterval(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		int cnt=0;
		for(int i=0; i<userTrafficLog.size(); i++) {
		cnt+=userTrafficLog.get(i).getLog_cnt();
		}
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("loginOutput", userTrafficLog);
		map.put("loginCnt", cnt);
		return webHelper.getJsonData(map);
		
	}
	
	
	@RequestMapping(value="adminPage/admin_stats_join", method=RequestMethod.GET)
	public Map<String, Object> joinStats(Model model,
			@RequestParam(value="interval", defaultValue="day")String interval) {
		/** 회원가입 통계 코드 **/
		UserTrafficLog input_join = new UserTrafficLog();
		input_join.setInterval(interval);
		List<UserTrafficLog> output_Hour_Count_join = null;
		try {
			output_Hour_Count_join = userTrafficLogService.joinHourCount(input_join);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		int cnt=0;
		for(int i=0; i<output_Hour_Count_join.size(); i++) {
		cnt+=output_Hour_Count_join.get(i).getLog_cnt();
		}
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("joinCnt", cnt);
		map.put("joinOutput", output_Hour_Count_join);
		return webHelper.getJsonData(map);
		
	}
}
