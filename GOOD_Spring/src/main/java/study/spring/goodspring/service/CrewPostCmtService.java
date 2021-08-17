package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CrewPostCmt;



public interface CrewPostCmtService {

	/**
	 * 크르게시글 댓글 추가를 위한 메서드
	 * @return
	 * @throws Exception
	 */
	public int addCmt(CrewPostCmt input) throws Exception;

	/**
	 * 크르게시글 전체 조호
	 * @return
	 * @throws Exception
	 */
	public List<CrewPostCmt> getCmtList(CrewPostCmt input) throws Exception;

	/**
	 * 크르게시글 전체 조호
	 * @return
	 * @throws Exception
	 */
	public int deleteCmt(CrewPostCmt input) throws Exception;
	
	/**
	 * 크루게시글 댓글 단일행 조회를 위한 메서드
	 * @return
	 * @throws Exception
	 */
	public CrewPostCmt getCmtItem(CrewPostCmt input) throws Exception;

	/**
	 * 크루게시글 댓글 작성자의 이미지 불러오기
	 * @return
	 * @throws Exception
	 */
	CrewPostCmt getCmtWriterImage(CrewPostCmt input) throws Exception;

}
