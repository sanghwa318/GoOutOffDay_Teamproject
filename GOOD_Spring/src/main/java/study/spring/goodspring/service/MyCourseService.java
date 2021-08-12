package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.MyCourses;

//나만의 코스 데이터 관리 기능을 제공하기위한 Service
public interface MyCourseService {

	/**
	 * 나만의코스 데이터 상세 조회
	 * @param MyCourses 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public MyCourses getMyCourseItem(MyCourses input) throws Exception;
	
	/**
	 * 나만의코스 입력, 수정 후 조회.
	 * @param MyCourses 조회할 데이터의 이름, 내용, 지역정보를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public MyCourses getMyCoursePost(MyCourses input) throws Exception;
	
	/**
	 * 나만의코스 데이터 목록 조회
	 * @param MyCourses 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<MyCourses> getMyCourseList(MyCourses input) throws Exception;
	
	/*
	 * 나만의코스 데이터 등록
	 * @param MyCourse 저장할 정보를 담고 있는 Beans
	 * @return MyCourses 
	 * @throws Exception
	 */
	public MyCourses addMyCourse(MyCourses input) throws Exception;
	
	
	/*
	 * 나만의코스 데이터 수정
	 * @param MyCourse 수정할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public void editMyCourse(MyCourses input) throws Exception;
	
	
	/*
	 * 나만의코스 데이터 삭제
	 * @param MyCourse 삭제할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int deleteMyCourse(MyCourses input) throws Exception;
	
	/*
	 * 나만의코스 데이터 저장되어 있는 갯수 조회
	 * @param MyCourse 조회할 정보를  담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getMyCourseCount(MyCourses input) throws Exception;
	
	/*
	 * 나만의코스 조회수 증가 메서드.
	 * @param MyCourse update할 데이터를 검색할 조건을 담고 있는 Beans
	 * @return void
	 * @throws Exception
	 */
	public void updateHits(MyCourses input) throws Exception;
	
	/**
	 * 나만의 코스 중복검사
	 * @param MyCourse 코스이름이 담긴 Beans
	 * @return int
	 * @throws Exception
	 */
	public boolean courseUniqueChk(MyCourses input) throws Exception;
	
	/**
	 * 나만의 코스 댓글 수 조회
	 * @param MyCourse 코스이름이 담긴 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getMyCourseCmtCount(MyCourses input) throws Exception;
	
	/**
	 * 명예의전당 데이터 목록 조회
	 * @param MyCourses 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<MyCourses> getRankMyCourseList(MyCourses input) throws Exception;
}
