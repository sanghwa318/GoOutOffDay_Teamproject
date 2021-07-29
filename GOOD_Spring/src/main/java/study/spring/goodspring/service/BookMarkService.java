package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.BookMark;

public interface BookMarkService {
	/** 북마크 (찜목록) 추가 **/
	public void addBookMark(BookMark input) throws Exception;
	
	/** 북마크 (찜목록) 삭제 **/
	public void deleteBookMark(BookMark input) throws Exception;
	
	/** 중복검사 **/ 
	public int BookMarkUniqueCheck(BookMark input) throws Exception;
	
	/** 중복검사 **/ 
	public List<BookMark> BookMarkSVCIDUniqueCheck(BookMark input) throws Exception;
}
