package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.CrewPostCmt;
import study.spring.goodspring.service.CrewPostCmtService;

@Service
@Slf4j
public class CrewPostCmtServiceImpl implements CrewPostCmtService{

	@Autowired
	SqlSession sqlSession;
	
	/*
	 * 코멘트 등록
	 */
	@Override
	public int addCmt(CrewPostCmt input) throws Exception {
		int result = 0;
		try {
			sqlSession.insert("CrewPostCmtMapper.insertCrewPostCmt", input);
			result=sqlSession.update("CrewPostMapper.updateCmt", input.getCrew_post_post_no());
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
	
	
	/*
	 * 코멘트 조회
	 */
	@Override
	public List<CrewPostCmt> getCmtList(CrewPostCmt input) throws Exception {
		List<CrewPostCmt> output = null;

		try {
			output = sqlSession.selectList("CrewPostCmtMapper.selectCrewPostCmtList", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			return null;
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return output;
	}

	/*
	 * 댓글 삭제 
	 */
	@Override
	public int deleteCmt(CrewPostCmt input) throws Exception {
		int result = 0;
		try {
			sqlSession.delete("CrewPostCmtMapper.deleteCrewPostCmt", input);
			result=sqlSession.update("CrewPostMapper.updateCmt", input.getCrew_post_post_no());
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


	/*
	 * 댓글 불러오기 위한 단일행 조회
	 */
	@Override
	public CrewPostCmt getCmtItem(CrewPostCmt input) throws Exception {
		CrewPostCmt result = null;
		try {
			result = sqlSession.selectOne("CrewPostCmtMapper.selectCrewPostCmtItem", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}
	
	/*
	 * 댓글에 작성자 이미지 불러오기
	 */
	@Override
	public CrewPostCmt getCmtWriterImage(CrewPostCmt input) throws Exception {
		CrewPostCmt result = null;
		try {
			result = sqlSession.selectOne("CrewPostCmtMapper.selectCrewPostCmtWriter", input);
			
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미지 불러오기 실패.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이미지 불러오기 실패.");
		}
		return result;
	}

	

}
