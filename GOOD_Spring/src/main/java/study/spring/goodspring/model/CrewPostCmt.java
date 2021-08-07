package study.spring.goodspring.model;

import lombok.Data;
import study.spring.goodspring.helper.UploadItem;

@Data
public class CrewPostCmt {

	private int comment_no; //댓글 번호
	private String comment_create_datetime; // 댓글 생성일자
	private String comment_text; // 댓글 내용
	private int user_info_user_no; // 작성자 번호
	private int crew_post_post_no; // 게시물 번호
	private String comment_usernick; // 작성자 닉네임
	
	
	//Member 객체
	private int user_no; //(사용자 일련번호)
	private String user_id;// (사용자 ID)
	private String user_name;// (사용자 이름)
	private String user_nick;// (사용자 닉네임)
	private String user_pw;// (비밀번호)
	private String gender;// (성별)
	private String address1;// (주소)	
	private String address2;// (주소)	
	private String post;// (우편번호)
	private String tel;// (연락처)
	private String email;// (이메일)
	private UploadItem user_photo;// (프로필 사진)
	private boolean user_admin;// (관리자 권한)
	private String create_datetime;// (가입일자)
	private String edit_datetime;// (수정일자)
	
}
