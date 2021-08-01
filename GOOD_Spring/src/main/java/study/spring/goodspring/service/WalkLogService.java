package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.WalkLog;

public interface WalkLogService {
	/**
	 * 좌표데이터를 insert하기 위한 메서드
	 * 
	 * @param WalkLog insert할 데이터가 담긴 Beans
	 * @throws Exception
	 */
	public void addWalkLog(WalkLog input) throws Exception;

	/**
	 * 일련의 좌표데이터의 처음(event_name이 '시작')을 inset하기 위한 메서드
	 * 
	 * @param WalkLog insert할 데이터가 담긴 Beans
	 * @throws Exception
	 */
	public void startRecord(WalkLog input) throws Exception;

	/**
	 * 일련의 좌표데이터의 끝(event_name이 '종료', )을 update하기 위한 메서드
	 * 
	 * @param WalkLog 수정할 데이터가 담긴 Beans
	 * @throws Exception
	 */
	public void endRecord(WalkLog input) throws Exception;

	/**
	 * 나만의코스 데이터 등록을 위한 좌표값을 받아오는 메서드
	 * 
	 * @param WalkLog 조회할 데이터가 담긴 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<WalkLog> getLoc(WalkLog input) throws Exception;
	
	/**
	 * 나만의코스 코스 상세페이지를 위한 좌표값을 받아오는 메서드
	 * 
	 * @param WalkLog 조회할 데이터가 담긴 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<WalkLog> getLoc2(WalkLog input) throws Exception;

	/**
	 * 나만의코스 데이터 등록을 위한 코스이름을 받아오는 메서드
	 * 
	 * @param WalkLog 조회할 사용자 번호 데이터가 담긴 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<WalkLog> getCoureName(WalkLog input) throws Exception;

	/**
	 * 일련의 좌표데이터의 course_name을 설정해주기 위한 update 메서드
	 * 
	 * @param WalkLog 수정할 데이터가 담긴 Beans
	 * @throws Exception
	 */
	public void updateCourseName(WalkLog input) throws Exception;
	
	/**
	 * 코스네임 중복 검사
	 * 
	 * @param WalkLog 조회할 데이터가 담긴 Beans
	 * @throws Exception
	 */
	public void courseNameUniqueCheck(WalkLog input) throws Exception;
	/**
	 * 코스이름이 없는 좌표값(비정상 기록)을 지운다.
	 * @param WalkLog 지울 사용자의 일련번호가 담긴 Beans
	 * @throws Exception
	 */
	public void deleteNull(WalkLog input) throws Exception;
}
