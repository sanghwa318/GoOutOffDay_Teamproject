package study.spring.goodspring.service;

import study.spring.goodspring.model.Crew;

public interface CrewService {
	/**
	 * 크루 데이터 상세 조회
	 * @param Crew 조회할 크루의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Crew getCrewItem(Crew input) throws Exception;
	

}
