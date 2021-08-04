package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CAS;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.MyCourses;
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.SearchService;

/** 통합검색 데이터 관리 기능을 제공하기 위한 Service계층에 대한 구현체 */
@Slf4j
@Service
public class SearchServiceImpl implements SearchService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 걷기코스 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<WalkCourse> getSearchWalkCourseList(WalkCourse input) throws Exception {
		List<WalkCourse> result = null;

		try {
			result = sqlSession.selectList("SearchMapper.selectListWalk", input);

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

	/**
	 * [페이지네이션에 필요] 데이터가 저장되어있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getSearchWalkCourseCount(WalkCourse input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SearchMapper.selectWalkCourseCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 나만의 코스 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<MyCourses> getSearchMyCourseList(MyCourses input) throws Exception {
		List<MyCourses> result = null;

		try {
			result = sqlSession.selectList("SearchMapper.selectListMyCourse", input);

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

	/**
	 * [페이지네이션에 필요] 데이터가 저장되어있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getSearchMyCourseCount(MyCourses input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("SearchMapper.selectMyCourseCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 크루 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Crew> getSearchCrewList(Crew input) throws Exception {
		List<Crew> result = null;

		try {
			result = sqlSession.selectList("SearchMapper.selectListCrew", input);

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

	/**
	 * 문화체육 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<CAS> getSearchCASList(CAS input) throws Exception {
		List<CAS> result = null;

		try {
			result = sqlSession.selectList("SearchMapper.selectListCAS", input);

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

}
