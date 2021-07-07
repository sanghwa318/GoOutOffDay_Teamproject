package study.spring.goodspring.model;

import lombok.Data;

@Data
/** 테이블 구조를 명시한 POJO클래스 (코스목록) */
public class WalkCourse {
	
	private int course_pk; // 일련번호
	
	private String crs_name; // 이름
	private String area; // 지역
	private String type; // 유형
	private String distance; // 거리
	private int time; // 소요시간(분)
	private String level; // 난이도
	
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
