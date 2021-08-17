package study.spring.goodspring.model;

import lombok.Data;

@Data
public class BookMark {
	private int bookmark_no;
	/** 찜하기 고유번호 **/
	private String category_id;
	/** 대분류 이름 **/
	private String service_id;
	/** 찜한목록의 고유 키값 **/
	private String bookmark_create_datetime;
	/** 찜한 시간 **/
	private int user_info_user_no;
	/** 사용자 번호 **/

	/** 문화체육부분 DB조인을위한 구문 **/

	private String DIV_COL;
	/** 예약구분 **/
	private String SERVICE;
	/** 서비스 구분코드 **/
	private String GUBUN;
	/** 서비스 구분 **/
	private String SVCID;
	/** 서비스 ID **/
	private String MAXCLASSNM;
	/** 대분류명 **/
	private String MINCLASSNM;
	/** 소분류명 **/
	private String SVCSTATNM;
	/** 서비스상태 **/
	private String SVCNM;
	/** 서비스명 **/
	private String PAYATNM;
	/** 결제방법 **/
	private String PLACENM;
	/** 장소명 **/
	private String USETGTINFO;
	/** 서비스대상 **/
	private String SVCURL;
	/** 예약사이트 바로가기 URL **/
	private String RCPTBGNDT;
	/** 접수시작일자 **/
	private String RCPTENDDT;
	/** 접수마감일자 **/
	private String AREANM;
	/** 지역명 **/
	private String IMGURL;
	/** 이미지주소URL **/
	private String TELNO;
	/** 연락처 **/
	private String VMAX;
	/** 서비스이용 시작시간 **/
	private String VMIN;
	/** 서비스이용 종료시간 **/
	private String regDate;
	/** 데이터저장일자 **/
	private String editDate;
	/** 데이터수정일자 **/

	/** 걷기부분 DB 조인을위한 구문 **/
	private String COURSE_CATEGORY_NM; // 코스카테고리명
	private String AREA_GU; // 자치구
	private String DISTANCE; // 거리
	private String LEAD_TIME; // 소요시간
	private String COURSE_LEVEL; // 코스레벨
	private String COURSE_NAME; // 코스명
	private String SOUTH_NORTH_DIV_NM; // 지역구
	private String CPI_NAME; // 포인트명칭
	private String X; // X좌표
	private String Y; // Y좌표

	private int CPI_IDX; // 포인트순번 (기본키)

	/** [페이지 네이션] (static) */
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		BookMark.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		BookMark.listCount = listCount;
	}
	// [페이지 네이션] 종료
}
