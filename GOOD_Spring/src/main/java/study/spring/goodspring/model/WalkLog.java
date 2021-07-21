package study.spring.goodspring.model;

import lombok.Data;

@Data
public class WalkLog {
	private int walk_log_no;
	private String walk_log_datetime;
	private long walking_time;
	private String walking_distance;
	private double lon;
	private double lat;
	private String event_name;
	private int user_info_user_no;
}
