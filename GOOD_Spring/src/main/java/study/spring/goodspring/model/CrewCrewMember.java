package study.spring.goodspring.model;

import com.google.gson.Gson;

import lombok.Data;
import study.spring.goodspring.helper.UploadItem;

@Data
public class CrewCrewMember {
	//1) 기본 컬럼
		private int crew_no;
		private String crew_name;
		private String crew_area;
		private String crew_sinto; 
		private String crew_createtime; 
		private String crew_category; 
		private UploadItem crew_photo; 
		private String crew_dinto; 
		private int crew_member; 
		private int user_info_user_no;
		private int crew_crew_no;
		
		//2) 페이지 구현을 위한 static 변수
		
		//LIMIT절에서 사용할 조회 시작 위치
		private static int offset;
		
		//LIMIT절에서 사용할 조회할 데이터 수
		private static int listCount;

		public static int getOffset() {
			return offset;
		}

		public static void setOffset(int offset) {
			Crew.setOffset(offset);
		}

		public static int getListCount() {
			return listCount;
		}

		public static void setListCount(int listCount) {
			Crew.setListCount(listCount);
		}
		
		//3) 순서 정렬을 위한 static 변수
		private static int order;


		public static int getOrder() {
			return order;
		}

		public static void setOrder(int order) {
			Crew.setOrder(order);
		}

}
