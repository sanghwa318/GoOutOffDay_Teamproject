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
import study.spring.goodspring.model.CrewPostCmt;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.CrewPostCmtService;

@RestController
public class CrewPostCmtRestController {
	
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	CrewPostCmtService crewPostCmtService;
	
	/**
	 * 댓글 추가를 위한 Rest Controller 메서드
	 * @param post_no
	 * @return
	 */
	@RequestMapping(value = "/commPage/comm_crew_post/comment", method = RequestMethod.POST)
	public Map<String, Object> addCmt(
			@RequestParam(value = "crew_post_post_no") int crew_post_post_no,
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
		CrewPostCmt input = new CrewPostCmt();
		input.setCrew_post_post_no(crew_post_post_no);
		input.setUser_info_user_no(user_no);
		input.setComment_text(comment_text);
		input.setComment_usernick(user_nick);
		
		int result =0;
		try {
			result = crewPostCmtService.addCmt(input);
		} catch (Exception e) {
			webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", result);
		return webHelper.getJsonData(map);
	}
	
	/**
	 * 크루 게시물 댓글 목록을 불러오기 위한 Rest Controller 메서드
	 * @param post_no
	 * @return
	 */
	@RequestMapping(value = "/commPage/comm_crew_post/comment", method = RequestMethod.GET)
	public Map<String, Object> getCmtList(
			@RequestParam(value = "crew_post_post_no") int crew_post_post_no) {
		CrewPostCmt input = new CrewPostCmt();
		input.setCrew_post_post_no(crew_post_post_no);
		
		List<CrewPostCmt> list = null;

		try {
			list = crewPostCmtService.getCmtList(input);
		} catch (Exception e) {
			webHelper.getJsonError(e.getLocalizedMessage());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cmtList", list);
		return webHelper.getJsonData(map);
	}
	
	
}
