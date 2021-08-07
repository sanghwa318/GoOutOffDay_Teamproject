package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.Member;


public interface MemberService {
	/**
	 * 회원 데이터 상세 조회
	 * 
	 * @param Member 조회할 학과의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Member getMemberItem(Member input) throws Exception;
	
	/**
	 * 회원 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Member> getMemberList(Member input) throws Exception;

	/**
	 * 회원  데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getMemberCount(Member input) throws Exception;

	/**
	 * 회원  데이터 등록하기
	 * @param Member 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addMember(Member input) throws Exception;

	
	
	/**
	 * 회원  데이터 수정하기
	 * @param Member 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editMember(Member input) throws Exception;
	
	/**
	 * 회원  데이터 삭제하기
	 * @param Member 삭제할 학과의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteMember(int input) throws Exception;
	
	/**
	 * 로그인을 위한 데이터 조회 메서드
	 * @param Member 조회할 정보를 담고 있는 Beans
	 * @return
	 * @throws Exception
	 */
	public Member login(Member input) throws Exception;
	
	/**
	 * 아이디 찾기를 위한 데이터 조회 메서드
	 * @param Member 조회할 정보를 담고 있는 Beans
	 * @return
	 * @throws Exception
	 */
	public Member findId(Member input) throws Exception;
	
	/**
	 * 비밀번호 찾기를 위한 데이터 조회 메서드
	 * @param Member 조회할 정보를 담고 있는 Beans
	 * @return
	 * @throws Exception
	 */
	public Member findPw(Member input) throws Exception;
	
	/**

     * 아이디 중복검사
     * @param input
     * @throws Exception
     */
    public void idUniqueCheck(Member input) throws Exception;
    
    /**
     * 닉네임 중복검사
     * @param input
     * @throws Exception
     */
    public void nickUniqueCheck(Member input) throws Exception;
    
    /**
     * 이메일 중복검사
     * @param input
     * @throws Exception
     */
    public void emailUniqueCheck(Member input) throws Exception;
    
	/**
	 * 유저 프로필사진 변경을 위한 데이터 갱신 메서드
	 * @param Member 수정할 정보를 담고 있는 Beans
	 * @return
	 * @throws Exception
	 */
	public int editPhoto(Member input) throws Exception;
	/**
	 * 회원 정보 불러오기 (나만의 코스 상세페이지 등)
	 * @param userNo 
	 * @return
	 * @throws Exception
	 */
	public Member selectItemByNo(int userNo) throws Exception;

	
	
}
