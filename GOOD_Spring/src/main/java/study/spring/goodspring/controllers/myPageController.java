package study.spring.goodspring.controllers;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import study.spring.goodspring.helper.MailHelper;
import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.RegexHelper;
import study.spring.goodspring.helper.UploadItem;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.BookMark;
import study.spring.goodspring.model.Inquiry;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.BookMarkService;
import study.spring.goodspring.service.InquiryService;
import study.spring.goodspring.service.MemberService;

@RestController
public class myPageController {

	@Autowired
	WebHelper webHelper;
	@Autowired
	MemberService memberService;
	@Autowired
	InquiryService inquiryService;
	@Autowired
	RegexHelper regexHelper;
	@Autowired
	MailHelper mailHelper;

	@Autowired
	BookMarkService bookMarkService;

	// 프로젝트이름에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/**
	 * 마이페이지 이미지 업로드 action페이지
	 * 
	 * @param request 세션 정보를 받아오기 위해 전달받는 HttpServletRequest 객체
	 * @param photo   이미지 파일 정보
	 * @return ModelAndView
	 */
	@ResponseBody
	@RequestMapping(value = "/myPage/myPage_index_image_ok.do", method = RequestMethod.POST)
	public ModelAndView myPageIndexImageOk(HttpServletRequest request,
			@RequestParam(value = "user_photo", required = false) MultipartFile photo) {
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
			return webHelper.redirect(null, "업로드에 실패했습니다.");
		}
		/** 2) 데이터 저장 */
		Member loginInfo = (Member) webHelper.getSession("login_info");

		loginInfo.setUser_photo(item);

