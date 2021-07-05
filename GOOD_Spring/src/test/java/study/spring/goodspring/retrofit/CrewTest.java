package study.spring.goodspring.retrofit;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.extern.slf4j.Slf4j;
import study.spring.goodspring.model.Crew;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
@WebAppConfiguration
@FixMethodOrder
public class CrewTest {

	/** 
	 * MyBatis SQL 세션 주입 설정
	 */
	@Autowired
	private SqlSession sqlSession;
	
	//단일행 조회 테스트
	@Test
	public void testA() {
		Crew input = new Crew();
		input.setCrew_no(1);
		sqlSession.selectOne("Crew.selectItem", input);
	}
}
