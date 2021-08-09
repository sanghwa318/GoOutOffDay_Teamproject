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
	public List<WalkLog> getCourseName(WalkLog input) throws Exception;

	/**
	 * DB에 있는 모든 코스 이름을 조회하여 리턴하는 메서드
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<WalkLog> getCourseName() throws Exception;
	
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
	 * @return 
	 * @throws Exception
	 */
	public int courseNameUniqueCheck(WalkLog input) throws Exception;
	/**
	 * 코스이름이 없는 좌표값(비정상 기록)을 지운다.
	 * @param WalkLog 지울 사용자의 일련번호가 담긴 Beans
	 * @throws Exception
	 */
	public void deleteNull(WalkLog input) throws Exception;
	
	/**
	 * 사용자의 특정 코스이름에 해당하는 좌표값을 리턴하는 메서드
	 * @param WalkLog 조회할 사용자 일련번호와 코스 이름이 담긴 Beans
	 * @return
	 * @throws Exception
	 */
	public List<WalkLog> getLatLonList(WalkLog input) throws Exception;
	
	/**
	 * 사용자의 특정 코스에서 걸린 시간(종료-시작)을 조회하여 리턴하는 메서드
	 * @param WalkLog 조회할 사용자 일련번호와 코스 이름이 담긴 Beans
	 * @return
	 * @throws Exception
	 */
	public WalkLog getTime(WalkLog input) throws Exception;
	
	/**
	 * DB에 있는 모든 사용자 기록에 대한 걸은 거리를 계산하기 위해 좌표값을 조회하는 메서드
	 * @param WalkLog 코스이름이 담긴 Beans
	 * @return
	 * @throws Exception
	 */
	public List<WalkLog> getAllLatLonList(WalkLog input) throws Exception;
	
	/**
	 * 기록하기를 이용한 모든 회원의 일련번호를 리턴하는 메서드
	 * @return
	 * @throws Exception
	 */
	public List<WalkLog> getUserNoList() throws Exception;
	
	
	//두 좌표간의 거리를 계산하는 메서드
	public double distance(double lat1, double lon1, double lat2, double lon2, String unit);
	
    // decimal degrees를 radians으로 바꾼다.
    public  double deg2rad(double deg);
     
    // radians을 decimal degrees로 바꾼다.
    public  double rad2deg(double rad);
    
	/**
	 * 용자가 설정한 목표 기간내에서 코스 이름을 조회하는 메서드
	 * 
	 * @param WalkLog 조회할 사용자 번호 데이터가 담긴 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
    public List<WalkLog> getCnInTerm (WalkLog input) throws Exception;
    
}
