package study.spring.goodspring.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;

@Service
@Slf4j
public class CrewServiceImpl implements CrewService{
	
	/**
	 * MyBatis
	 */
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public Crew getCrewItem(Crew input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
