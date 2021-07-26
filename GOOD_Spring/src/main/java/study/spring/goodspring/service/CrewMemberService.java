package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CrewMember;

public interface CrewMemberService {

	/**
	 * 크루멤버 데이터 상세 조회
	 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	
	public boolean getCrewMemberItem(CrewMember input) throws Exception;
	
	
	/**
	 * 크루멤버 데이터 목록 조회
	 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<CrewMember> getCrewMemberList(CrewMember input) throws Exception;
	
	/*
	 * 크루멤버 데이터 등록
	 * @param Crew 저장할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int addCrewMember(CrewMember input) throws Exception;
	
	
	/*
	 * 크루멤버 데이터 수정
	 * @param Crew 수정할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int editCrewMember(CrewMember input) throws Exception;
	
	
	/*
	 * 크루멤버 데이터 삭제
	 * @param Crew 삭제할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int deleteCrewMember(CrewMember input) throws Exception;
	
	/*
	 * 크루멤버 데이터 저장되어 있는 갯수 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getCrewMemberCount(CrewMember input) throws Exception;
	
	/**
	 * 마이크루 삭제
	 * @param input
	 * @return int
	 * @throws Exception
	 */
	public int deleteMyCrew(CrewMember input) throws Exception;
	

	/**
	 * 크루장의 크루탈퇴 방지
	 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	
	public boolean getCrewno(CrewMember input) throws Exception;
	
}
