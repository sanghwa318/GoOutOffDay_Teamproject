package study.spring.goodspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.model.CrewMember;
import study.spring.goodspring.service.CrewMemberService;

@Slf4j
@Service
public class CrewMemberServiceImpl implements CrewMemberService {

	//MyBatis 세션 객체 주입 설정
		@Autowired
		SqlSession sqlSession;
		

		@Autowired
		CrewMemberService crewMemberService;


		/**
		 * 크루멤버 데이터 단일 조회
		 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
		 * @return 조회된 데이터가 저장된 Beans
		 * @throws Exception
		 */
		@Override
		public boolean getCrewMemberItem(CrewMember input) throws Exception {
			CrewMember result1 = null;
			Crew result2 = null;
			
			try {
				
				result1 = sqlSession.selectOne("CrewMemberMapper.selectCrew", input);
				result2 = sqlSession.selectOne("CrewMapper.selectCrew", input);
				if(result1 == null) {
					throw new NullPointerException("result1=null");
				}
				if(result2 == null) {
					throw new NullPointerException("result2=null");
				}
			}catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			
			if(result1.getUser_info_user_no() == result2.getUser_info_user_no()) {
				
		
				return true;
			}else {
				return false;
			}
			
			
		}


		/**
		 * 크루멤버 데이터 목록 조회
		 * @param Crew 조회할 크루의 일련번호를 담고 있는 Beans
		 * @return 조회된 데이터가 저장된 Beans
		 * @throws Exception
		 */
		@Override
		public List<CrewMember> getCrewMemberList(CrewMember input) throws Exception {
			List<CrewMember> result = null;
			
			try {
				result = sqlSession.selectList("CrewMemberMapper.selectCrewCrewMemberList",input);
				
				if(result== null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			
			return result;
		}


		/*
		 * 크루멤버 데이터 등록
		 * @param Crew 저장할 정보를 담고 있는 Beans
		 * @return int 
		 * @throws Exception
		 */
		@Override
		public int addCrewMember(CrewMember input) throws Exception {
			int result = 0;
			
			try {
				result = sqlSession.insert("CrewMemberMapper.insertCrewMember", input);
				
				if(result == 0) {
					throw new NullPointerException("result=0");
				}
				
			} catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("저장된 크루가 없습니다.");
			}
			catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("크루 등록에 실패했습니다.");
			}
			
			return result;
		}

		/*
		 * 크루멤버 데이터 수정
		 * @param Crew 수정할 정보를 담고 있는 Beans
		 * @return int 
		 * @throws Exception
		 */
		@Override
		public int editCrewMember(CrewMember input) throws Exception {
			// TODO Auto-generated method stub
			return 0;
		}

		/*
		 * 크루멤버 데이터 삭제
		 * @param Crew 삭제할 정보를 담고 있는 Beans
		 * @return int 
		 * @throws Exception
		 */
		@Override
		public int deleteCrewMember(CrewMember input) throws Exception {
			int result = 0;
			
			try {
				result = sqlSession.delete("CrewMemberMapper.deleteCrewCrewMember", input);
				
				if(result == 0) {
					throw new NullPointerException("result = 0");
					
				}
			}catch (NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("삭제된 데이터가 없습니다.");
			}catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 삭제에 실패했습니다.");
			}
			
			return result;
		}

		/*
		 * 크루멤버 데이터 저장되어 있는 갯수 조회
		 * @param Crew 검색 조건을 담고 있는 Beans
		 * @return int
		 * @throws Exception
		 */
		@Override
		public int getCrewMemberCount(CrewMember input) throws Exception {
			int result = 0;
			
			try {
				result = sqlSession.selectOne("CrewMemberMapper.selectCountAll", input);
			} catch (Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다..");
			}
			return result;
		}
}
