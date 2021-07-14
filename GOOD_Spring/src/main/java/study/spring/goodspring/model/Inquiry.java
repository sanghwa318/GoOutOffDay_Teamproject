package study.spring.goodspring.model;

import lombok.Data;

@Data
public class Inquiry {

	private int QnA_no; // 문의글 번호 PRIKEY
	private int user_info_user_no; // 문의글 작성자 사용자일련번호
	private String QnA_title; // 문의글 제목
	private String QnA_text; // 문의글 내용
	private String QnA_category;
	private String answer_detail; // 답변 내용
	private boolean answer_yn; // 답변 작성 여부
	private String QnA_create_datetime; // 문의글 작성시간
	private String answer_create_datetime; // 답변 작성시간
}
