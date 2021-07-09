package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CasOther;
import study.spring.goodspring.model.CasShowExh;

public interface CasService {
	
	/** 공연전시 데이터 상세 조회
	 * @param 조회할 데이터의 일련번호 PERFORM_CODE
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public CasShowExh getShowExhItem(CasShowExh input) throws Exception;
	
	/** 공연전시 데이터 다중 조회
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	public List<CasShowExh> getShowExhList(CasShowExh input) throws Exception;
	
	/** 공연전시 총 데이터 갯수 조회 
	 * @return int 
	 * @throws Exception
	 */
	public int getShowExhCount(CasShowExh input) throws Exception;
	
	/** 문화체육Other 데이터 상세 조회
	 * @param 조회할 데이터의 일련번호 PERFORM_CODE
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public CasOther getOtherItem(CasOther input) throws Exception;
	
	/** 문화체육Other 데이터 다중 조회
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	public List<CasOther> getOtherList(CasOther input) throws Exception;
	
	/** 문화체육Other 총 데이터 갯수 조회 
	 * @return int 
	 * @throws Exception
	 */
	public int getOtherCount(CasOther input) throws Exception;
}
