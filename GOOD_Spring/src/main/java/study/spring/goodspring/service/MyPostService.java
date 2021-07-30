package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CrewPost;
import study.spring.goodspring.model.MyCourses;

public interface MyPostService {
	/**
	 * 내가 쓴 글 목록 조회 (나만의 코스)
	 * @param MyCourses 조회할 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<MyCourses> getMyCoursePost(int input) throws Exception;
	
	
	/**
	 * 내가 쓴 글 목록 조회 (크루 게시판)
	 * @param CrewPost 조회할 게시글의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<CrewPost> getCrewPost(int input) throws Exception;
	
}
