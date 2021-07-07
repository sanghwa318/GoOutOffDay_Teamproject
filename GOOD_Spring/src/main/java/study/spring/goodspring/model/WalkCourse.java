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
	private int time; // 시간
	private String level; // 난이도

}
