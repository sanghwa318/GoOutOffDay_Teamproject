package study.spring.goodspring.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CrewPostLike;
import study.spring.goodspring.service.CrewPostLikeService;

@Slf4j
@Service
public class CrewPostLikeServiceImpl implements CrewPostLikeService {

	@Autowired
	SqlSession sqlSession;
	
	/*
	 * 좋아요 추가 및 업데이트
	 */
	@Override
	public void addLike(CrewPostLike input) throws Exception {
		try {
		sqlSession.insert("CrewPostLikeMapper.addLike", input);
		sqlSession.update("CrewPostMapper.updateLike", input.getPost_no());
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
		
	}

	/*
	 * 좋아요취소 및 업데이트
	 */
	@Override
	public void deleteLike(CrewPostLike input) throws Exception {
		try {
			sqlSession.delete("CrewPostLikeMapper.deleteLike", input);
			sqlSession.update("CrewPostMapper.updateLike", input.getPost_no());
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("저장된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 등록에 실패했습니다.");
			}
		
	}

	/*
	 * 해당 포스트 좋아요 조회
	 */
	@Override
	public int likeUniqueCheck(CrewPostLike input) throws Exception {
		int result=0;
		try {
		result =sqlSession.selectOne("CrewPostLikeMapper.selectLikeCount", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/*
	 * 해당 포스트 좋아요 개수
	 */
	@Override
	public int selectLike(int input) throws Exception {
		int result=0;
		try {
		result =sqlSession.selectOne("CrewPostMapper.selectLikeCount", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
