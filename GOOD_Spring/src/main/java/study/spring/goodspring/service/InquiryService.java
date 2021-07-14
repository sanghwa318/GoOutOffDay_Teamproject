package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.Inquiry;

//문의글 관리 기능을 제공하기위한 Service
public interface InquiryService {

	/**
	 * 문의글 데이터 상세 조회
	 * @param Inquiry 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Inquiry getInquiryItem(Inquiry input) throws Exception;
	
	
	/**
	 * 문의글 데이터 목록 조회
	 * @param Inquiry 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Inquiry> getInquiryList(Inquiry input) throws Exception;
	
	/*
	 * 문의글 데이터 등록
	 * @param Inquiry 저장할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int addInquiry(Inquiry input) throws Exception;
	
	
	/*
	 * 문의글 데이터 수정
	 * @param Inquiry 수정할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int editInquiry(Inquiry input) throws Exception;
	
	
	/*
	 * 문의글 데이터 삭제
	 * @param Inquiry 삭제할 정보를 담고 있는 Beans
	 * @return int 
	 * @throws Exception
	 */
	public int deleteInquiry(Inquiry input) throws Exception;
	
	/*
	 * 문의글 데이터 저장되어 있는 갯수 조회
	 * @param Inquiry 검색 조건을 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int getInquiryCount(Inquiry input) throws Exception;
}
