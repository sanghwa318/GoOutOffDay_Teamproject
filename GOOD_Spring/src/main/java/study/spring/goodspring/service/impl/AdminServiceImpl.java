package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.AdminInquiry;
import study.spring.goodspring.model.Inquiry;
import study.spring.goodspring.service.AdminService;

@Slf4j
@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	SqlSession sqlSession;
	/**
	 * 1:1 문의 조회 (관리자)
	 */
	@Override
	public List<Inquiry> getInquiryListAdmin(Inquiry input) throws Exception {
		List<Inquiry> result = null;

		try {
			result = sqlSession.selectList("AdminMapper.selectInquiryListAdmin", input);

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
	    * 1:1 문의 상세 데이터 조회
	    * @param Inquiry 조회할 데이터의 일련번호를 담고있는 Beans
	    * @return 조회된 데이터가 저장된 Beans
	    * @throws Exception
	    */
	@Override
	public Inquiry getInquiryItemAdmin(Inquiry input) throws Exception {
		Inquiry result = null;

	      try {
	         result = sqlSession.selectOne("AdminMapper.selectInquiryItemAdmin", input);

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
	 * 답변 등록
	 * @param Inquiry 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public Inquiry addInquiryAdmin(Inquiry input) throws Exception {
		
		Inquiry output=null;
		
		int result = 0;

		try {
			result = sqlSession.update("AdminMapper.updateInquiryAdmin", input);
			output = sqlSession.selectOne("AdminMapper.selectInquiryItemAdmin", input);
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

		return output;
	}

	@Override
	   public int getInquiryListAdminCount(AdminInquiry input) throws Exception {
	      int result = 0;

	      try {
	         result = sqlSession.selectOne("AdminMapper.selectInquiryCountAll", input);
	      } catch (Exception e) {
	         log.error(e.getLocalizedMessage());
	         throw new Exception("데이터 조회에 실패했습니다.");
	      }

	      return result;
	}

	/**
	 * 
	 */
	@Override
	public List<AdminInquiry> getAdminInquiryList(AdminInquiry input) throws Exception {
		List<AdminInquiry> result = null;

		try {
			result = sqlSession.selectList("AdminMapper.selectInquiryBooleanAdmin", input);

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
