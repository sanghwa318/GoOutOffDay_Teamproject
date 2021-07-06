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
import retrofit2.Call;
import retrofit2.Retrofit;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.model.Bicycle;
import study.spring.goodspring.service.BicycleService;

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

public class bicycleAPITest {
	// RetrofitHelper 객체 주입 설정
	@Autowired
	RetrofitHelper retrofitHelper;
	

	@Test
	public void TestA() {
		// Retrofit 객체 생성
		Retrofit retrofit = retrofitHelper.getRetrofit(BicycleService.BASE_URL);

		// Service 객체 생성
		BicycleService bicycleService = retrofit.create(BicycleService.class);

		// 메서드를 호출해서 call 객체를 리턴받는다.
		Call<Bicycle> call = bicycleService.getRow();

		// call 객체를 통해 JSON 파싱이 완료된 Beans 객체를 리턴받는다.
		Bicycle bicycle = null;

		try {
			bicycle = call.execute().body(); // 통신으로 가져온 원격지 JSON 데이터를 POJO 클래스에 자동으로 맵핑
		} catch (Exception e) {
			e.printStackTrace();
		}

		log.debug(bicycle.toString());

	}

	/** API 데이터 저장 테스트 */
	@Test
	public void testB() {
		Bicycle input = new Bicycle();
	}

}
