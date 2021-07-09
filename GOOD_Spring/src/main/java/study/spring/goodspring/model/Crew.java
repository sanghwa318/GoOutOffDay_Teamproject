package study.spring.goodspring.model;

import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import lombok.Data;
//테이블 구조에 맞춘 JAVA Beans
import study.spring.goodspring.helper.UploadItem;

@Data
public class Crew {
	//1) 기본 컬럼
	private int crew_no;
	private String crew_name;
	private String crew_area;
	private String crew_sinto; 
	private String crew_createtime; 
	private String crew_category; 
	private UploadItem crew_photo; 
	private String crew_dinto; 
	private int crew_member; 
	private int user_info_user_no;
	
	/** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setPhotoJson(String crew_photo) {
        this.crew_photo = new Gson().fromJson(crew_photo, UploadItem.class);
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public void setCrew_photo(UploadItem crew_photo) {
        this.crew_photo = crew_photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public UploadItem getCrew_photo() {
        return this.crew_photo;
    }

    /** 프로필사진 정보{json=UploadItem}, IS NULL */
    public String getPhotoJson() {
        return new Gson().toJson(this.crew_photo);
    }
	
 
	
	//2) 페이지 구현을 위한 static 변수
	
	//LIMIT절에서 사용할 조회 시작 위치
	private static int offset;
	
	//LIMIT절에서 사용할 조회할 데이터 수
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Crew.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Crew.listCount = listCount;
	}
	
	
}
