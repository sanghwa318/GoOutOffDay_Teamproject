package study.spring.goodspring.service;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import study.spring.goodspring.model.CasAPIList;
import study.spring.goodspring.model.CasAPIList.SJWPerform.row;

public interface CasAPIService {
	public static final String BASE_URL = "http://openAPI.seoul.go.kr:8088";
	
	@GET("/7153736f52716e7432376445424665/JSON/SJWPerform/1/10")
	Call<CasAPIList> getCasAPIList();
	
	/**
	 * 수집결과 DB에 저장
	 * @param list  세종문화회관 공연전시 수집목록
	 */
	public void collectCasShowExh(List<row> list) throws Exception;
}
