package study.spring.goodspring.service;

import java.util.List;import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewPost;

public interface CrewPostService {

	/**
	 * 크루 게시물 리스트 조회
	 */
	public List<CrewPost> selectCrewPostList(CrewPost input) throws Exception;
	
	/*
	 * 크루 게시물 등록
	 */
	public int insertCrewPost(CrewPost input) throws Exception;
	
	/*
	 *크루 게시물 수정 
	 */
	public int updateCrewPost(CrewPost input) throws Exception;
	
	/*
	 * 크루 게시물 삭제
	 */
	public int deleteCrewPost(CrewPost input) throws Exception;
	
	/*
	 * 크루 게시물 조회
	 */
	public CrewPost selectCrewPost(CrewPost input) throws Exception;

	
	/*
	 * 크루 포스트 데이터 조회
	 */
	public int getCrewPostCount(CrewPost input) throws Exception;
	
	/*
	 * 크루 멤버 조회
	 */
	public CrewPost getCrewNoPostCount(CrewPost input) throws Exception;
	
	
	/*
	 * 유저 닉네임 조회
	 */
	public CrewPost selectCrewUser (CrewPost input) throws Exception;
}
