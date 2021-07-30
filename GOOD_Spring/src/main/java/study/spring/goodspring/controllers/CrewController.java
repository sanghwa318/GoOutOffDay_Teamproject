package study.spring.goodspring.controllers;

import java.io.File;
import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.UploadItem;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewMember;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.CrewMemberService;
import study.spring.goodspring.service.CrewService;

@Controller
public class CrewController {

	//Service 패턴 구현체 주입
	@Autowired
	CrewService crewService;

	//프로젝트이름에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	//RegextHelper 객체 주입
	@Autowired
	RegexHelper regexHelper;
	
	//WebHelper
	@Autowired
	WebHelper webHelper;

	@Autowired
	CrewMemberService crewMemberService;
	
	//작성 폼 페이지
	@RequestMapping(value = "/commPage/comm_crew_est.do", method = RequestMethod.GET) 
		public ModelAndView add(Model model) {
		
		return new ModelAndView("commPage/comm_crew_est");
	}
	
	//작성 폼에대한 action 페이지
	@RequestMapping(value = "/commPage/comm_crew_est_ok.do", method = RequestMethod.POST) 
	public void addOk(Model model, HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "crew_name", defaultValue="") String crew_name,
			@RequestParam(value = "crew_category", defaultValue="") String crew_category,
			@RequestParam(value = "crew_area", defaultValue="") String crew_area,
			@RequestParam(value="crew_photo", defaultValue="") MultipartFile crew_photo,
			@RequestParam(value = "crew_sinto", defaultValue="") String crew_sinto,
			@RequestParam(value = "crew_dinto", defaultValue="") String crew_dinto) {
	
		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();
		
//		//1) 사용자가 입력한 파라미터 유효성 검사
//		//일반 문자열 입력
//		if(!regexHelper.isValue(crew_name)) { return webHelper.redirect(null, "크루 명을 입력하세요"); }
//		if(!regexHelper.isValue(crew_category)) { return webHelper.redirect(null, "크루 종류를 입력하세요"); }
//		if(!regexHelper.isValue(crew_area)) { return webHelper.redirect(null, "크루 지역을 입력하세요"); }
//		if(!regexHelper.isValue(crew_sinto)) { return webHelper.redirect(null, "크루 소개글을 입력하세요"); }
//		if(!regexHelper.isValue(crew_dinto)) { return webHelper.redirect(null, "크루 소개글을 입력하세요"); }
		
		//6) 업로드 결과를 Beans에 저장
		UploadItem item = null;
		//item.setContentType(crew_photo.getContentType());
		//item.setFieldName(crew_photo.getName());
		//item.setFileSize(crew_photo.getSize());
		//item.setOriginName(crew_photo.getOriginalFilename());
		//item.setFilePath(filePath);
		
		try {
			item = webHelper.saveMultipartFile(crew_photo);
		} catch (NullPointerException e) {
			e.printStackTrace();
			crew_photo = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//2) 데이터 저장하기
		Crew input = new Crew();
		input.setCrew_name(crew_name);
		input.setCrew_category(crew_category);
		input.setCrew_area(crew_area);
		input.setCrew_photo(item);
		input.setCrew_sinto(crew_sinto);
		input.setCrew_dinto(crew_dinto);
		input.setUser_info_user_no(userNo);
		
		CrewMember member = new CrewMember();
		member.setUser_info_user_no(userNo);
		
		
		try {
			//데이터 저장
			// 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값이 저장
			input = crewService.addCrew(input);
			member.setCrew_crew_no(input.getCrew_no());
			crewMemberService.addCrewMember(member);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		// 3) 결과를 확인하기 위한 페이지 이동
		String redirectUrl = contextPath + "/commPage/comm_crew_bbs.do?crew_no=" + input.getCrew_no();
		
		try {
			response.sendRedirect(redirectUrl);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//7) View 처리
		//업로드 정보를 View로 전달
		model.addAttribute("item",item);

	}
	
	/**크루 삭제 */
	@RequestMapping(value = "/commPage/comm_crew_bbs_deletecrew.do", method = RequestMethod.GET)
	public ModelAndView deletecrew(Model model, HttpServletResponse response,
			@RequestParam(value="crew_no") int crew_no) {
		
		try {
			crewService.deleteCrew(crew_no);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 크루 페이지로 이동
		return webHelper.redirect(contextPath + "/commPage/comm_crew.do", "크루가 해체 되었습니다.");
	}
		
	
}