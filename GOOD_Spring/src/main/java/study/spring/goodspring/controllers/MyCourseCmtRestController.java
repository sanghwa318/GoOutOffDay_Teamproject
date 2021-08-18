package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.model.MyCourseCmt;
import study.spring.goodspring.service.MyCourseCmtService;

@RestController
public class MyCourseCmtRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	MyCourseCmtService myCourseCmtService;
	
	/**
	 * 나만의 코스 댓글 목록을 불러오기 위한 Rest Controller 메서드
	 * @param mycourse_no
	 * @return
	 */
	@RequestMapping(value = "/commPage/comm_myCourseDetail/comment", method = RequestMethod.GET)
	public Map<String, Object> getCmtList(
			@RequestParam(value = "mycourse_no") int mycourse_no) {
		MyCourseCmt input = new MyCourseCmt();
		input.setMycourse_no(mycourse_no);
		List<MyCourseCmt> list = null;
		int cmtCnt=0;//댓글개수
		try {
			list = myCourseCmtService.getCmtList(input);
			cmtCnt=myCourseCmtService.getCmtCnt(input);
		} catch (Exception e) {
			webHelper.getJsonError(e.getLocalizedMessage());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cmtList", list);
		map.put("cmtCnt", cmtCnt);
		return webHelper.getJsonData(map);
	}
	
	
	/**
	 * 댓글 추가를 위한 Rest Controller 메서드
	 * @param mycourse_no
	 * @return
	 */
	@RequestMapping(value = "/commPage/comm_myCourseDetail/comment", method = RequestMethod.POST)
	public Map<String, Object> addCmt(
			@RequestParam(value = "mycourse_no") int mycourse_no,
			@RequestParam(value = "comment_text") String comment_text
			) {
		// 세션에서 사용자 정보 받아오기
		Member loginInfo = (Member) webHelper.getSession("login_info");
		if(loginInfo==null) {
			return webHelper.getJsonError("잘못된 요청입니다. 로그인 정보를 확인하세요.");
		}
		int user_no = loginInfo.getUser_no();
		String user_nick = loginInfo.getUser_nick();
		
		
		//객체에 파라미터 추가
		MyCourseCmt input = new MyCourseCmt();
		input.setMycourse_no(mycourse_no);
		input.setUser_no(user_no);
		input.setComment_user_nick(user_nick);
		input.setComment_text(comment_text);
		
		int result =0;
		try {
			result = myCourseCmtService.addCmt(input);
		} catch (Exception e) {
			webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}


	/**
	 * 댓글 삭제를 위한 Rest Controller 메서드
	 * @param comment_no
	 * @return
	 */
	@RequestMapping(value = "/commPage/comm_myCourseDetail/comment", method = RequestMethod.DELETE)
	public Map<String, Object> deleteCmt(
			@RequestParam(value = "comment_no") int comment_no) {
		MyCourseCmt input = new MyCourseCmt();
		input.setComment_no(comment_no);
		int result = 0;
		
		// 사용자 정보 유효성 검사를 위해 세션값 받아오기
		Member loginInfo = (Member) webHelper.getSession("login_info");
		int sessionUser_no = loginInfo.getUser_no();

		try {
			int cmtUser_no=myCourseCmtService.getCmtItem(input).getUser_no();
			//사용자가 로그인 하지 않았거나, 로그인정보가 댓글 작성자의 사용자 번호와 다를 경우 예외처리
			if(sessionUser_no!=cmtUser_no || loginInfo==null ) {
				return webHelper.getJsonError("잘못된 요청입니다. 로그인 정보를 확인하세요.");
			}else {
			//사용자 정보가 맞으면, 삭제 진행
			result = myCourseCmtService.deleteCmt(input);
			}
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}
}
