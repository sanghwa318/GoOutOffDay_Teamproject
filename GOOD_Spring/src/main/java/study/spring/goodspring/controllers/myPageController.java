package study.spring.goodspring.controllers;


import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.MailHelper;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.UploadItem;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.MemberService;

@RestController
public class myPageController {

	@Autowired
	WebHelper webHelper;
	@Autowired
	MemberService memberService;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MailHelper mailHelper;
	//프로젝트이름에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;
	

	
	@RequestMapping(value = "/myPage/myPage_index_imageOk.do", method = RequestMethod.POST)
	public ModelAndView myPageIndexImageOk(
			HttpServletRequest request,
			@RequestParam(value="user_photo", required = false) MultipartFile photo) {
		 /** 1) 업로드 처리 */
        UploadItem item = null;
        try {
            item = webHelper.saveMultipartFile(photo);
        } catch (NullPointerException e) {
            // 업로드 된 파일이 없는 경우
            e.printStackTrace();
            photo = null;
        } catch (Exception e) {
            e.printStackTrace();
            return webHelper.redirect(null,"업로드에 실패했습니다.");
        }
        /** 2) 데이터 저장 */
        Member loginInfo =(Member) request.getSession().getAttribute("login_info");
        
        loginInfo.setUser_photo(item);

        try {
            memberService.editPhoto(loginInfo);
        } catch (Exception e) {
            return webHelper.redirect(null,e.getLocalizedMessage());
        }

        /** 3) 결과 표시 */
        return webHelper.redirect("/goodspring/myPage/myPage_index.do","프로필 사진을 변경했습니다.");
    }
	
	
	/** 닉네임 중복검사 */
    @RequestMapping(value = "/myPage/myPage_accountEdit/nickname_unique_check", method = RequestMethod.POST)
    public Map<String, Object> nickUniqueCheck(
            // 닉네임
            @RequestParam(value = "user_nick", required = false) String userNick) {

        if (!regexHelper.isValue(userNick)) {
            return webHelper.getJsonWarning("닉네임을 입력하세요.");
        }
        
        Member input = new Member();
        input.setUser_nick(userNick);
        
        try {
            memberService.nickUniqueCheck(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }
    
    /** 닉네임 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/myPage/myPage_accountEdit/nickname_unique_check_jquery", method = RequestMethod.POST)
    public void nickUniqueCheckjQuery(HttpServletResponse response,
            // 닉네임
            @RequestParam(value = "user_nick", required = false) String userNick) {
        
        Member input = new Member();
        input.setUser_nick(userNick);
        String result = "true";
        
        try {
            memberService.nickUniqueCheck(input);
        } catch (Exception e) {
            result = "false";
        }

        // out객체를 생성하여 문자열을 직접 출력함
        try {
            response.getWriter().print(result);
        } catch (IOException e) {}
    }

    /** 이메일 중복검사 */
    @RequestMapping(value = "/myPage/myPage_accountEdit/email_unique_check", method = RequestMethod.POST)
    public Map<String, Object> emailUniqueCheck(
            // 아이디
            @RequestParam(value = "email", required = false) String email) {

        if (!regexHelper.isValue(email)) {
            return webHelper.getJsonWarning("이메일 주소를 입력하세요.");
        }
        
        if (!regexHelper.isEmail(email)) {
            return webHelper.getJsonWarning("이메일 주소가 잘못되었습니다.");
        }
        
        Member input = new Member();
        input.setEmail(email);
        
        try {
            memberService.emailUniqueCheck(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        return webHelper.getJsonData();
    }
    
    /** 이메일 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/myPage/myPage_accountEdit/email_unique_check_jquery", method = RequestMethod.POST)
    public void emailUniqueCheckjQuery(HttpServletResponse response,
            // 아이디
            @RequestParam(value = "email", required = false) String email) {
        
        Member input = new Member();
        input.setEmail(email);
        String result = "true";
        
        try {
            memberService.emailUniqueCheck(input);
        } catch (Exception e) {
            result = "false";
        }

        // out객체를 생성하여 문자열을 직접 출력함
        try {
            response.getWriter().print(result);
        } catch (IOException e) {}
    }
    
	
	/** 회원정보수정 */
    @RequestMapping(value = "/myPage/myPage_accountEdit_ok", method = RequestMethod.POST)
    public Map<String, Object> editMember(
    		@RequestParam(value = "user_id", 		 required = false) String userId,
            @RequestParam(value = "user_nick", 		 required = false) String userNick,
            @RequestParam(value = "user_pw",        required = false) String userPw,
            @RequestParam(value = "user_pw_re",		required = false) String userPwRe,
            @RequestParam(value = "user_name",      required = false) String userName,
            @RequestParam(value = "email",          required = false) String email,
            @RequestParam(value = "tel",            required = false) String tel,
            @RequestParam(value = "postcode",       required = false) String postcode,
            @RequestParam(value = "addr1",      	required = false) String addr1,
            @RequestParam(value = "addr2", 			required = false) String addr2) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다. 
        
        if (!regexHelper.isValue(userNick)) { return webHelper.getJsonWarning("닉네임을 입력하세요."); }
        if (!regexHelper.isEngNum(userNick)) { return webHelper.getJsonWarning("닉네임은 영어,숫자만 입력 가능합니다."); }
        if (userNick.length() < 4 || userNick.length() > 30) { return webHelper.getJsonWarning("닉네임은 4~30글자로 입력 가능합니다."); }
        
        if (!regexHelper.isValue(userPw)) { return webHelper.getJsonWarning("비밀번호를 입력하세요."); }
        if (userPw.length() < 4 || userPw.length() > 30) { return webHelper.getJsonWarning("비밀번호는 4~30글자로 입력 가능합니다."); }
        if (!userPw.equals(userPwRe)) { return webHelper.getJsonWarning("비밀번호는 확인이 잘못되었습니다."); }
        
        if (!regexHelper.isValue(userName)) { return webHelper.getJsonWarning("이름 입력하세요."); }
        if (!regexHelper.isKor(userName)) { return webHelper.getJsonWarning("이름은 한글만 입력 가능합니다."); }
        if (userName.length() > 30) { return webHelper.getJsonWarning("이름은 최대 30글자로 입력 가능합니다."); }
        
        if (!regexHelper.isEmail(email)) { return webHelper.getJsonWarning("이메일이 잘못되었습니다."); }
        if (!regexHelper.isCellPhone(tel) && !regexHelper.isTel(tel)) { return webHelper.getJsonWarning("연락처가 잘못되었습니다."); }
        if (!regexHelper.isValue(postcode)) { return webHelper.getJsonWarning("우편번호를 입력하세요."); }
        if (!regexHelper.isValue(addr1)) { return webHelper.getJsonWarning("도로명주소를 입력하세요."); }
        if (!regexHelper.isValue(addr2)) { return webHelper.getJsonWarning("나머지주소를 입력하세요."); }

        
       
        /** 2) 데이터 저장 */
        Member input = new Member();
        input.setUser_id(userId);
        input.setUser_nick(userNick);
        input.setUser_pw(userPw);
        input.setUser_name(userName);
        input.setEmail(email);
        input.setTel(tel);
        input.setPost(postcode);
        input.setAddress1(addr1);
        input.setAddress2(addr2);

        
        try {
            memberService.editMember(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /**3) 수정된 정보 세션 업데이트 */
        Member output = null;

		try {
			output = memberService.login(input);

		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

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

        /** 4) 결과 표시 */
		webHelper.setSession("login_info", output);
        return webHelper.getJsonData();
    }
    
    /**회원탈퇴 페이지에서 보여줄 회원 정보상세페이지 */
    @RequestMapping(value = "/myPage/myPage_accountOut.do", method = RequestMethod.GET)
    public ModelAndView view() {
   
    	return new ModelAndView("myPage/myPage_accountOut");
    }
    
    /**삭제처리 */
    @RequestMapping(value = "/myPage/myPage_accountOut_delete_ok.do", method = RequestMethod.GET)
    public ModelAndView delete_ok() {
    	
    	
    
    	/** 2) 데이터 삭제하기 */
    	Member input = (Member)webHelper.getSession("login_info");
    	input.setUser_id(input.getUser_id());
    	
    	try {
			memberService.deleteMember(input);  //데이터 삭제
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
    	
    	/** 3) 페이지 이동 */
    	//확인할 대상이 삭제된 상태이므로 메인 페이지로 이동
    	webHelper.removeAllSession();
    	return webHelper.redirect(contextPath + "/", "탈퇴되었습니다.");
    	
    }
}
