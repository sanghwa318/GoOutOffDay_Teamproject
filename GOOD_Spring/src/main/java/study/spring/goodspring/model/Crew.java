package study.spring.goodspring.model;

import lombok.Data;
//테이블 구조에 맞춘 JAVA Beans

@Data
public class Crew {
	private int crew_no;
	private String crew_name;
	private String crew_area;
	private String crew_sinto; 
	private String crew_createtime; 
	private String crew_category; 
	private String crew_photo; 
	private String crew_dinto; 
	private int crew_member; 
	private int user_info_user_no;
}
