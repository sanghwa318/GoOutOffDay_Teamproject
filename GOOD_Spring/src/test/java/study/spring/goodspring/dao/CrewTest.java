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
import study.spring.goodspring.model.Crew;
import study.spring.goodspring.service.CrewService;


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
public class CrewTest {
	
	//MyBatis의 SQL 세선 주입 설정
	@Autowired
	private SqlSession sqlSession;
	
	//Service객체 주입 
	@Autowired
	private CrewService crewService;
	
	/**단일행 조회 */
	@Test
	public void testA() {
		Crew input = new Crew();
		input.setCrew_name("뛰자");
		
		Crew output = null;
		
		try {
			output = crewService.getCrewItem(input);
			log.debug(output.toString());
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
		
	}
	
	//다중행 조회
	@Test
	public void testB() {
		Crew input  = new Crew();
		input.setCrew_name("뛰");
		
		List<Crew> output = null;
		
		try {
			output = crewService.getCrewList(input);
			
			for(Crew item : output) {
				log.debug(item.toString());
			}
			
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
	}
	
	//저장 테스트
	@Test
	public void TestC() {
		Crew input = new Crew();
		input.setCrew_name("걸을까");
		input.setCrew_area("서초구");
		input.setCrew_category("런닝");
		input.setCrew_sinto("안녕 뛰자 같이");
		input.setCrew_photo("img.asdasd");
		input.setCrew_dinto("열심히 뛰어요");
		input.setCrew_createtime("now");
		input.setUser_info_user_no(2);
		
		int output = 0;
		
		try {
			output = crewService.addCrew(input);
			log.debug("저장된 크루 수 :" + output );
			//생성된 PK값은 MyBatis에 의해 입력 파라미터의 해당 멤버변수에 세팅
			log.debug("생성된 PK값:" + input.getCrew_no() );
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
	}
	
	
	//삭제 테스트
	@Test
	public void TestD() {
		Crew input = new Crew();
		input.setCrew_no(2);
		
		int output = 0;
		
		try {
			output = crewService.deleteCrew(input);
			log.debug("삭제된 크루 수 : " + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	//수정 테스트
	@Test
	public void TestF() {
		Crew input = new Crew();
		input.setCrew_dinto("찬희씨는 정말 너무너무 너무 너무 너무너무 멋져요~~~!!!! 잘 부탁해요~!");
		input.setCrew_sinto("힘내자 5조");
		input.setCrew_no(4);
		
		int output = 0;
		
		try {
			output = crewService.editCrew(input);
			log.debug("수정된 크루 수:" + output);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	
	}

}
