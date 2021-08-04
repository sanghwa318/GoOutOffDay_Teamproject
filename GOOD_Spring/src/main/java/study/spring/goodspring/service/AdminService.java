package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.Inquiry;

public interface AdminService {
	
	/**
	 * 문의글 데이터 목록 조회
	 * @param Inquiry 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Inquiry> getInquiryListAdmin(Inquiry input) throws Exception;
	
	/**
	    * 문의글 데이터 상세 조회
	    * @param Inquiry 조회할 코스의 일련번호를 담고 있는 Beans
	    * @return 조회된 데이터가 저장된 Beans
	    * @throws Exception
	    */
	   public Inquiry getInquiryItemAdmin(Inquiry input) throws Exception;

}
