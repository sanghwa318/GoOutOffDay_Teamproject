package study.spring.goodspring.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;

//크루 데이터 관리 기능을 제공하기 위한 Service 계층에대한 구현체
@Slf4j
@Service
public class CrewServiceImpl implements CrewService{
	
	//MyBatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlSession;
	

	@Autowired
	CrewService crewService;

	/*
	 * 크루 데이터 상세 조회
	 * @param Crew 조회할 크루의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	
	@Override
	public Crew getCrewItem(Crew input) throws Exception {
		Crew result = null;
		
		try {
			result = sqlSession.selectOne("CrewMapper.selectCrewItem", input);
			
			if(result == null) {
				throw new NullPointerException("result = null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 크루 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("크루 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	
	/*
	 * 크루 목록 조회
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */

	@Override
	public List<Crew> getCrewList(Crew input) throws Exception {
		List<Crew> result = null;
		
		try {
			result = sqlSession.selectList("CrewMapper.selectCrewList",input);
			
			if(result== null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	
	/*
	 * 크루 데이터 등록
	 * @param Crew 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */

	@Override
	public int addCrew(Crew input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CrewMapper.insertCrew", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 크루가 없습니다.");
		}
		catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("크루 등록에 실패했습니다.");
		}
		
		return result;
	}

	/*
	 * 크루 데이터 수정
	 * @param Crew 수정할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	@Override
	public int editCrew(Crew input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CrewMapper.updateCrew", input);
			
			if(result==0) {
				throw new NullPointerException("result=0");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 크루 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("크루 데이터 수정에 실패했습니다.");
		}
		
		
		
		return result;
	}
	
	
	

	/*
	 * 크루 데이터 삭제
	 * @param Crew 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	
	@Override
	public int deleteCrew(Crew input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CrewMapper.deleteCrew", input);
			
			if(result ==0) {
				throw new NullPointerException("result=0");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 크루가 없습니다.");
		}
		
		catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("크루 삭제에 실패했습니다.");
		}
		
		
		return result;
	}


	/*
	 * 크루 데이터 저장되어 있는 갯수 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCrewCount(Crew input) throws Exception {
		
		int result= 0;
		
		try {
			result = sqlSession.selectOne("CrewMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}






	
	
	


}
