package study.spring.goodspring.retrofit;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.CasShowExh;

/** Lombok의 Log4j 객체 */
//import lombok.extern.slf4j.Slf4j;
@Slf4j
/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 `모든` 이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class ShowExhItem {
	@Autowired
	private SqlSession sqlSession;
	
	/** 단일행 테스트 **/
	@Test
	public void testA() {
		CasShowExh input = new CasShowExh();
		input.setPERFORM_CODE("mspo2102041326a01");
		sqlSession.selectOne("CasDBMapper.show_selectItem", input);
	}
	
	/** 다중행 테스트 **/
	@Test
	public void testB() {
		CasShowExh input = new CasShowExh();
		input.setGENRE_NAME("오페라");
		sqlSession.selectList("CasDBMapper.show_selectList", input);
	}
}
