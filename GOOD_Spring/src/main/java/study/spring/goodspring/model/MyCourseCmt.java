package study.spring.goodspring.model;

import com.google.gson.Gson;

import lombok.Data;
import study.spring.goodspring.helper.UploadItem;
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
	
	//Join Member Table
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
	private boolean user_out; //(회원탈퇴 여부)
	
    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setPhotoJson(String user_photo) {
        this.user_photo = new Gson().fromJson(user_photo, UploadItem.class);
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setUser_photo(UploadItem user_photo) {
        this.user_photo = user_photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public UploadItem getUser_photo() {
        return this.user_photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public String getPhotoJson() {
        return new Gson().toJson(this.user_photo);
    }
	
}
