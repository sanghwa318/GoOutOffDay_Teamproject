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

	/** 다중행조회 **/
	public List<BookMark> BookMarkSelectList(BookMark input) throws Exception;

	/** 나의 모든찜목록 불러오기 **/
	public List<BookMark> myBookMarkAllList(BookMark input) throws Exception;
	
	/**
	 * 총 데이터 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getBookMarkCount(BookMark input) throws Exception;
}
