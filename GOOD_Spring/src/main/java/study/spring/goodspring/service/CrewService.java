package study.spring.goodspring.service;


import java.util.List;

import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewMember;

//크루 데이터 관리 기능을 제공하기위한 Service
public interface CrewService {

	/**
	 * 크루 데이터 상세 조회
	 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	
	public Crew getCrewItem(Crew input) throws Exception;
	
	
	/**
	 * 크루 데이터 목록 조회
	 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Crew> getCrewList(Crew input) throws Exception;
	
	/*
	 * 크루 데이터 등록
	 * @param Crew 저장할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public Crew addCrew(Crew input) throws Exception;
	
	
	/*
	 * 크루 데이터 수정
	 * @param Crew 수정할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int editCrew(Crew input) throws Exception;
	
	
	/*
	 * 크루 데이터 삭제
	 * @param Crew 삭제할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int deleteCrew(Crew input) throws Exception;
	
	/*
	 * 크루 데이터 저장되어 있는 갯수 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getCrewCount(Crew input) throws Exception;
	
	/*
	 * 크루멤버 데이터 카운트 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int updateCrewMemberCount(Crew input) throws Exception;
	
	/*
	 * 가입한 크루 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public List<Crew> selectJoinedCrew(Crew input) throws Exception;

	/*
	 * 가입한 크루멤버 데이터 카운트 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */

	int getJoinedCrewCount(Crew input) throws Exception;




	
	
	
	
}
