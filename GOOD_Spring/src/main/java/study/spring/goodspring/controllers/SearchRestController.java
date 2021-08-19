package study.spring.goodspring.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import study.spring.goodspring.helper.PageData;
import study.spring.goodspring.helper.WebHelper;
import study.spring.goodspring.model.CAS;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.SearchService;

@RestController
public class SearchRestController {

	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	@Autowired
	SearchService searchService;

	/** 걷기 목록페이지 */
	@RequestMapping(value = "/mainPage/searchW", method = RequestMethod.GET)
	public Map<String, Object> searchW(
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수 값 생성 */
		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		WalkCourse input_w = new WalkCourse();
		input_w.setCOURSE_CATEGORY_NM(keyword);
		input_w.setSOUTH_NORTH_DIV_NM(keyword);
		input_w.setAREA_GU(keyword);
		input_w.setDISTANCE(keyword);
		input_w.setLEAD_TIME(keyword);

		input_w.setCOURSE_LEVEL(keyword);
		input_w.setRELATE_SUBWAY(keyword);
		input_w.setTRAFFIC_INFO(keyword);
		input_w.setCONTENT(keyword);
		input_w.setCOURSE_NAME(keyword);
		input_w.setREG_DATE(keyword);
		input_w.setCPI_NAME(keyword);

		// 조회 결과가 저장될 객체
		List<WalkCourse> output_w = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = searchService.getSearchWalkCourseCount(input_w);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			WalkCourse.setOffset(pageData.getOffset());
			WalkCourse.setListCount(pageData.getListCount());

			output_w = searchService.getSearchWalkCourseList(input_w);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item_w", output_w); // view에서 item
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}

	/** 나만의 코스 목록 페이지 */
	@RequestMapping(value = "/mainPage/searchM", method = RequestMethod.GET)
	public Map<String, Object> searchM(
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수 값 생성 */
		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		// 나만의 코스
		MyCourses input_m = new MyCourses();
		input_m.setMycourse_name(keyword);
		input_m.setMycourse_area(keyword);

		// 조회 결과가 저장될 객체
		List<MyCourses> output_m = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = searchService.getSearchMyCourseCount(input_m);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			MyCourses.setOffset(pageData.getOffset());
			MyCourses.setListCount(pageData.getListCount());

			output_m = searchService.getSearchMyCourseList(input_m);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item_m", output_m); // view에서 item
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}

	/** 크루 목록 페이지 */
	@RequestMapping(value = "/mainPage/searchC", method = RequestMethod.GET)
	public Map<String, Object> searchC(
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수 값 생성 */
		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		// 크루
		Crew input_c = new Crew();
		input_c.setCrew_name(keyword);
		input_c.setCrew_area(keyword);
		input_c.setCrew_sinto(keyword);
		input_c.setCrew_category(keyword);

		// 조회 결과가 저장될 객체
		List<Crew> output_c = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = searchService.getSearchCrewCount(input_c);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			Crew.setOffset(pageData.getOffset());
			Crew.setListCount(pageData.getListCount());

			output_c = searchService.getSearchCrewList(input_c);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item_c", output_c); // view에서 item
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}

	/** 문화체육 목록 페이지 */
	@RequestMapping(value = "/mainPage/searchCAS", method = RequestMethod.GET)
	public Map<String, Object> searchCAS(
			// 검색어
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			// [페이지네이션] 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {

		/** 1) 페이지 구현에 필요한 변수 값 생성 */
		// [페이지네이션] 변수 추가
		int totalCount = 0; // 전체 게시글 수
		int listCount = 4; // 한페이지단 표시할 목록수
		int pageCount = 5; // 한그룹당 표시할 페이지 번호수
		// [페이지네이션] 객체 추가
		PageData pageData = null;
		// [페이지네이션] 변수 추가 (종료)

		/** 2) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 Beans에 담는다.
		// 문화체육
		CAS input_cas = new CAS();
		input_cas.setMAXCLASSNM(keyword);
		input_cas.setMINCLASSNM(keyword);
		input_cas.setSVCSTATNM(keyword);
		input_cas.setSVCNM(keyword);
		input_cas.setPLACENM(keyword);

		input_cas.setUSETGTINFO(keyword);
		input_cas.setAREANM(keyword);
		input_cas.setTELNO(keyword);

		// 조회 결과가 저장될 객체
		List<CAS> output_cas = null;

		try {
			// [페이지네이션] 전체 게시글 수 조회 (객체 바꿔넣기)
			totalCount = searchService.getSearchCASCount(input_cas);
			// [페이지네이션] 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);

			// [페이지네이션] SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장
			CAS.setOffset(pageData.getOffset());
			CAS.setListCount(pageData.getListCount());

			output_cas = searchService.getSearchCASList(input_cas);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("keyword", keyword);
		data.put("item_cas", output_cas); // view에서 item
		data.put("meta", pageData);

		return webHelper.getJsonData(data);
	}
}
