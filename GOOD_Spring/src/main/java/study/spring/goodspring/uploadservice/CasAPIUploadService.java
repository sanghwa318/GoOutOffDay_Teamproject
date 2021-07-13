package study.spring.goodspring.uploadservice;

import java.util.List;

import study.spring.goodspring.model.CasAPIList.tvYeyakCOllect.Row;



public interface CasAPIUploadService {
	
	/**
	 * 수집결과 DB에 저장
	 * @param list  서울 공공서비스 예약 종합
	 */
	public void collectCasOther(List<Row> list) throws Exception;
}
