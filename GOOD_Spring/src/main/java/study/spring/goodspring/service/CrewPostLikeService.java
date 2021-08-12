package study.spring.goodspring.service;

import study.spring.goodspring.model.CrewPostLike;

public interface CrewPostLikeService {

	/** 좋아요 추가 **/
	public void addLike(CrewPostLike input) throws Exception;
	
	/** 좋아요 삭제 **/
	public void deleteLike(CrewPostLike input) throws Exception;
	
	/** 좋아요 중복검사 **/ 
	public int likeUniqueCheck(CrewPostLike input) throws Exception;
	
	/** 좋아요 수 조회 **/ 
	public int selectLike(int input) throws Exception;
	
	
}
