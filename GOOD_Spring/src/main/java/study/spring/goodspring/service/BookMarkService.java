package study.spring.goodspring.service;

import study.spring.goodspring.model.BookMark;

public interface BookMarkService {
	public void addBookMark(BookMark input) throws Exception;
	public void deleteBookMark(BookMark input) throws Exception;
}
