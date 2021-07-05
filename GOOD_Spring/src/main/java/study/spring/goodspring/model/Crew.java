package study.spring.goodspring.model;

import lombok.Data;

//Join문 구조에 맞춘 Java Beans 생성

@Data
public class Crew {

	private int crew_no; // 크루 일련번호
	private int user_no;   // 크루장 일련번호, crew_leader로 resultMap으로 지정 , 참조키
	private String crew_name; // 크루명
	private String crew_area; // 크루 지역
	private String crew_sinto; // 크루 간단 소개명
	private String crew_create_datetime; // 크루 생성일자
	private String crew_category; // 크루 카테고리
	private String crew_photo; //크루 사진
	private String crew_dinto; // 크루 상세 소개글
	private int crew_member; //크루 회원수
}
