package study.spring.goodspring.model;

import lombok.Data;

@Data
public class WalkLog {
	private int walk_log_no;
	private String walk_log_datetime;
	private long walking_time;
	private String walking_distance;
	private String lon;
	private String lat;
	private String event_name;
	private int user_info_user_no;
	private String course_name;
	
	
	private long time;
}
