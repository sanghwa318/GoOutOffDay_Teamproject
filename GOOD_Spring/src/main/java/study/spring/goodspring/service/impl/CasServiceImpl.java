package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CasShowExh;
import study.spring.goodspring.service.CasService;

@Slf4j
@Service
public class CasServiceImpl implements CasService {

	/** 객체주입 설정 **/
	@Autowired
	SqlSession SqlSession;

	@Override
	/**
	 * 공연전시 데이터 단일상세 조회
	 * 
	 * @param 조회할 데이터의 일련번호 PERFORM_CODE
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public CasShowExh getShowExhItem(CasShowExh input) throws Exception {
		CasShowExh result = null;

		try {
			result = SqlSession.selectOne("CasDBMapper.show_selectItem", input);

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
	/**
	 * 공연전시 데이터 메인 케러셀 다중 조회
	 * 
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	public List<CasShowExh> getShowExhList(CasShowExh input) throws Exception {
		List<CasShowExh> result = null;

		try {
			result = SqlSession.selectList("CasDBMapper.show_selectMainList", input);

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
	/**
	 * 공연전시 총 데이터 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getShowExhCount(CasShowExh input) throws Exception {
		int result = 0;

		try {
			result = SqlSession.selectOne("CasDBMapper.show_selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

}
