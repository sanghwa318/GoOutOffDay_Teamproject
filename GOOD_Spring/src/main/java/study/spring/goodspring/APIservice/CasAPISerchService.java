package study.spring.goodspring.APIservice;

import retrofit2.Call;
import retrofit2.http.GET;
import study.spring.goodspring.model.CasAPIList;

public interface CasAPISerchService {
	public static final String BASE_URL = "http://openAPI.seoul.go.kr:8088";

	@GET("/7855474e72716e74383074744b7275/JSON/tvYeyakCOllect/1/600")
	Call<CasAPIList> getCasOtherAPIList();

}
