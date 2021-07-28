package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CAS;
import study.spring.goodspring.service.CasService;

@Slf4j
@Service
public class CasServiceImpl implements CasService {

	/** 객체주입 설정 **/
	@Autowired
	SqlSession SqlSession;

	//////////////////////////////////////////
	
	/** 문화체육Other 데이터 상세 조회
	 * @param 조회할 데이터의 일련번호 PERFORM_CODE
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public CAS getOtherItem(CAS input) throws Exception {
		CAS result = null;

		try {
			result = SqlSession.selectOne("CasDBMapper.Other_selectItem", input);

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
	
	
	/** 문화체육Other 데이터 다중 조회
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	@Override
	public List<CAS> getOtherList(CAS input) throws Exception {
		List<CAS> result = null;

		try {
			result = SqlSession.selectList("CasDBMapper.Other_selectMainList", input);

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
	
	/** 문화체육Other 총 데이터 갯수 조회 
	 * @return int 
	 * @throws Exception
	 */
	@Override
	public int getOtherCount(CAS input) throws Exception {
		int result = 0;

		try {
			result = SqlSession.selectOne("CasDBMapper.Other_selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 문화체육Other 데이터 페이지네이션 다중조회
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	@Override
	public List<CAS> getOtherCategoryList(CAS input) throws Exception {
		List<CAS> result = null;

		try {
			result = SqlSession.selectList("CasDBMapper.Other_selectCategoryList", input);

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
