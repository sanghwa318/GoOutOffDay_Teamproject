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
}
