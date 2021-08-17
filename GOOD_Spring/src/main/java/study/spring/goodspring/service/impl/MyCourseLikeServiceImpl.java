package study.spring.goodspring.service.impl;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.MyCourseLike;
import study.spring.goodspring.service.MyCourseLikeService;
@Service
@Slf4j
public class MyCourseLikeServiceImpl implements MyCourseLikeService {
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public void addLike(MyCourseLike input) throws Exception {
		try {
		sqlSession.insert("MyCourseLikeMapper.addLike", input);
		sqlSession.update("MyCourseMapper.updateLike", input.getMycourse_no());
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
	}

	@Override
	public void deleteLike(MyCourseLike input) throws Exception {
		try {
			sqlSession.delete("MyCourseLikeMapper.deleteLike", input);
			sqlSession.update("MyCourseMapper.updateLike", input.getMycourse_no());
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("저장된 데이터가 없습니다.");
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 등록에 실패했습니다.");
			}
	}

	@Override
	public int likeUniqueCheck(MyCourseLike input) throws Exception {
		int result=0;
		try {
		result =sqlSession.selectOne("MyCourseLikeMapper.selectLikeCount", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectLike(int input) throws Exception {
		int result=0;
		try {
		result =sqlSession.selectOne("MyCourseMapper.selectLikeCount", input);
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
