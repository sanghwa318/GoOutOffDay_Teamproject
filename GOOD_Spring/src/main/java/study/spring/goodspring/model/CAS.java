package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CAS {
	private String DIV_COL; 		/** 예약구분 **/
	private String SERVICE; 		/** 서비스 구분코드 **/
	private String GUBUN; 			/** 서비스 구분 **/
	private String SVCID; 			/** 서비스 ID **/
	private String MAXCLASSNM; 		/** 대분류명 **/
	private String MINCLASSNM; 		/** 소분류명 **/
	private String SVCSTATNM; 		/** 서비스상태 **/
	private String SVCNM; 			/** 서비스명 **/
	private String PAYATNM;  		/** 결제방법 **/
	private String PLACENM;  		/** 장소명 **/
	private String USETGTINFO;  	/** 서비스대상 **/
	private String SVCURL; 			/** 예약사이트 바로가기 URL **/
	private String RCPTBGNDT; 		/** 접수시작일자 **/
	private String RCPTENDDT; 		/** 접수마감일자 **/
	private String AREANM; 			/** 지역명 **/
	private String IMGURL; 			/** 이미지주소URL **/
	private String TELNO; 			/** 연락처 **/
	private String VMAX; 			/** 서비스이용 시작시간 **/
	private String VMIN; 			/** 서비스이용 종료시간 **/
	private String regDate; 		/** 데이터저장일자 **/
	private String editDate; 		/** 데이터수정일자 **/
	
	/** [페이지 네이션] (static) */
	private static int offset;
	private static int listCount;
	
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		CAS.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		CAS.listCount = listCount;
	}
// [페이지 네이션] 종료
}
