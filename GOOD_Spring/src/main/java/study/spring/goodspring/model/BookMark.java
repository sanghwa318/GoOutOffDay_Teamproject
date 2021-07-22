package study.spring.goodspring.model;

import lombok.Data;

@Data
public class BookMark {
	private int bookmark_no;
	private String category_id;
	private String service_id;
	private String bookmark_create_datetime;
	private int user_info_user_no;
}
