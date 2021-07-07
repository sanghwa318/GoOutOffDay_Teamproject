package study.spring.goodspring.controllers;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.MailHelper;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.UploadItem;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.MemberService;

@RestController
public class LoginController {

	@Autowired
	WebHelper webHelper;
	@Autowired
	MemberService memberService;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MailHelper mailHelper;
	
	/** RESTFUL 로그인 */
	@RequestMapping(value = "/mainPage/login_ok.do", method = RequestMethod.POST)
	public Map<String, Object> login(@RequestParam(value = "user_id", required = false) String user_id,
			@RequestParam(value = "user_pw", required = false) String user_pw) {

		/** 1) 유효성 검증 */
		// POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
		// REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다.
		if (!regexHelper.isValue(user_id)) {
			return webHelper.getJsonWarning("아이디를 입력하세요.");
		}
		if (!regexHelper.isValue(user_pw)) {
			return webHelper.getJsonWarning("비밀번호를 입력하세요.");
		}

		/** 2) 데이터 조회 */
		Member input = new Member();
		input.setUser_id(user_id);
		input.setUser_pw(user_pw);

		/** 3) 로그인 */
		Member output = null;

		try {
			output = memberService.login(input);

		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 4) 프로필 사진이 존재하는 경우 썸네일 이미지 생성 */
		UploadItem photo = output.getUser_photo();

		if (photo != null) {
			try {
				String thumbPath = webHelper.createThumbnail(photo.getFilePath(), 150, 150, true);

				// 웹 상에서 접근할 수 있는 URL정보 등록
				photo.setFileUrl(webHelper.getUploadUrl(photo.getFilePath()));
				photo.setThumbnailUrl(webHelper.getUploadUrl(thumbPath));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		/** 5) 세션 생성 및 결과 표시 */
		webHelper.setSession("login_info", output);
		return webHelper.getJsonData();
	}

	/**
	 * 로그아웃
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mainPage/logout.do", method = RequestMethod.GET)
	public ModelAndView logout() {
		webHelper.removeSession("login_info");
		return webHelper.redirect("/goodspring/", null);
	}
	
	
	/**
	 * 아이디 찾기 action 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mainPage/login_findID_ok.do", method = RequestMethod.POST)
	public ModelAndView loginFindId_ok(
			@RequestParam(value = "email_search", required = false) String email_search,
			@RequestParam(value = "name_search", required = false) String name_search) {

		/** 1) 유효성 검증 */
		// POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
		// REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다.
		if (!regexHelper.isValue(name_search)) {
			return webHelper.redirect(null,"이름을 입력하세요.");
		}
		if (!regexHelper.isValue(email_search)) {
			return webHelper.redirect(null,"이메일을 입력하세요.");
		}

		/** 2) 데이터 조회 */
		Member input = new Member();
		input.setUser_name(name_search);
		input.setEmail(email_search);
		
		/** 3) 아이디 찾기 */
		Member output = null;

		try {
			output = memberService.findId(input);

		} catch (Exception e) {
			return webHelper.redirect(null,"입력하신 정보에 해당하는 아이디가 없습니다.");
		}
		
		return webHelper.redirect(null, output.getUser_name()+"님의 아이디는 "+ output.getUser_id()+"입니다.");
	}
	
	/**
	 * 비밀번호 찾기 action 페이지
	 * 
	 * @return
	 */
	@RequestMapping(value = "/mainPage/login_findPW_ok.do", method = RequestMethod.POST)
	public ModelAndView loginFindPw_ok(
			@RequestParam(value = "id_search", required = false) String id_search,
			@RequestParam(value = "email_search", required = false) String email_search,
			@RequestParam(value = "name_search", required = false) String name_search) {

		/** 1) 유효성 검증 */
		// POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
		// REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다.
		if (!regexHelper.isValue(name_search)) {
			return webHelper.redirect(null,"이름을 입력하세요.");
		}
		if (!regexHelper.isValue(email_search)) {
			return webHelper.redirect(null,"이메일을 입력하세요.");
		}
		if (!regexHelper.isValue(id_search)) {
			return webHelper.redirect(null,"아이디를 입력하세요.");
		}

		/** 2) 데이터 조회 */
		Member input = new Member();
		input.setUser_id(id_search);
		input.setUser_name(name_search);
		input.setEmail(email_search);
		
		/** 3) 아이디 찾기 */
		Member output = null;

		try {
			output = memberService.findPw(input);

		} catch (Exception e) {
			return webHelper.redirect(null,"입력하신 정보가 잘못되었습니다.");
		}
		/** 4) 임시 비밀번호 생성, DB업데이트 */
		String pw = "";
		for (int i = 0; i < 10; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		
		
		output.setUser_pw(pw);
		
		try {
			memberService.editMember(output);

		} catch (Exception e) {
			return webHelper.redirect(null,"임시 비밀번호 생성에 실패했습니다.");
		}
		
		
		/** 5) 이메일 전송 */
		try {
			// sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
			mailHelper.sendMail(output.getEmail(), "[GoOutOffDay] 임시 비밀번호입니다.", output.getUser_id()+"님의 임시 비밀번호는 "+ pw +"입니다. 변경하여 사용하세요.");
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "메일 발송에 실패했습니다.");
		}
		
		
		
		return webHelper.redirect(null, "입력하신 이메일로 임시 비밀번호가 발송됩니다.");
	}
}
