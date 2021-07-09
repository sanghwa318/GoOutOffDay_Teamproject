package study.spring.goodspring.APIservice;

import retrofit2.Call;
import retrofit2.http.GET;
import study.spring.goodspring.model.CasAPIList;

public interface CasAPISerchService {
	public static final String BASE_URL = "http://openAPI.seoul.go.kr:8088";

	@GET("/7153736f52716e7432376445424665/JSON/SJWPerform/1/100")
	Call<CasAPIList> getCasShowAPIList();

	@GET("/7855474e72716e74383074744b7275/JSON/tvYeyakCOllect/1/1000")
	Call<CasAPIList> getCasOtherAPIList();

}
