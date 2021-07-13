package study.spring.goodspring.scheduler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import retrofit2.Call;
import retrofit2.Retrofit;
import study.spring.goodspring.APIservice.WalkCourseAPIService;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.model.WalkCourseAPI;
import study.spring.goodspring.model.WalkCourseAPI.SeoulGilWalkCourse.Row;
import study.spring.goodspring.uploadservice.WalkCourseUploadService;

@Slf4j
@Controller
public class WalkCourseScheduler {
	/** 통신처리에 필요한 객체 주입 **/
	@Autowired
	RetrofitHelper retrofitHelper;

	/** 데이터베이스 연동에 필요한 서비스 객체 주입 **/
	@Autowired
	WalkCourseUploadService walkCourseUploadService;
	
	/**
	 * 두드림길 API를 수집하여 DB에 저장하기 위한 메서드
	 */
	@ResponseBody
	@RequestMapping(value = "/walkcourse_api_scheduler", method = RequestMethod.GET)
	public void collectWalkCourse() {
		/** 1_ API 연동 객체 생성 */
		Retrofit retrofit = retrofitHelper.getRetrofit(WalkCourseAPIService.BASE_URL);

		// Service 객체 생성
		WalkCourseAPIService walkCourseAPIService = retrofit.create(WalkCourseAPIService.class);

		/** 2) API 요청 */
		// 메서드를 호출해서 call 객체를 리턴받는다.
		Call<WalkCourseAPI> call = walkCourseAPIService.getWalkCourseAPIList();

		// call 객체를 통해 JSON 파싱이 완료된 Beans 객체를 리턴받는다.
		WalkCourseAPI walkCourse = null;

		try {
			walkCourse = call.execute().body(); // 통신으로 가져온 원격지 JSON 데이터를 POJO 클래스에 자동으로 맵핑
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/** 3) 조회결과 반복문으로 저장 */
		List<Row> list = null;
		if (walkCourse != null) {
            list = walkCourse.getSeoulGilWalkCourse().getRow();
            log.debug(" >>> " + list.toString());
        } else {
        	log.debug("조회결과 없음");
        	return;
        }
		
		/** 4) 수집결과 저장하기 */
		try {
			walkCourseUploadService.collectWalkCourse(list);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		
	}
}
