package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.MyCourseLike;


public interface MyCourseLikeService {

	/** 좋아요 추가 **/
	public void addLike(MyCourseLike input) throws Exception;
	
	/** 좋아요 삭제 **/
	public void deleteLike(MyCourseLike input) throws Exception;
	
	/** 좋아요 중복검사 **/ 
	public int likeUniqueCheck(MyCourseLike input) throws Exception;
	
	/** 좋아요 수 조회 **/ 
	public int selectLike(int input) throws Exception;
	
	
	
}
