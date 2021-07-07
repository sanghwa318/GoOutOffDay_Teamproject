package study.spring.goodspring.dao;

import java.util.List;

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
import study.spring.goodspring.model.WalkCourse;
import study.spring.goodspring.service.WalkCourseService;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INf/spring/**/*-context.xml"})
@WebAppConfiguration
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class WalkCourseServiceTest {
	
	/** Service 객체 주입 설정 */
	@Autowired
	private WalkCourseService walkCourseService;
	
	/** MyBatis의 SQL세션 주입 설정 */
	@Autowired
	private SqlSession sqlSession;
	
	/* 다중행 조회 테스트 */
	@Test
	public void testA() {
		WalkCourse input = new WalkCourse();
		input.setArea("채원");
		
		List<WalkCourse> output = null;
		
		try {
			output = walkCourseService.getWalkCourseList(input);
			
			for (WalkCourse item : output) {
				log.debug(item.toString());
			}
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
	}
	
	/** 전체 데이터 수 조회 */
	@Test
	public void testB() {
		int count = sqlSession.selectOne("WalkCourseMapper.selectCountAll", null);
		log.debug("전체 데이터 수:" + count);
	}
	
	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testC() {
		WalkCourse input = new WalkCourse();
		input.setArea("채원");
		
		int count = sqlSession.selectOne("WalkCourseMapper.selectCountAll", input);
		log.debug("채원을 포함하는 데이터 수:" + count);
		
	}

}