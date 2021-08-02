package study.spring.goodspring.model;

import com.google.gson.Gson;

import lombok.Data;
import study.spring.goodspring.helper.UploadItem;

@Data
public class MyCourses {
	// 1) 기본 컬럼

	private int mycourse_no; // PRI 키, auto increment
	private int like; // 좋아요 수
	private String mycourse_name; // 코스 이름
	private String mycourse_area; // 코스 지역
	private String mycourse_content; // 코스 설명
	private String mycourse_createdate; // 생성시간
	private String mycourse_editdate; // 수정 시간
	private int mycourse_hits; // 조회수
	private int user_info_user_no; // 작성자 정보.

	// 2) 페이지 구현을 위한 static 변수

	// LIMIT절에서 사용할 조회 시작 위치
	private static int offset;

	// LIMIT절에서 사용할 조회할 데이터 수
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		MyCourses.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		MyCourses.listCount = listCount;
	}
	///객체 판별 변수
	private String dtype;
	
	
	
	///// JOIN user_info 테이블
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
