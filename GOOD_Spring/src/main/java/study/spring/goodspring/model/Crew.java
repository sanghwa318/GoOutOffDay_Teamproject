package study.spring.goodspring.model;


import com.google.gson.Gson;

import lombok.Data;
//테이블 구조에 맞춘 JAVA Beans
import study.spring.goodspring.helper.UploadItem;

@Data
public class Crew {
	//1) 기본 컬럼
	private int crew_no; //크루번호
	private String crew_name; //크루이름
	private String crew_area; //크루지역
	private String crew_sinto;  //크루 간단소개
	private String crew_createtime; //크루 생성날짜
	private String crew_category; //크루 카테고리 
	private UploadItem crew_photo; //크루 사진
	private String crew_dinto;  //크루 소개
	private int crew_member;  // 크루 인원
	private int user_info_user_no; // 크루장 No
	private boolean user_info_user_out; //회원 탈퇴&추방 여부 
	
	
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
	
	//3) 순서 정렬을 위한 static 변수
	private static int order;


	public static int getOrder() {
		return order;
	}

	public static void setOrder(int order) {
		Crew.order = order;
	}
	
}
