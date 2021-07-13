package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.service.MyCourseService;

@Slf4j
@Service
public class MyCourseServiceImpl implements MyCourseService {
	// MyBatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlSession;

	@Override
	public MyCourses getMyCourseItem(MyCourses input) throws Exception {
		return null;
	}

	@Override
	public List<MyCourses> getMyCourseList(MyCourses input) throws Exception {
		List<MyCourses> result = null;

		try {
			result = sqlSession.selectList("MyCourseMapper.selectMyCourseList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
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
	public int addMyCourse(MyCourses input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editMyCourse(MyCourses input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMyCourse(MyCourses input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getMyCourseCount(MyCourses input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
