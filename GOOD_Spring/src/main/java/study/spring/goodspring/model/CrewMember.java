package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CrewMember {
	
	private int member_no;
	private String member_create_datetime;
	private String member_visit_datetime;
	private int user_info_user_no;
	private int crew_crew_no;
	private String crew_name;

}
