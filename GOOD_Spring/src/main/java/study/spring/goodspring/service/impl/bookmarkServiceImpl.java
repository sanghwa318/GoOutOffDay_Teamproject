package study.spring.goodspring.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.BookMark;
import study.spring.goodspring.service.BookMarkService;

@Slf4j
@Service
public class bookmarkServiceImpl implements BookMarkService {
	@Autowired
	SqlSession sqlSession;
	
	/** 찜목록 추가 **/
	@Override
	public void addBookMark(BookMark input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("BookMarkMapper.insertBookMark", input);

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
		return;
	}

	/** 찜목록 삭제 **/
	@Override
	public void deleteBookMark(BookMark input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("BookMarkMapper.deleteBookMark", input);
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
		return;
	}

	@Override
	public int BookMarkUniqueCheck(BookMark input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BookMarkMapper.selectInBookMark", input);

			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 등록에 실패했습니다.");
		}
		return result;
		
	}



}
