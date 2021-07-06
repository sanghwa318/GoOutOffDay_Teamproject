package study.spring.goodspring.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;

@Slf4j
@Service
public class CrewServiceImpl implements CrewService{
	
	
	//MyBatis 세션 객체 주입
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	CrewService crewService;

	/**
	 * 크루명 중복 검사
	 */
	
	@Override
	public int getCrewNameCheck(Crew input) throws Exception {
		int result = (int) crewService.getCrewNameCheck(input);
		return result;
	}
	
	
	


}
