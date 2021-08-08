package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.WalkCourse;

/** 코스목록 데이터 관리 기능을 제공하기 위한 Service계층 */
public interface WalkCourseService {
	
	/**
	 * 걷기코스 데이터 상세 조회
	 * @param input 조회할 코스의 일련번호를 담고 있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	public WalkCourse getWalkCourseItem(WalkCourse input) throws Exception;
	
	/**
	 * 상세페이지에서 걷기코스 데이터 경로 조회
	 * @param input 조회할 코스의 일련번호를 담고 있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	public List<WalkCourse> getWalkCoursePath(WalkCourse input) throws Exception;
	
	/**
	 * 걷기코스 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<WalkCourse> getWalkCourseList(WalkCourse input) throws Exception;
	
	/**
	 * 걷기코스 랜덤 목록 조회(걷기메인페이지)
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<WalkCourse> getWalkCourseRandomList(WalkCourse input) throws Exception;
	
	
	/**
	 * [페이지네이션에 필요]
	 * 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getWalkCourseCount(WalkCourse input) throws Exception;
}
