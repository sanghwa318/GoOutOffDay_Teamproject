package study.spring.goodspring.retrofit;

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
import retrofit2.Call;
import retrofit2.Retrofit;
import study.spring.goodspring.APIservice.WalkCourseAPIService;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.model.WalkCourseAPI;
import study.spring.goodspring.model.WalkCourseAPI.SeoulGilWalkCourse.Row;


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
public class WalkCourseAPITest {
	// RetrofitHelper 객체 주입 설정
	@Autowired
	RetrofitHelper retrofitHelper;
	@Autowired
	SqlSession sqlSession;

	@Test
	public void TestA() {
		// Retrofit 객체 생성
		Retrofit retrofit = retrofitHelper.getRetrofit(WalkCourseAPIService.BASE_URL);

		// Service 객체 생성
		WalkCourseAPIService walkCourseAPIService = retrofit.create(WalkCourseAPIService.class);

		// 메서드를 호출해서 call 객체를 리턴받는다.
		Call<WalkCourseAPI> call = walkCourseAPIService.getWalkCourseAPIList();

		// call 객체를 통해 JSON 파싱이 완료된 Beans 객체를 리턴받는다.
		WalkCourseAPI walkCourse = null;

		try {
			walkCourse = call.execute().body(); // 통신으로 가져온 원격지 JSON 데이터를 POJO 클래스에 자동으로 맵핑
		} catch (Exception e) {
			e.printStackTrace();
		}

		/** 조회결과를 반복문을 활용해서 출력한다. */
		if (walkCourse != null) {
			List<Row> list = walkCourse.getSeoulGilWalkCourse().getRow();

			for (Row item : list) {
				log.debug(" >>> " + item.toString());
			}
		}
	}

}
