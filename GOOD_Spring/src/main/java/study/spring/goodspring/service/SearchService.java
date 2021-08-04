package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CAS;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkCourse;

/** 통합검색 데이터 관리 기능을 제공하기 위한 Service계층 */
public interface SearchService {
	/**
	 * 걷기코스 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<WalkCourse> getSearchWalkCourseList(WalkCourse input) throws Exception;
	/**
	 * [페이지네이션에 필요]
	 * [걷기코스] 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getSearchWalkCourseCount(WalkCourse input) throws Exception;

	/**
	 * 나만의 코스 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<MyCourses> getSearchMyCourseList(MyCourses input) throws Exception;
	/**
	 * [페이지네이션에 필요]
	 * [나만의 코스] 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getSearchMyCourseCount(MyCourses input) throws Exception;
	
	/**
	 * 크루 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Crew> getSearchCrewList(Crew input) throws Exception;
	/**
	 * [페이지네이션에 필요]
	 * [크루] 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getSearchCrewCount(Crew input) throws Exception;

	/**
	 * 문화체육 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<CAS> getSearchCASList(CAS input) throws Exception;
	/**
	 * [페이지네이션에 필요]
	 * [문화체육] 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getSearchCASCount(CAS input) throws Exception;

}
