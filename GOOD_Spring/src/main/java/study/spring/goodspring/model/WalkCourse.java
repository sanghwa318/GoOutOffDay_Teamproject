package study.spring.goodspring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

import lombok.Data;

@Data
/** 테이블 구조를 명시한 POJO클래스 (코스목록) */
public class WalkCourse {

	@SerializedName("seoulGilWalkCourse")
	private SeoulGilWalkCourse seoulGilWalkCourse; 

	@Data
	public class SeoulGilWalkCourse {

		@SerializedName("list_total_count")
		private int list_total_count; // 총 데이터 건수
		
		@SerializedName("RESULT")
		private RESULT RESULT; // 요청결과
		@Data
		public class RESULT {
			@SerializedName("CODE")
			private String CODE; // 요청결과 코드
			@SerializedName("MESSAGE")
			private String MESSAGE; // 요청결과 메시지
		}

		@SerializedName("row")
		private List<Row> row;
		@Data
		public class Row {
			@SerializedName("COURSE_CATEGORY")
			private int COURSE_CATEGORY; // 코스카테고리
			@SerializedName("COURSE_CATEGORY_NM")
			private String COURSE_CATEGORY_NM; // 코스카테고리명
			@SerializedName("SOUTH_NORTH_DIV")
			private String SOUTH_NORTH_DIV; // 강북강남구분코드
			@SerializedName("SOUTH_NORTH_DIV_NM") 
			private String SOUTH_NORTH_DIV_NM; // 강북강남구분
			@SerializedName("AREA_GU")
			private String AREA_GU; // 자치구
			
			@SerializedName("DISTANCE")
			private String DISTANCE; // 거리
			@SerializedName("LEAD_TIME")
			private String LEAD_TIME; // 소요시간
			@SerializedName("COURSE_LEVEL")
			private String COURSE_LEVEL; // 코스레벨
			@SerializedName("VOTE_CNT")
			private int VOTE_CNT; // 추천수
			@SerializedName("RELATE_SUBWAY")
			private String RELATE_SUBWAY; // 연계지하철
			
			@SerializedName("TRAFFIC_INFO")
			private String TRAFFIC_INFO; // 교통편
			@SerializedName("CONTENT")
			private String CONTENT; // 설명
			@SerializedName("PDF_FILE_PATH")
			private String PDF_FILE_PATH; // PDF파일경로
			@SerializedName("COURSE_NAME")
			private String COURSE_NAME; // 코스명
			@SerializedName("REG_DATE")
			private String REG_DATE; // 작성시간
			
			@SerializedName("DETAIL_COURSE")
			private String DETAIL_COURSE; // 세부코스
			@SerializedName("CPI_IDX")
			private int CPI_IDX; // 포인트순번 (기본키)
			@SerializedName("CPI_NAME")
			private String CPI_NAME; // 포인트명칭
			@SerializedName("X")
			private String X; // X좌표
			@SerializedName("Y")
			private String Y; // Y좌표
			
			@SerializedName("CPI_CONTENT")
			private String CPI_CONTENT; // 포인트설명
		}
	}
	
	/** [페이지 네이션] (static) */
	private static int offset;
	private static int listCount;
	
	public static int getOffset() {
		return offset;
	}
	public static void setOffset(int offset) {
		WalkCourse.offset = offset;
	}
	public static int getListCount() {
		return listCount;
	}
	public static void setListCount(int listCount) {
		WalkCourse.listCount = listCount;
	}
	// [페이지 네이션] 종료
	
	

}
