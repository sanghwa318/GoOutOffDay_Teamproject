package study.spring.goodspring.service;

import java.util.List;

import study.spring.goodspring.model.CAS;

public interface CasService {
	
	/** 문화체육Other 데이터 상세 조회
	 * @param 조회할 데이터의 일련번호 PERFORM_CODE
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public CAS getOtherItem(CAS input) throws Exception;
	
	/** 문화체육Other 데이터 다중 조회
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	public List<CAS> getOtherList(CAS input) throws Exception;
	
	/** 문화체육Other 데이터 다중 조회
	 * @param 조회할 데이터의 카데고리 이름 GENRE_NAME
	 * @throws Exception
	 */
	public List<CAS> getOtherCategoryList(CAS input) throws Exception;
	
	/** 문화체육Other 총 데이터 갯수 조회 
	 * @return int 
	 * @throws Exception
	 */
	public int getOtherCount(CAS input) throws Exception;
}
