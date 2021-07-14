package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Inquiry;
import study.spring.goodspring.service.InquiryService;

@Slf4j
@Service
public class InquiryServiceImpl implements InquiryService {
	// MyBatis 세션 객체 주입 설정
	@Autowired
	SqlSession sqlSession;
	
	
	/**
	 * 단일 데이터 조회
	 * @param Inquiry 조회할 데이터의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Inquiry getInquiryItem(Inquiry input) throws Exception {
		Inquiry result = null;

		try {
			result = sqlSession.selectOne("InquiryMapper.selectInquiryItem", input);

			if (result == null) {
				throw new NullPointerException("result = null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 코스 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 데이터 목록 조회
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public List<Inquiry> getInquiryList(Inquiry input) throws Exception {
		List<Inquiry> result = null;

		try {
			result = sqlSession.selectList("InquiryMapper.selectInquiryList", input);

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
	 * 데이터 등록
	 * @param Inquiry 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int addInquiry(Inquiry input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("InquiryMapper.insertCrew", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 데이터 수정
	 * @param Inquiry 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editInquiry(Inquiry input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("InquiryMapper.updateCrew", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}

		return result;
	}
	/**
	 * 데이터 삭제
	 * @param Inquiry 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteInquiry(Inquiry input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("InquiryMapper.deleteCrew", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		}

		catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}

		return result;
	}
	/**
	 * 데이터가 저장되어 있는 갯수 조회
	 * @param Inquiry 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int getInquiryCount(Inquiry input) throws Exception {

		int result = 0;

		try {
			result = sqlSession.selectOne("InquiryMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
