package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CrewPostCmt {

	private int comment_no; //댓글 번호
	private String comment_create_datetime; // 댓글 생성일자
	private String comment_text; // 댓글 내용
	private int user_info_user_no; // 작성자 번호
	private int crew_post_post_no; // 게시물 번호
	private String comment_usernick; // 작성자 닉네임
	
}
