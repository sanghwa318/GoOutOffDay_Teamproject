package study.spring.goodspring.controllers;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
}
