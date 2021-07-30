package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.service.MyPostService;

@Slf4j
@Service
public class MyPostServiceImpl implements MyPostService {
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<MyCourses> getMyCoursePost(int input) throws Exception {
		List<MyCourses> output = null;
		
		try {
			output = sqlSession.selectList("MyCourseMapper.selectMycoursePostList", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}

	@Override
	public List<CrewPost> getCrewPost(int input) throws Exception {
		List<CrewPost> output = null;
		
		try {
			output = sqlSession.selectList("CrewPostMapper.selectCrewPostList", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}

}
