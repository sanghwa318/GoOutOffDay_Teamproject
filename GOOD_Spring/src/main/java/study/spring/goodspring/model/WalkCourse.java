package study.spring.goodspring.model;

import lombok.Data;

@Data
public class WalkCourse {
	private int COURSE_CATEGORY; // 코스카테고리
	private String COURSE_CATEGORY_NM; // 코스카테고리명
	private String SOUTH_NORTH_DIV; // 강북강남구분코드
	private String SOUTH_NORTH_DIV_NM; // 강북강남구분
	private String AREA_GU; // 자치구

	private String DISTANCE; // 거리
	private String LEAD_TIME; // 소요시간
	private String COURSE_LEVEL; // 코스레벨
	private int VOTE_CNT; // 추천수
	private String RELATE_SUBWAY; // 연계지하철

	private String TRAFFIC_INFO; // 교통편
	private String CONTENT; // 설명
	private String PDF_FILE_PATH; // PDF파일경로
	private String COURSE_NAME; // 코스명
	private String REG_DATE; // 작성시간

	private String DETAIL_COURSE; // 세부코스
	private int CPI_IDX; // 포인트순번 (기본키)
	private String CPI_NAME; // 포인트명칭
	private String X; // X좌표
	private String Y; // Y좌표

	private String CPI_CONTENT; // 포인트설명
	
	// 정렬에 필요한 변수 정의
	private String order;

	/** [페이지 네이션] (static) */
	private static int offset;
	private static int listCount;
	
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		WalkCourse.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		WalkCourse.listCount = listCount;
	}
	// [페이지 네이션] 종료
}
