/*
 * package study.spring.goodspring.controllers;
 * 
 * import java.io.IOException; import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletResponse;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RequestParam; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * import study.spring.goodspring.helper.RegexHelper; import
 * study.spring.goodspring.helper.WebHelper; import
 * study.spring.goodspring.model.Member; import
 * study.spring.goodspring.service.MemberService;
 * 
 * @RestController public class AccountRestController {
 * 
 */	/** WebHelper 주입 */
/*
 * @Autowired WebHelper webHelper;
 * 
 *//** RegexHelper 주입 */
/*
 * @Autowired RegexHelper regexHelper;
 * 
 *//** Service 패턴 구현체 주입 */
/*
 * @Autowired MemberService memberService;
 * 
 *//** 아이디 중복검사 */
/*
 * @RequestMapping(value = "/rest/account/id_unique_check", method =
 * RequestMethod.POST) public Map<String, Object> idUniqueCheck( // 아이디
 * 
 * @RequestParam(value = "user_id", required = false) String userId) {
 * 
 * if (!regexHelper.isValue(userId)) { return
 * webHelper.getJsonWarning("아이디를 입력하세요."); }
 * 
 * Member input = new Member(); input.setUser_id(userId);
 * 
 * try { memberService.idUniqueCheck(input); } catch (Exception e) { return
 * webHelper.getJsonError(e.getLocalizedMessage()); }
 * 
 * return webHelper.getJsonData(); }
 * 
 *//** 아이디 중복검사 (jQuery Form Validate 플러그인용) */
/*
 * // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/rest/account/id_unique_check_jquery", method =
 * RequestMethod.POST) public void idUniqueCheckjQuery(HttpServletResponse
 * response, // 아이디
 * 
 * @RequestParam(value = "user_id", required = false) String userId) {
 * 
 * Member input = new Member(); input.setUser_id(userId); String result =
 * "true";
 * 
 * try { memberService.idUniqueCheck(input); } catch (Exception e) { result =
 * "false"; }
 * 
 * // out객체를 생성하여 문자열을 직접 출력함 try { response.getWriter().print(result); } catch
 * (IOException e) {} }
 * 
 *//** 닉네임 중복검사 */
/*
 * @RequestMapping(value = "/rest/account/id_unique_check", method =
 * RequestMethod.POST) public Map<String, Object> nickUniqueCheck( // 닉네임
 * 
 * @RequestParam(value = "user_nickname", required = false) String userId) {
 * 
 * if (!regexHelper.isValue(userId)) { return
 * webHelper.getJsonWarning("닉네임을 입력하세요."); }
 * 
 * Member input = new Member(); input.setUser_nick(userId);
 * 
 * try { memberService.nickUniqueCheck(input); } catch (Exception e) { return
 * webHelper.getJsonError(e.getLocalizedMessage()); }
 * 
 * return webHelper.getJsonData(); }
 * 
 *//** 닉네임 중복검사 (jQuery Form Validate 플러그인용) */
/*
 * // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/rest/account/id_unique_check_jquery", method =
 * RequestMethod.POST) public void nickUniqueCheckjQuery(HttpServletResponse
 * response, // 아이디
 * 
 * @RequestParam(value = "user_nickname", required = false) String userId) {
 * 
 * Member input = new Member(); input.setUser_nick(userId); String result =
 * "true";
 * 
 * try { memberService.nickUniqueCheck(input); } catch (Exception e) { result =
 * "false"; }
 * 
 * // out객체를 생성하여 문자열을 직접 출력함 try { response.getWriter().print(result); } catch
 * (IOException e) {} }
 * 
 *//** 이메일 중복검사 */
/*
 * @RequestMapping(value = "/rest/account/email_unique_check", method =
 * RequestMethod.POST) public Map<String, Object> emailUniqueCheck( // 아이디
 * 
 * @RequestParam(value = "email", required = false) String email) {
 * 
 * if (!regexHelper.isValue(email)) { return
 * webHelper.getJsonWarning("이메일 주소를 입력하세요."); }
 * 
 * if (!regexHelper.isEmail(email)) { return
 * webHelper.getJsonWarning("이메일 주소가 잘못되었습니다."); }
 * 
 * Member input = new Member(); input.setEmail(email);
 * 
 * try { memberService.emailUniqueCheck(input); } catch (Exception e) { return
 * webHelper.getJsonError(e.getLocalizedMessage()); }
 * 
 * return webHelper.getJsonData(); }
 * 
 *//** 이메일 중복검사 (jQuery Form Validate 플러그인용) */
