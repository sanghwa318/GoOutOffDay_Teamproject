package study.spring.goodspring.retrofit;

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
import retrofit2.Call;
import retrofit2.Retrofit;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.model.CasAPIList;
import study.spring.goodspring.model.CasAPIList.SJWPerform.row;
import study.spring.goodspring.service.CasAPISerchService;

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
public class CasAPITest {
	// RetrofitHelper 객체 주입 설정
	@Autowired
	RetrofitHelper retrofitHelper;

	/** 원격지 JSON을 가져오는 테스트 메서드 */
	@Test
	public void testA() {
		/** 1) API 연동 객체 생성 */
		// Retrofit 객체 생성
		Retrofit retrofit = retrofitHelper.getRetrofit(CasAPISerchService.BASE_URL);

		// Service 객체를 생성한다. 구현체는 Retrofit이 자동으로 생성해 준다.
		CasAPISerchService casApiService = retrofit.create(CasAPISerchService.class);

		/** 2) 검색 파라미터 처리 */
		Call<CasAPIList> call = casApiService.getCasAPIList();
		CasAPIList casAPIList = null;
		try {
			casAPIList = call.execute().body();
		} catch (Exception e) {
			e.printStackTrace();
		}

		/** 3) 조회결과를 반복문을 활용해서 출력한다. */

		if (casAPIList != null) {
			List<row> list = casAPIList.getSJWPerform().getRow();

			/** INFO컬럼값 클리닝 **/
			int i = 0;
			for (row item : list) {
				i++;
				String info = item.getINFO();
				if (info != "" && info.length() > 0 && info.contains("http")) {
					int a = info.indexOf("http");
					info = info.substring(a);
					int b = info.indexOf("\"");
					info = info.substring(0, b);

					item.setINFO(info);

					log.debug(i + info);
				} else {
					info = "";
				}
			}

			/*
			 * for (row item : list) { log.debug(" >>> " + item.toString()); }
			 */

		}
	}
}
