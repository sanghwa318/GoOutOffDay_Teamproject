package study.spring.goodspring.controllers;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommController {
	
	/*
	 * comm_index
	 */
	@RequestMapping(value = "/commPage/comm_index.do", method = RequestMethod.GET)
	public String commindex(Model model) {
		
		return "commPage/comm_index";
	}
	
	/*
	 * comm_crew_bbs
	 */
	@RequestMapping(value = "/commPage/comm_crew_bbs.do", method = RequestMethod.GET)
	public String crewbbs(Model model) {
		
		return "commPage/comm_crew_bbs";
	}
	/*
	 * comm_crew_info
	 */
	@RequestMapping(value = "/commPage/comm_crew_info.do", method = RequestMethod.GET)
	public String crewinfo(Model model) {
		
		return "commPage/comm_crew_info";
	}
	/*
	 * comm_crew_memberJoin
	 */
	@RequestMapping(value = "/commPage/comm_crew_memberJoin.do", method = RequestMethod.GET)
	public String crewmemberjoin(Model model) {
		
		return "commPage/comm_crew_memberJoin";
	}
	/*
	 * comm_crew_myCrew
	 */
	@RequestMapping(value = "/commPage/comm_crew_myCrew", method = RequestMethod.GET)
	public String mycrew(Model model) {
		
		return "commPage/comm_crew_myCrew";
	}
	/*
	 * comm_crew
	 */
	@RequestMapping(value = "/commPage/comm_crew.do", method = RequestMethod.GET)
	public String crew(Model model) {
		
		return "commPage/comm_crew";
	}
	/*
	 * comm_myCourse
	 */
	@RequestMapping(value = "/commPage/comm_myCourse.do", method = RequestMethod.GET)
	public String mycourse(Model model) {
		
		return "commPage/comm_myCourse";
	}
	/*
	 * comm_myCourseDetail
	 */
	@RequestMapping(value = "/commPage/comm_myCourseDetail.do", method = RequestMethod.GET)
	public String mycourseDetail(Model model) {
		
		return "commPage/comm_myCourseDetail";
	}
	/*
	 * comm_myCourseEdit
	 */
	@RequestMapping(value = "/commPage/comm_myCourseEdit.do", method = RequestMethod.GET)
	public String mycourseEdit(Model model) {
		
		return "commPage/comm_myCourseEdit";
	}
	/*
	 * comm_myCourseWrite
	 */
	@RequestMapping(value = "/commPage/comm_myCourseWrite.do", method = RequestMethod.GET)
	public String mycourseWrite(Model model) {
		
		return "commPage/comm_myCourseWrite";
	}
	/*
	 * comm_myPost
	 */
	@RequestMapping(value = "/commPage/comm_myPost.do", method = RequestMethod.GET)
	public String myPost(Model model) {
		
		return "commPage/comm_myPost";
	}
	

	
	
}