		try {
			memberService.editPhoto(loginInfo);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과 표시 */
		return webHelper.redirect("/goodspring/myPage/myPage_index.do", "프로필 사진을 변경했습니다.");
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
		} catch (IOException e) {
		}
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
		} catch (IOException e) {
		}
	}
	/** 회원정보수정 */
	@RequestMapping(value = "/myPage/myPage_accountEdit_ok", method = RequestMethod.POST)
	public Map<String, Object> editMember(@RequestParam(value = "user_id", required = false) String userId,
			@RequestParam(value = "user_nick", required = false) String userNick,
			@RequestParam(value = "user_pw", required = false) String userPw,
			@RequestParam(value = "user_pw_re", required = false) String userPwRe,
			@RequestParam(value = "user_name", required = false) String userName,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "tel", required = false) String tel,
			@RequestParam(value = "postcode", required = false) String postcode,
			@RequestParam(value = "addr1", required = false) String addr1,
			@RequestParam(value = "addr2", required = false) String addr2) {

		/** 1) 유효성 검증 */
		// POSTMAN 등의 클라이언트 프로그램으로 백엔드에 직접 접속하는 경우를 방지하기 위해
		// REST컨트롤러에서도 프론트의 유효성 검증과 별개로 자체 유효성 검증을 수행해야 한다.
		if(userNick!=null) {
			if (!regexHelper.isEngNum(userNick)) {
				return webHelper.getJsonWarning("닉네임은 영어,숫자만 입력 가능합니다.");
			}
			if (userNick.length() < 4 || userNick.length() > 30) {
				return webHelper.getJsonWarning("닉네임은 4~30글자로 입력 가능합니다.");
			}
		}

		if (regexHelper.isValue(userPw)) {
			if (userPw.length() < 4 || userPw.length() > 30) {
				return webHelper.getJsonWarning("비밀번호는 4~30글자로 입력 가능합니다.");
			}
			if (!userPw.equals(userPwRe)) {
				return webHelper.getJsonWarning("비밀번호 확인이 잘못되었습니다.");
			}
		}

		if (regexHelper.isValue(userName)) {
			if (!regexHelper.isKor(userName)) {
				return webHelper.getJsonWarning("이름은 한글만 입력 가능합니다.");
			}
			if (userName.length() > 30) {
				return webHelper.getJsonWarning("이름은 최대 30글자로 입력 가능합니다.");
			}
		}

		if (!regexHelper.isEmail(email)) {
			return webHelper.getJsonWarning("이메일 형식이 잘못되었습니다.");
		}
		if (!regexHelper.isCellPhone(tel) && !regexHelper.isTel(tel)) {
			return webHelper.getJsonWarning("연락처가 잘못되었습니다.");
		}
		if(addr1!=null && (addr2==null || addr2=="")) {
			return webHelper.getJsonWarning("나머지 주소를 입력해 주세요.");			
		}

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

		/** 3) 수정된 정보 세션 업데이트 */
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

	/** 회원탈퇴 페이지에서 보여줄 회원 정보상세페이지 */
	@RequestMapping(value = "/myPage/myPage_accountOut.do", method = RequestMethod.GET)
	public ModelAndView view() {

		return new ModelAndView("myPage/myPage_accountOut");
	}

	/** 삭제처리 */
	@RequestMapping(value = "/myPage/myPage_accountOut_delete_ok", method = RequestMethod.GET)
	public ModelAndView delete_ok() {

		/** 2) 데이터 삭제하기 */
		Member input = (Member) webHelper.getSession("login_info");
		/* Member input = new Member(); */

		try {

			memberService.userOutMember(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 페이지 이동 */
		// 확인할 대상이 삭제된 상태이므로 메인 페이지로 이동
		webHelper.removeAllSession();
		return webHelper.redirect(contextPath + "/", "탈퇴되었습니다.");

	}

	/**
	 * 1:1문의 리스트 페이지
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/myPage/myPage_inquiry.do", method = RequestMethod.GET)
	public ModelAndView InquiryList(Model model) {
		/* 1) 데이터 조회하기 */
		// 현재 사용자의 정보를 받아오기 위한 session을 받아와서
		// Member타입의 객체에 담는다.
		Member loginInfo = ((Member) webHelper.getSession("login_info"));

		Inquiry input = new Inquiry();
		// 사용자 정보에서 user_no를 input에 설정
		input.setUser_info_user_no(loginInfo.getUser_no());

		List<Inquiry> output = null;

		try {
			// 데이터 조회
			output = inquiryService.getInquiryList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// 3) View 처리
		model.addAttribute("output", output);
		return new ModelAndView("myPage/myPage_inquiry");

	}

	/**
	 * 1:1문의 상세 페이지
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/myPage/myPage_inquiryDetail.do", method = RequestMethod.GET)
	public ModelAndView InquiryDetail(Model model, @RequestParam(value = "QnA_no") int QnA_no) {
		/* 1) 데이터 조회하기 */

		Inquiry input = new Inquiry();
		input.setQnA_no(QnA_no);
		Inquiry output = null;

		try {
			// 데이터 조회
			output = inquiryService.getInquiryItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		// 3) View 처리
		model.addAttribute("output", output);
		return new ModelAndView("myPage/myPage_inquiryDetail");

	}

	/**
	 * 1:1 문의 작성 페이지
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/myPage/myPage_inquiryWrite.do", method = RequestMethod.GET)
	public ModelAndView InquiryWrite() {

		return new ModelAndView("myPage/myPage_inquiryWrite");

	}

	/**
	 * 1:1 문의 작성을 위한 action 페이지
	 * 
	 * @return ModelAndView
	 */
	@RequestMapping(value = "/myPage/myPage_inquiryWrite_ok", method = RequestMethod.POST)
	public ModelAndView InquiryWriteOk(Model model, @RequestParam(value = "QnA_title") String QnA_title,
			@RequestParam(value = "QnA_category") String QnA_category,
			@RequestParam(value = "QnA_text") String QnA_text) {
		if (!regexHelper.isValue(QnA_title)) {
			return webHelper.redirect(null, "제목을 입력하세요");
		}
		if (!regexHelper.isValue(QnA_category)) {
			return webHelper.redirect(null, "카테고리를 선택하세요");
		}
		if (!regexHelper.isValue(QnA_text)) {
			return webHelper.redirect(null, "내용을 입력하세요");
		}
		Inquiry input = new Inquiry();
		Member loginInfo = (Member) webHelper.getSession("login_info");
		input.setQnA_title(QnA_title);
		input.setQnA_category(QnA_category);
		input.setQnA_text(QnA_text);
		input.setUser_info_user_no(loginInfo.getUser_no());

		Inquiry output = null;

		try {
			output = inquiryService.addInquiry(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return webHelper.redirect(contextPath + "/myPage/myPage_inquiryDetail.do" + "?QnA_no=" + output.getQnA_no(),
				"작성되었습니다.");

	}

	/** 나의 찜목록 보기를 위한 컨트롤러 **/
	@RequestMapping(value = "/myPage/myPage_bookmark.do", method = RequestMethod.GET)
	public ModelAndView CASListBookMark(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage,
			HttpServletRequest request, HttpServletResponse response) {
		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 6; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		Member loginInfo = (Member) webHelper.getSession("login_info", new Member());
		BookMark input_cas = new BookMark();

		input_cas.setUser_info_user_no(loginInfo.getUser_no());

		List<BookMark> output = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = bookMarkService.getBookMarkCount(input_cas);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			BookMark.setOffset(pageData.getOffset());
			BookMark.setListCount(pageData.getListCount());

			output = bookMarkService.myBookMarkAllList(input_cas);
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// [페이지네이션]
		model.addAttribute("pageData", pageData);
		model.addAttribute("output", output);

		return new ModelAndView("myPage/myPage_bookmark");
	}
}
