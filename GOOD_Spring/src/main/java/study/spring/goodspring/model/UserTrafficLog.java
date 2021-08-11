package study.spring.goodspring.model;

import lombok.Data;

@Data
public class UserTrafficLog {
	
	private int log_no; // 사용자 트래픽 기록의 일련번호
	private String log_datetime; // 트래픽 로그 생성 시간  (=이벤트 발생 날짜,시간)
	private String log_category; // 이벤트가 발생한 페이지의 위치
	private String log_content; // 발생한 이벤트의 세부명칭
	private int user_info_user_no; //사용자 유저No

}
