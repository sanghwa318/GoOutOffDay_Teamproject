package study.spring.goodspring.model;

import lombok.Data;

@Data
public class AdminInquiry {
	private int QnA_no; // 문의글 번호 PRIKEY
	private int user_info_user_no; // 문의글 작성자 사용자일련번호
	private String QnA_title; // 문의글 제목
	private String QnA_text; // 문의글 내용
	private String QnA_category;
	private String answer_detail; // 답변 내용
	private String answer_yn; // 답변 작성 여부
	private String QnA_create_datetime; // 문의글 작성시간
	private String answer_create_datetime; // 답변 작성시간
	
	private static int offset;     // LIMIT 절에서 사용할 검색 시작 위치
	private static int listCount;  // LIMIT 절에서 사용할 검색할 데이터 수
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		AdminInquiry.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		AdminInquiry.listCount = listCount;
	}
}