/*
 * // controller에서 out 객체의 출력결과를 웹브라우저에게 전달할 수 있게 하는 옵션
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/rest/account/email_unique_check_jquery", method =
 * RequestMethod.POST) public void emailUniqueCheckjQuery(HttpServletResponse
 * response, // 아이디
 * 
 * @RequestParam(value = "email", required = false) String email) {
 * 
 * Member input = new Member(); input.setEmail(email); String result = "true";
 * 
 * try { memberService.emailUniqueCheck(input); } catch (Exception e) { result =
 * "false"; }
 * 
 * // out객체를 생성하여 문자열을 직접 출력함 try { response.getWriter().print(result); } catch
 * (IOException e) {} }
 * 
 *//** 회원가입 */
/*
 * @RequestMapping(value = "/rest/account/join", method = RequestMethod.POST)
 * public Map<String, Object> join(
 * 
 * @RequestParam(value = "user_id", required = false) String userId,
 * 
 * @RequestParam(value = "user_pw", required = false) String userPw,
 * 
 * @RequestParam(value = "user_pw_confirm",required = false) String
 * userPwConfirm,
 * 
 * @RequestParam(value = "user_name", required = false) String userName,
 * 
 * @RequestParam(value = "email", required = false) String email,
 * 
 * @RequestParam(value = "phone", required = false) String phone,
 * 
 * @RequestParam(value = "birthday", required = false) String birthday,
 * 
 * @RequestParam(value = "gender", defaultValue = "M") String gender,
 * 
 * @RequestParam(value = "postcode", required = false) String postcode,
 * 
 * @RequestParam(value = "addr1", required = false) String addr1,
 * 
 * @RequestParam(value = "addr2", required = false) String addr2) {
 * 
 *//** 1) 유효성 검증 */
/*
 * // POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해 // REST컨트롤러에서도 프론트의 유효성
 * 검증과 별개로 자체 유효성 검증을 수행해야 한다. if (!regexHelper.isValue(userId)) { return
 * webHelper.getJsonWarning("아이디를 입력하세요."); } if (!regexHelper.isEngNum(userId))
 * { return webHelper.getJsonWarning("아이디는 영어,숫자만 입력 가능합니다."); } if
 * (userId.length() < 4 || userId.length() > 30) { return
 * webHelper.getJsonWarning("아이디는 4~30글자로 입력 가능합니다."); }
 * 
 * if (!regexHelper.isValue(userPw)) { return
 * webHelper.getJsonWarning("비밀번호를 입력하세요."); } if (userPw.length() < 4 ||
 * userPw.length() > 30) { return
 * webHelper.getJsonWarning("비밀번호는 4~30글자로 입력 가능합니다."); } if
 * (!userPw.equals(userPwConfirm)) { return
 * webHelper.getJsonWarning("비밀번호는 확인이 잘못되었습니다."); }
 * 
 * if (!regexHelper.isEmail(email)) { return
 * webHelper.getJsonWarning("이메일이 잘못되었습니다."); } if
 * (!regexHelper.isCellPhone(phone) && !regexHelper.isTel(phone)) { return
 * webHelper.getJsonWarning("연락처가 잘못되었습니다."); } if
 * (!regexHelper.isValue(birthday)) { return
 * webHelper.getJsonWarning("생년월일을 입력하세요."); } if
 * (!regexHelper.isValue(postcode)) { return
 * webHelper.getJsonWarning("우편번호를 입력하세요."); } if (!regexHelper.isValue(addr1))
 * { return webHelper.getJsonWarning("주소1을 입력하세요."); } if
 * (!regexHelper.isValue(addr2)) { return
 * webHelper.getJsonWarning("주소2를 입력하세요."); }
 * 
 * 
 *//** 2) 데이터 저장 */
/*
 * Member input = new Member(); input.setUserId(userId);
 * input.setUserPw(userPw); input.setUserName(userName); input.setEmail(email);
 * input.setPhone(phone); input.setBirthday(birthday); input.setGender(gender);
 * input.setPostcode(postcode); input.setAddr1(addr1); input.setAddr2(addr2);
 * input.setPhoto(item); input.setIsAdmin("N"); // 관리자 아님 input.setIsOut("N");
 * // 탈퇴아님 --> 탈퇴시 'Y'로 업데이트
 * 
 * try { memberService.addMember(input); } catch (Exception e) { return
 * webHelper.getJsonError(e.getLocalizedMessage()); }
 * 
 *//** 4) 결과 표시 *//*
					 * return webHelper.getJsonData(); }
					 * 
					 * 
					 * }
					 */