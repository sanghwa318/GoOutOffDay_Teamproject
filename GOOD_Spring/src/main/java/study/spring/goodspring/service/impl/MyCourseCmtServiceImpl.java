package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.MyCourseCmt;
import study.spring.goodspring.service.MyCourseCmtService;

@Service
@Slf4j
public class MyCourseCmtServiceImpl implements MyCourseCmtService {

	@Autowired
	SqlSession sqlSession;
	@Override
	public MyCourseCmt getCmtItem(MyCourseCmt input) throws Exception{
		MyCourseCmt output = null;

		try {
			output = sqlSession.selectOne("MyCourseCmtMapper.selectCmtItem", input);

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
	public List<MyCourseCmt> getCmtList(MyCourseCmt input) throws Exception {
		List<MyCourseCmt> output = null;

		try {
			output = sqlSession.selectList("MyCourseCmtMapper.selectCmtList", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			return null;
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}

	@Override
	public int addCmt(MyCourseCmt input) throws Exception {

		int result = 0;
		try {
			result = sqlSession.insert("MyCourseCmtMapper.insertCmt", input);
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

	@Override
	public int editCmt(MyCourseCmt input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.update("MyCourseCmtMapper.updateCmt", input);
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

	@Override
	public int deleteCmt(MyCourseCmt input) throws Exception {
		int result = 0;
		try {
			result = sqlSession.delete("MyCourseCmtMapper.deleteCmt", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;

	}



	@Override
	public int getCmtCnt(MyCourseCmt input) throws Exception {
		MyCourseCmt result=null;
		try {
			result = sqlSession.selectOne("MyCourseCmtMapper.selectCmtCnt", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result.getCmtCnt();
	}

}
