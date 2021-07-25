package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.service.CrewPostService;
import study.spring.goodspring.service.CrewService;


@Slf4j
@Service
public class CrewPostServiceImpl implements CrewPostService {
	
	//MyBatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlSession;
	

	@Autowired
	CrewService crewService;
	
	


	@Override
	public List<CrewPost> selectCrewPostList(CrewPost crewPost) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	/*
	 * CrewPost 데이터 등록
	 * @param CrewPost 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */

	@Override
	public int insertCrewPost(CrewPost input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CrewPostMapper.insertCrewPost", input);
			
			if(result == 0) {
				throw new NullPointerException("result=0");
			}
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 게시물이 없습니다.");
		}
		catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("게시물 등록에 실패했습니다.");
		}
		
		return result;
		
	}

	@Override
	public int updateCrewPost(CrewPost input) throws Exception {
		return 0;
		
	}

	@Override
	public int deleteCrewPost(CrewPost input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
		
	}

	/*
	 * 크루 데이터 상세 조회
	 * @param Crew 조회할 크루의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public CrewPost selectCrewPost(CrewPost input) throws Exception {
		CrewPost result = null;
		
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
		return null;
	}

	
	/*
	 * 크루포스트 데이터 저장되어 있는 갯수 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCrewPostCount(CrewPost input) throws Exception {
		
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
