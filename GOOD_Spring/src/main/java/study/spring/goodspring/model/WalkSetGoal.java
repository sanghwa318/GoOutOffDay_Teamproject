package study.spring.goodspring.model;

import lombok.Data;

@Data
public class WalkSetGoal {
	
	private int setgoal_no;
	private String setgoal_date;
	private int setgoal_day;
	private String setgoal_time;
	private String setgoal_distance;
	private String setgoal_create_datetime;
	private float time_achieve;
	private float distance_achieve;
	private int user_info_user_no;
}
