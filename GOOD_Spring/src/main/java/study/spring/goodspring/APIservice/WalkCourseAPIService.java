package study.spring.goodspring.APIservice;

import retrofit2.Call;
import retrofit2.http.GET;
import study.spring.goodspring.model.WalkCourse;

public interface WalkCourseAPIService {
public static final String BASE_URL = "http://openapi.seoul.go.kr:8088"; // 접근하고자 하는 API의 기본 주소
	
	@GET("/624f6b6c4563776a34364f44454550/json/SeoulGilWalkCourse/1/1000")		// GET 방식으로 API의 주소를 요청
	Call<WalkCourse> getWalkCourseAPIList();

}
