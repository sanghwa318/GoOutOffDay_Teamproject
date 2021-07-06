package study.spring.goodspring.service;

import study.spring.goodspring.model.Crew;

//크루 데이터 관리 기능을 제공하기위한 Service
public interface CrewService {

	/**
	 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	
	public Crew getCrewNameCheck(Crew input) throws Exception;
}
