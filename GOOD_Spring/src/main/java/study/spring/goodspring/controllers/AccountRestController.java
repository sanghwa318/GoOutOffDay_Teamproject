package study.spring.goodspring.controllers;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.MemberService;

@RestController
public class AccountRestController {

    /** WebHelper 주입 */
    @Autowired
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired
    MemberService memberService;

    
    /** 아이디 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/mainPage/join/id_unique_check", method = RequestMethod.POST)
    public void idUniqueCheckjQuery(HttpServletResponse response,
            // 아이디
            @RequestParam(value = "user_id", required = false) String userId) {
        
        Member input = new Member();
        input.setUser_id(userId);
        String result = "true";
        
        try {
            memberService.idUniqueCheck(input);
        } catch (Exception e) {
            result = "false";
        }

        // out객체를 생성하여 문자열을 직접 출력함
        try {
            response.getWriter().print(result);
        } catch (IOException e) {}
    }

    
    /** 닉네임 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/mainPage/join/nickname_unique_check", method = RequestMethod.POST)
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

    
    /** 이메일 중복검사 (jQuery Form Validate 플러그인용) */
    // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
    @ResponseBody
    @RequestMapping(value = "/mainPage/join/email_unique_check", method = RequestMethod.POST)
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

    /** 회원가입 */
    @RequestMapping(value = "/mainPage/join", method = RequestMethod.POST)
    public Map<String, Object> join(
            @RequestParam(value = "user_id") String userId,
            @RequestParam(value = "user_nick") String userNick,
            @RequestParam(value = "user_pw") String userPw,
            @RequestParam(value = "user_pw_re") String userPwRe,
            @RequestParam(value = "user_name") String userName,
            @RequestParam(value = "email") String email,
            @RequestParam(value = "tel") String tel,
            @RequestParam(value = "postcode") String postcode,
            @RequestParam(value = "addr1") String addr1,
            @RequestParam(value = "addr2") String addr2,
            @RequestParam(value = "gender") String gender) {

        /** 1) 유효성 검증 */
        // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
        // REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다. 
        if (!regexHelper.isValue(userId)) { return webHelper.getJsonWarning("아이디를 입력하세요."); }
        if (!regexHelper.isEngNum(userId)) { return webHelper.getJsonWarning("아이디는 영어,숫자만 입력 가능합니다."); }
        if (userId.length() < 4 || userId.length() > 30) { return webHelper.getJsonWarning("아이디는 4~30글자로 입력 가능합니다."); }
        
        if (!regexHelper.isValue(userNick)) { return webHelper.getJsonWarning("닉네임을 입력하세요."); }
        if (!regexHelper.isNick(userNick)) { return webHelper.getJsonWarning("닉네임은 한글,영어,숫자,특수문자만 입력 가능합니다."); }
        if (userNick.length() < 1 || userNick.length() > 30) { return webHelper.getJsonWarning("닉네임은 1~30글자로 입력 가능합니다."); }
        
        if (!regexHelper.isValue(userPw)) { return webHelper.getJsonWarning("비밀번호를 입력하세요."); }
        if (userPw.length() < 4 || userPw.length() > 30) { return webHelper.getJsonWarning("비밀번호는 4~30글자로 입력 가능합니다."); }
        if (!userPw.equals(userPwRe)) { return webHelper.getJsonWarning("비밀번호 확인이 잘못되었습니다."); }
        
        if (!regexHelper.isValue(userName)) { return webHelper.getJsonWarning("이름을 입력하세요."); }
        if (!regexHelper.isKor(userName)) { return webHelper.getJsonWarning("이름은 한글만 입력 가능합니다."); }
        if (userName.length() > 30) { return webHelper.getJsonWarning("이름은 최대 30글자로 입력 가능합니다."); }
        
        if (!regexHelper.isValue(email)) { return webHelper.getJsonWarning("이메일을 입력하세요."); }
        if (!regexHelper.isEmail(email)) { return webHelper.getJsonWarning("이메일이 잘못되었습니다."); }
        if (!regexHelper.isValue(tel)) { return webHelper.getJsonWarning("연락처를 입력하세요."); }
        if (!regexHelper.isCellPhone(tel) && !regexHelper.isTel(tel)) { return webHelper.getJsonWarning("연락처가 잘못되었습니다."); }
        if (!regexHelper.isValue(postcode)) { return webHelper.getJsonWarning("우편번호를 입력하세요."); }
        if (!regexHelper.isValue(addr1)) { return webHelper.getJsonWarning("도로명주소를 입력하세요."); }
        if (!regexHelper.isValue(addr2)) { return webHelper.getJsonWarning("나머지주소를 입력하세요."); }
        if (!regexHelper.isValue(gender)) { return webHelper.getJsonWarning("성별을 선택하세요."); }
        
       
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
        input.setGender(gender);

        
        try {
            memberService.addMember(input);
        } catch (Exception e) {
            return webHelper.getJsonError(e.getLocalizedMessage());
        }

        /** 4) 결과 표시 */
        return webHelper.getJsonData();
    }
    
  

}