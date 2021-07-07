package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Member;
import study.spring.goodspring.service.MemberService;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 학과 데이터 상세 조회
	 * 
	 * @param Member 조회할 학과의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	@Override
	public Member getMemberItem(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Member> getMemberList(Member input) throws Exception {
		List<Member> result = null;

		try {
			result = sqlSession.selectList("MemberMapper.selectList", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int getMemberCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int addMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("MemberMapper.insertItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int deleteMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("MemberMapper.deleteItem", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}

	/**
	 * 로그인
	 * 
	 * @param input
	 * @throws Exception
	 */
	@Override
	public Member login(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.login", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("FAIL");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 아이디 찾기
	 * 
	 * @param input
	 * @throws Exception
	 */
	@Override
	public Member findId(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.findId", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("이름 또는 이메일이 잘못되었습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
	 * 비밀번호 찾기
	 * 
	 * @param input
	 * @throws Exception
	 */
	@Override
	public Member findPw(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.findPw", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("입력하신 정보가 잘못되었습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**
     * 아이디 중복검사
     * @param input
     * @throws Exception
     */
	@Override
	public void idUniqueCheck(Member input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.selectOne("MembersMapper.idUniqueCheck", input);
            if (result > 0) {
                throw new NullPointerException("result=" + result);
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("이미 사용중인 아이디 입니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("아이디 중복검사에 실패했습니다.");
        }
		
	}
	
	/**
     * 닉네임 중복검사
     * @param input
     * @throws Exception
     */
	@Override
	public void nickUniqueCheck(Member input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.selectOne("MembersMapper.nickUniqueCheck", input);
	            if (result > 0) {
	                throw new NullPointerException("result=" + result);
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("이미 사용중인 닉네임 입니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("닉네임 중복검사에 실패했습니다.");
	        }
		
	}
	
	
	 /**
     * 이메일 중복검사
     * @param input
     * @throws Exception
     */
	@Override
	public void emailUniqueCheck(Member input) throws Exception {
		  int result = 0;

	        try {
	            result = sqlSession.selectOne("MembersMapper.emailUniqueCheck", input);
	            if (result > 0) {
	                throw new NullPointerException("result=" + result);
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("이미 사용중인 이메일 입니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("이메일 중복검사에 실패했습니다.");
	        }
		
	}
	
	/**
	 * 회원 프로필 사진 변경
	 */
	@Override
	public int editPhoto(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateProfile", input);
			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

}
