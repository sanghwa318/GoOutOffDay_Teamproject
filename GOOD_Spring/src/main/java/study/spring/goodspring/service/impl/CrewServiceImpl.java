package study.spring.goodspring.service.impl;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;

@Slf4j
@Service
public class CrewServiceImpl implements CrewService{
	
	
	

	@Autowired
	CrewService crewService;

	/**
	 * 크루명 중복 검사
	 */
	@Override
	public boolean getCrewNameCheck(HttpServletRequest request) {
		return false;
//		boolean result = false;
//		
//		//매개변수가 request이면 파라미터를 먼저 읽어야함
//		String e = request.getParameter("crew_name");
//		String name = e;
//		
//		//Dao 메소드 호출
//		String r = crewDao.CrewNameCheck(name);
//		
//		
//		//중복검사 결과가 존재하지 않으면
//		if(r==null) {
//			//중복검사 통과
//			result = true;
//			
//		}
//		return result;
	}


	

	
	
	


}
