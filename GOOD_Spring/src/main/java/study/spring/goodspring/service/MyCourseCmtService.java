package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.MyCourseCmt;

public interface MyCourseCmtService {
	
	/**
	 * 나만의코스 댓글 단일행 조회를 위한 메서드
	 * 
	 * @return
	 * @throws Exception
	 */
	public MyCourseCmt getCmtItem(MyCourseCmt input) throws Exception;

	/**
	 * 나만의 코스 댓글 다중행 조회를 위한 메서드
	 */
	public List<MyCourseCmt> getCmtList(MyCourseCmt input) throws Exception;

	/**
	 * 나만의코스 댓글 추가를 위한 메서드
	 * 
	 * @return
	 * @throws Exception
	 */
	public int addCmt(MyCourseCmt input) throws Exception;

	/**
	 * 나만의코스 댓글 수정을 위한 메서드
	 * 
	 * @return
	 * @throws Exception
	 */
	public int editCmt(MyCourseCmt input) throws Exception;

	/**
	 * 나만의코스 댓글 삭제를 위한 메서드
	 * 
	 * @return
	 * @throws Exception
	 */
	public int deleteCmt(MyCourseCmt input) throws Exception;

	/**
	 * 댓글 개수 조회
	 */
	public int getCmtCnt(MyCourseCmt input) throws Exception;
}
