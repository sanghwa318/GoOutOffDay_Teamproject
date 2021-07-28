package study.spring.goodspring.model;

import lombok.Data;
//나만의코스 댓글 테이블의 정보를 담을 Beans
@Data
public class MyCourseCmt {
	private int comment_no; 
	private int mycourse_no;
	private int user_no;
	private String comment_user_nick;
	private String comment_create_datetime;
	private String comment_edit_datetime;
	private String comment_text;
}
