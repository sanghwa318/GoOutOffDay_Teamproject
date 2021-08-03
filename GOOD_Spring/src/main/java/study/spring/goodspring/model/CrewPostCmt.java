package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CrewPostCmt {

	private int comment_no;
	private String comment_create_datetime;
	private String comment_text;
	private int user_info_user_no;
	private int crew_post_post_no;
	private String comment_usernick;
	
}
