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
import study.spring.goodspring.APIservice.BicycleService;
import study.spring.goodspring.helper.RetrofitHelper;
import study.spring.goodspring.model.Bicycle;
import study.spring.goodspring.model.Bicycle.RentBikeStatus.Row;
import study.spring.goodspring.uploadservice.BicycleUpload;

@Slf4j
@Controller
public class BicycleScheduler {

	/** 통신처리에 필요한 객체 주입 받기 */
	@Autowired
	RetrofitHelper retrofitHelper;
	
	@Autowired
	BicycleUpload bicycleUpload;

	/**
	 * 실시간 자전거 대여현황 API를 수집하여 DB에 저장하기 위한 메서드
	 */
	@ResponseBody
	@RequestMapping(value = "/bicycle_schduler", method = RequestMethod.GET)
	public void collectBicycle() {
		/** 1_ API 연동 객체 생성 */
		Retrofit retrofit = retrofitHelper.getRetrofit(BicycleService.BASE_URL);

		// Service 객체 생성
		BicycleService bicycleService = retrofit.create(BicycleService.class);

		/** 2) API 요청 */
		// 메서드를 호출해서 call 객체를 리턴받는다.
		Call<Bicycle> call = bicycleService.getRow();

		// call 객체를 통해 JSON 파싱이 완료된 Beans 객체를 리턴받는다.
		Bicycle bicycle = null;

		try {
			bicycle = call.execute().body(); // 통신으로 가져온 원격지 JSON 데이터를 POJO 클래스에 자동으로 맵핑
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Row> list = null;
		
		/** 3) Open API 데이터 받아오기 */
		if (bicycle != null) {
            list = bicycle.getRentBikeStatus().getRow();
        } else {
        	log.debug("조회결과 없음");
        	return;
        }
		
		/** 4) 수집결과 저장하기 */
		try {
			bicycleUpload.collectBicycle(list);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
}
