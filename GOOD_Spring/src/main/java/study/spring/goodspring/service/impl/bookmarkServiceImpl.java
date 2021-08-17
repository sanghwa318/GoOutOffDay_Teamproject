package study.spring.goodspring.service.impl;

import java.util.List;

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
			throw new Exception("삭제될 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return;
	}

	/** 찜목록 중복검사 **/
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
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;

	}

	/** 찜목록 다중조회 (해당유저가 찜한 모든거) **/
	@Override
	public List<BookMark> BookMarkSelectList(BookMark input) throws Exception {
		List<BookMark> result = null;

		try {
			result = sqlSession.selectList("BookMarkMapper.selectListBookMark", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;

	}

	/** 찜목록 페이지네이션을위한 갯수조회 **/
	@Override
	public int getBookMarkCount(BookMark input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("BookMarkMapper.BookMark_selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 나의 모든찜목록 불러오기 **/
	@Override
	public List<BookMark> myBookMarkAllList(BookMark input) throws Exception {
		List<BookMark> result = null;

		try {
			result = sqlSession.selectList("BookMarkMapper.MyListBookMark", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	/** 나의 찜목록속 지도정보를 불러오기 **/
	@Override
	public List<BookMark> myBookMarkAllListMap(BookMark input) throws Exception {
		List<BookMark> result = null;

		try {
			result = sqlSession.selectList("BookMarkMapper.MyListBookMarkMap", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
}
