package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CrewPostLike {
	
	private int like_no;
	private int post_no;
	private String like_create_datetime;
	private int user_no;

}
