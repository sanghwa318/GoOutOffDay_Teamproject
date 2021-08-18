package study.spring.goodspring.controllers;


import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		Member login_info = (Member) webHelper.getSession("login_info");

		if (login_info == null) {

			String redirectUrl = contextPath + "/mainPage/login.do";
			return webHelper.redirect(redirectUrl, "로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
		}

		return new ModelAndView("commPage/comm_crew_est");
	}
	
	//작성 폼에대한 action 페이지
	@RequestMapping(value = "/commPage/comm_crew_est_ok", method = RequestMethod.POST) 
	public ModelAndView addOk(Model model,
			@RequestParam(value = "crew_name") String crew_name,
			@RequestParam(value = "crew_category") String crew_category,
			@RequestParam(value = "crew_area") String crew_area,
			@RequestParam(value="crew_photo") MultipartFile crew_photo,
			@RequestParam(value = "crew_sinto") String crew_sinto,
			@RequestParam(value = "crew_dinto") String crew_dinto) {
		

		if(crew_name==null||crew_name=="") {webHelper.redirect(null, "크루명을 입력해주세요.");}
		if(crew_category==null||crew_category=="") {webHelper.redirect(null, "크루종류를 선택해 주세요.");}
		if(crew_area==null||crew_area=="") {webHelper.redirect(null, "지역을 선택해 주세요.");}
		if(crew_photo==null) {webHelper.redirect(null, "크루 사진을 등록해주세요.");}
		if(crew_sinto==null||crew_sinto=="") {webHelper.redirect(null, "크루 간단소개를 입력해 주세요.");}
		if(crew_dinto==null||crew_dinto=="") {webHelper.redirect(null, "크루 설명을 입력해 주세요.");}
		
		Member login_info = (Member) webHelper.getSession("login_info");
		int userNo = login_info.getUser_no();
		

		UploadItem item = null;

		
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
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		

	
		//7) View 처리
		//업로드 정보를 View로 전달
		model.addAttribute("item",item);
		
		return webHelper.redirect(contextPath + "/commPage/comm_crew_bbs.do?crew_no=" + input.getCrew_no(), null);
	}
	
	/**크루 삭제 */
	@ResponseBody
	@RequestMapping(value = "/commPage/comm_crew_bbs_deletecrew.do", method = RequestMethod.POST)
	public Map<String, Object> deletecrew(Model model, HttpServletResponse response,
			@RequestParam(value="crew_no") int crew_no) {
		
		try {
			crewService.deleteCrew(crew_no);
		}catch(Exception e) {
			return webHelper.getJsonError("크루 해체에 실패했습니다.");
		}
		
		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 크루 페이지로 이동
		return webHelper.getJsonData();
	}
		
	/** 크루이름 중복검사 */
	@ResponseBody
    @RequestMapping(value = "/commPage/comm_crew_est_ok/crewname_unique_check", method = RequestMethod.POST)
    public Map<String, Object> crewNameUinqueCheck(
            // 아이디
            @RequestParam(value = "crew_name", required = false) String crew_name) {

        if (!regexHelper.isValue(crew_name)) {
            return webHelper.getJsonWarning("크루명을 입력하세요.");
        }
        if (!regexHelper.isKor(crew_name)) { return webHelper.getJsonWarning("크루명은 한글만 입력 가능합니다."); }
        if (crew_name.length() < 2 || crew_name.length() > 10) { return webHelper.getJsonWarning("크루명은 2~10글자로 입력 가능합니다."); }
        
        Crew input = new Crew();
        input.setCrew_name(crew_name);
        
        try {
            if(!crewService.crewNameUinqueCheck(input)) {
            	return webHelper.getJsonWarning("이미 사용중인 크루명 입니다.");
            }
            else {
            	 return webHelper.getJsonData();
            }
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }


    }
  
}