package study.spring.goodspring.model;


import com.google.gson.Gson;

import lombok.Data;
import study.spring.goodspring.helper.UploadItem;

@Data
public class CrewPost {

	//기본컬럼
	private int post_no; //게시물 번호
	private String post_like; // 게시물 좋아요 수
	private String post_crew; // 크루 이름
	private String post_createdate; // 게시물 생성일자
	private String post_editdate; // 게시물 수정 일자
	private String post_title; // 게시물 제목
	private String post_content; // 게시물 내용
	private String post_img; // 게시물 사진
	private String post_hits; // 게시물 조회수
	private int user_info_user_no; // 게시물 작성자No
	
	//Crew 컬럼
	private int crew_no; //크루번호
	private String crew_name; //크루이름
	private String crew_area; //크루지역
	private String crew_sinto;  //크루 간단소개
	private String crew_createtime; //크루 생성날짜
	private String crew_category; //크루 카테고리 
	private UploadItem crew_photo; //크루 사진
	private String crew_dinto;  //크루 소개
	private int crew_member;  // 크루 인원
	
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
	
	//2) 페이지 구현을 위한 static 변수
	
		//LIMIT절에서 사용할 조회 시작 위치
		private static int offset;
		
		//LIMIT절에서 사용할 조회할 데이터 수
		private static int listCount;

		public static int getOffset() {
			return offset;
		}

		public static void setOffset(int offset) {
			CrewPost.offset = offset;
		}

		public static int getListCount() {
			return listCount;
		}

		public static void setListCount(int listCount) {
			CrewPost.listCount = listCount;
		}
		
		//3) 순서 정렬을 위한 static 변수
		private static int order;


		public static int getOrder() {
			return order;
		}

		public static void setOrder(int order) {
			CrewPost.order = order;
		}
    
		///내가쓴글page 객체 판별 변수
		private String dtype;

}
