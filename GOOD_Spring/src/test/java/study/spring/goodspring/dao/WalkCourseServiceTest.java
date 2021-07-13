package study.spring.goodspring.dao;

import java.util.List;

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
	
	/* 다중행 조회 테스트 */
	@Test
	public void testA() {
		WalkCourse input = new WalkCourse();
		input.setCOURSE_CATEGORY_NM("근교산자락길");
		
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
		int count = 0;
		
		try {
			count = walkCourseService.getWalkCourseCount(null);
			log.debug("전체 데이터 수:" + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	/** 조건에 따른 데이터 수 조회 */
	@Test
	public void testC() {
		int count = 0;
		
		WalkCourse input = new WalkCourse();
		input.setCOURSE_CATEGORY_NM("근교산자락길");
		
		try {
			count = walkCourseService.getWalkCourseCount(input);
			log.debug("근교산자락길을 포함하는 데이터 수:" + count);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
	}

}
