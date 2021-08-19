package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Crew;
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
	
	/** 회원가입 통계 그래프 **/
	@RequestMapping(value="adminPage/admin_stats_join", method=RequestMethod.GET)
	public Map<String, Object> joinStats(
			@RequestParam(value="interval", defaultValue="day")String interval) {
		
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
	/** 인기검색어 그래프 **/
	@RequestMapping(value="adminPage/admin_stats_kw", method=RequestMethod.GET)
	public Map<String, Object> keywordStats(
			@RequestParam(value="interval", defaultValue="day")String interval) {

		UserTrafficLog input = new UserTrafficLog();
		input.setInterval(interval);
		
		List<UserTrafficLog> output_Top10_keyword = null;
		UserTrafficLog output_Top_keyword=null;
		
		try {
			output_Top_keyword = userTrafficLogService.TopSearchKeyword(input);
			output_Top10_keyword = userTrafficLogService.Top10SearchKeyword(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("output_Top_keyword", output_Top_keyword);
		map.put("output_Top10_keyword", output_Top10_keyword);
		return webHelper.getJsonData(map);
	}
	
	/** 찜추가한 회원수와 찜추가한 회원중 외부바로가기를 이용한 회원수 그래프**/
	@RequestMapping(value="adminPage/admin_stats_BMEL", method=RequestMethod.GET)
	public Map<String, Object> BMELStats(
			@RequestParam(value="interval", defaultValue="day")String interval) {
		
		UserTrafficLog input = new UserTrafficLog();
		input.setInterval(interval);
		
		
		int output_count_bookmark = 0;
		List<UserTrafficLog> output_Hour_Count_bookmark = null;

		int output_count_ExLink = 0;
		List<UserTrafficLog> output_Hour_Count_ExLink = null;
		
		try {
			output_count_bookmark = userTrafficLogService.AddBookMarkCount(input);
			output_Hour_Count_bookmark = userTrafficLogService.AddBookMarkHourCount(input);
			
			output_count_ExLink = userTrafficLogService.ExLinkCount(input);
			output_Hour_Count_ExLink = userTrafficLogService.ExLinkHourCount(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("output_count_bookmark", output_count_bookmark);
		map.put("output_Hour_Count_bookmark", output_Hour_Count_bookmark);
		
		map.put("output_count_ExLink", output_count_ExLink);
		map.put("output_Hour_Count_ExLink", output_Hour_Count_ExLink);
		
		return webHelper.getJsonData(map);
	}
	
	@RequestMapping(value="adminPage/admin_stats_WRMM", method=RequestMethod.GET)
	public Map<String, Object> WRMMStats(
			@RequestParam(value="interval", defaultValue="day")String interval) {
		
		UserTrafficLog input = new UserTrafficLog();
		input.setInterval(interval);
		
		
		/** 기간별 걷기 기록이용과 나만의코스 생성현황 회원수 **/
		int output_count_WalkRecord = 0;
		List<UserTrafficLog> output_Hour_Count_WalkRecord = null;

		int output_count_MakMap = 0;
		List<UserTrafficLog> output_Hour_Count_MakMap = null;

		try {
			output_count_WalkRecord = userTrafficLogService.RecordCount(input);
			output_Hour_Count_WalkRecord = userTrafficLogService.RecordHourCount(input);

			output_count_MakMap = userTrafficLogService.MakeLogMapCount(input);
			output_Hour_Count_MakMap = userTrafficLogService.MakeLogMapHourCount(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map =new HashMap<String, Object>();
		
		map.put("output_count_WalkRecord", output_count_WalkRecord);
		map.put("output_Hour_Count_WalkRecord", output_Hour_Count_WalkRecord);

		map.put("output_count_MakMap", output_count_MakMap);
		map.put("output_Hour_Count_MakMap", output_Hour_Count_MakMap);
		
		return webHelper.getJsonData(map);
	}
	
	@RequestMapping(value="adminPage/admin_stats_crew", method=RequestMethod.GET)
	public Map<String, Object> crewStats(
			@RequestParam(value="interval", defaultValue="day")String interval) {
		
		/** 크루생성현황과 생성된크루의 종류 **/
		Crew input_crew = new Crew();
		input_crew.setInterval(interval);
		
		int output_count_MakeCrew = 0;
		List<Crew> output_Hour_Count_MakeCrew = null;
		List<Crew> output_CrewCategory = null;
		
		try {
			output_count_MakeCrew = userTrafficLogService.MakeCrewCount(input_crew);
			output_Hour_Count_MakeCrew = userTrafficLogService.MakeCrewHourCount(input_crew);
			output_CrewCategory = userTrafficLogService.CrewCategoryCount(input_crew);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		

		Map<String, Object> map =new HashMap<String, Object>();
		map.put("output_count_MakeCrew", output_count_MakeCrew);
		map.put("output_Hour_Count_MakeCrew", output_Hour_Count_MakeCrew);
		map.put("output_CrewCategory", output_CrewCategory);
		
		return webHelper.getJsonData(map);
	}
}
