package study.spring.goodspring.service;

import java.util.List;import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewPost;

public interface CrewPostService {

	/**
	 * 크루 게시물 리스트 조회
	 */
	public List<CrewPost> selectCrewPostList(CrewPost crewPost) throws Exception;
	
	/*
	 * 크루 게시물 등록
	 */
	public void insertCrewPost(CrewPost crewPost) throws Exception;
	
	/*
	 *크루 게시물 수정 
	 */
	public void updateCrewPost(CrewPost crewPost) throws Exception;
	
	/*
	 * 크루 게시물 삭제
	 */
	public void deleteCrewPost(CrewPost crewPost) throws Exception;
	
	/*
	 * 크루 게시물 조회
	 */
	public CrewPost selectCrewPost(CrewPost crewPost) throws Exception;
	
}
