package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.AdminInquiry;
import study.spring.goodspring.model.Inquiry;
import study.spring.goodspring.model.Member;

public interface AdminService {
	
	/**
	 * 문의글 데이터 목록 조회
	 * @param Inquiry 조회할 코스의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Inquiry> getInquiryListAdmin(Inquiry input) throws Exception;
	
	/**
	 * 문의 드롭박스 boolean형에 대한 서비스
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<AdminInquiry> getAdminInquiryList(AdminInquiry input) throws Exception;
	
	/**
	    * 문의글 데이터 상세 조회
	    * @param Inquiry 조회할 코스의 일련번호를 담고 있는 Beans
	    * @return 조회된 데이터가 저장된 Beans
	    * @throws Exception
	    */
	 public Inquiry getInquiryItemAdmin(Inquiry input) throws Exception;
	 
	 /**
		 * 문의글 답변 데이터 등록
		 * @param Inquiry 저장할 정보를 담고 있는 Beans
		 * @return int 
		 * @throws Exception
		 */
		public Inquiry addInquiryAdmin(Inquiry input) throws Exception;
		
	/**
	    * [페이지네이션에 필요]
	    * 데이터가 저장되어 있는 갯수 조회
	    * @return int
	    * @throws Exception
	    */
	   public int getInquiryListAdminCount(AdminInquiry input) throws Exception;

	   /**
		 * 관리자의 본인 추방 금지
		 * @param user_info 조회할 회원의일련번호를 담고 있는 Beans
		 * @return 조회된 데이터가 저장된 Beans
		 * @throws Exception
		 */
		
		public Member getUserinfoadmin(Member input) throws Exception;
		
		/**
		 * 회원  데이터 삭제하기
		 * @param Member 삭제할 학과의 일련번호를 담고 있는 Beans
		 * @return int
		 * @throws Exception
		 */
		public int deleteMemberadmin(Member input) throws Exception;
}
