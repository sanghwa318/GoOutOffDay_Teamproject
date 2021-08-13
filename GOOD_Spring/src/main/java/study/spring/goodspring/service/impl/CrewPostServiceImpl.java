package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
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
	
	

	/*
	 * CrewPost 리스트 조회
	 * @param CrewPost 저장할 정보를 담고 있는 Beans
	 * @return List
	 * @throws Exception
	 */
	@Override
	public List<CrewPost> selectCrewPostList(CrewPost crewpost) throws Exception {
		List<CrewPost> result = null;
		
		try {
			result = sqlSession.selectList("CrewPostMapper.selectCrewPostInList",crewpost);
			
			if(result== null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 게시물이 없습니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}
		
		return result;
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

	/*
	 * 크루 데이터 상세 조회
	 * @param Crew 조회할 크루의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public int deleteCrewPost(CrewPost input) throws Exception {
		int result= 0;
		
		try {
			result = sqlSession.selectOne("CrewPostMapper.deleteCrewPost", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
		
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
			result = sqlSession.selectOne("CrewPostMapper.selectCrewPostItem", input);
			
			if(result == null) {
				throw new NullPointerException("result = null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 크루포스트 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("크루 포스트 조회에 실패했습니다.");
		}
		return result;
	}

	
	/*
	 * 크루포스트 데이터 저장되어 있는 갯수 조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getCrewPostCount(CrewPost crewpost) throws Exception {
		
		int result= 0;
		
		try {
			result = sqlSession.selectOne("CrewPostMapper.selectPostCountAll", crewpost);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}


	/*
	 * post_no를 통한 Crew조회
	 * @param Crew 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public CrewPost getCrewNoPostCount(CrewPost input) throws Exception {
		
		CrewPost result= null;
		
		try {
			result = sqlSession.selectOne("CrewPostMapper.selectCrewPost", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}




	@Override
	public CrewPost selectCrewUser(CrewPost input) throws Exception {
		
		CrewPost result= null;
		
		try {
			result = sqlSession.selectOne("CrewPostMapper.selectCrewUser", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	
	/*
	 * 크루 게시글 조회수 증가
	 */
	@Override
	public void updateHits(CrewPost input) throws Exception {
		try {
			sqlSession.update("CrewPostMapper.updateHitsCrewPost", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
	}



	/*
	 * 크루 게시글에 대한 댓글 수 조회 
	 */
	@Override
	public int upadateCmtHits(int input) throws Exception {
		int result= 0;
		
		try {
			result = sqlSession.selectOne("CrewPostMapper.selectCountCmtAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
		
}



	/*
	 * 크루 게시물 수정
	 */
	@Override
	public int upadateCrewPost(CrewPost input) throws Exception {
		int result= 0;
		
		try {
			result = sqlSession.selectOne("CrewPostMapper.updateCrewPost", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}




}
