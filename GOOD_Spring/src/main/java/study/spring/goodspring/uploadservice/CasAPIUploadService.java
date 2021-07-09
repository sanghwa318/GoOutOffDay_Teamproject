package study.spring.goodspring.uploadservice;

import java.util.List;

import study.spring.goodspring.model.CasAPIList.SJWPerform.row;
import study.spring.goodspring.model.CasAPIList.tvYeyakCOllect.Row;



public interface CasAPIUploadService {
	/**
	 * 수집결과 DB에 저장
	 * @param list  세종문화회관 공연전시 수집목록
	 */
	public void collectCasShowExh(List<row> list) throws Exception;
	
	/**
	 * 수집결과 DB에 저장
	 * @param list  서울 공공서비스 예약 종합
	 */
	public void collectCasOther(List<Row> list) throws Exception;
}
