package study.spring.goodspring.model;

import lombok.Data;

@Data
public class CrewMember {
	
	private int member_no;
	private String member_create_datetime;
	private String member_visit_datetime;
	private int user_info_user_no;
	private int crew_crew_no;
	private String crew_name;
	private String user_id;
	private String user_nick;
	private boolean crew_out;
	
	
	//2) 페이지 구현을 위한 static 변수
	
	//LIMIT절에서 사용할 조회 시작 위치
	private static int offset;
	
	//LIMIT절에서 사용할 조회할 데이터 수
	private static int listCount;

	//3) 순서 정렬을 위한 static 변수
	private static int order;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		CrewMember.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		CrewMember.listCount = listCount;
	}

	public static int getOrder() {
		return order;
	}

	public static void setOrder(int order) {
		CrewMember.order = order;
	}

}
