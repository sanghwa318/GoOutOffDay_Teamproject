package study.spring.goodspring.model;

import lombok.Data;

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
}
