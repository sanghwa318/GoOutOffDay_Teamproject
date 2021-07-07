package study.spring.goodspring.service;

import retrofit2.Call;
import retrofit2.http.GET;
import study.spring.goodspring.model.Bicycle;

public interface BicycleService {
	public static final String BASE_URL = "http://openapi.seoul.go.kr:8088"; // 접근하고자 하는 API의 기본 주소
	
	@GET("/5178704a4e72686b343364677a4478/json/bikeList/1/10")		// GET 방식으로 API의 주소를 요청
	Call<Bicycle> getRow();

	
}