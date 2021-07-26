package study.spring.goodspring.model;


import com.google.gson.Gson;

import lombok.Data;
import study.spring.goodspring.helper.UploadItem;

@Data
public class CrewPost {

	//기본컬럼
	private int post_no;
	private String post_like;
	private String post_crew;
	private String post_createdate;
	private String post_editdate;
	private String post_title;
	private String post_content;
	private String post_img;
	private String post_hits;
	private int user_info_user_no;
	
	//Crew 컬럼
	private int crew_no;
	private String crew_name;
	private String crew_area;
	private String crew_sinto; 
	private String crew_createtime; 
	private String crew_category; 
	private UploadItem crew_photo; 
	private String crew_dinto; 
	private int crew_member; 
	
	//Member컬럼
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
	
    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setPhotoJson(String user_photo) {
        this.user_photo = new Gson().fromJson(user_photo, UploadItem.class);
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setCrewUser_photo(UploadItem user_photo) {
        this.user_photo = user_photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public UploadItem getCrewUser_photo() {
        return this.user_photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public String getPhotoJson() {
        return new Gson().toJson(this.user_photo);
    }
}
