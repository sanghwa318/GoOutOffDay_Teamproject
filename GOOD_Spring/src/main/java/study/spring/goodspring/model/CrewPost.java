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
	
//	/** 프로필사진 정보{json=UploadItem}, IS NULL */
//    public void setPhotoJson(String post_img) {
//        this.post_img = new Gson().fromJson(post_img, UploadItem.class);
//    }
//
//    /** 프로필사진 정보{json=UploadItem}, IS NULL */
//    public void setCrewPost_photo(UploadItem post_img) {
//        this.post_img = post_img;
//    }
//
//    /** 프로필사진 정보{json=UploadItem}, IS NULL */
//    public UploadItem getCrewPost_photo() {
//        return this.post_img;
//    }
//
//    /** 프로필사진 정보{json=UploadItem}, IS NULL */
//    public String getPhotoJson() {
//        return new Gson().toJson(this.post_img);
//    }
	
}
