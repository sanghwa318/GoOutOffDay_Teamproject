package study.spring.goodspring.service;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;
import study.spring.goodspring.model.bicycle;

public interface bicycleService {
	public static final String BASE_URL = "http://openapi.seoul.go.kr:8088";
	
	@GET("/5178704a4e72686b343364677a4478/json/bikeList/1/1000")
	Call<bicycle> getrow(@Query("bikeList") int bikeList);

}
