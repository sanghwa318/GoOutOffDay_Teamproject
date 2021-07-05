package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

	/** 로그인 */
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
		return webHelper.redirect("/goodspring/", "로그아웃 되었습니다.");
	}
}
