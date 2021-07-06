package study.spring.goodspring.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

/**
 * 실시간 자전거 현황 API에 대한 POJO 클래스
 */
@Data
public class Bicycle {

	@SerializedName("rentBikeStatus")
	private RentBikeStatus rentBikeStatus; // 실시간 자전거 대여정보

	@Data
	public class RentBikeStatus {

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
			@SerializedName("rackTotCnt")
			private int rackTotCnt; // 거치대 개수
			@SerializedName("stationName")
			private String stationName; // 대여소 이름
			@SerializedName("parkingBikeTotCnt")
			private int parkingBikeTotCnt; // 자전거 주차 총 건수
			@SerializedName("shared")
			private int shared; // 거치율
			@SerializedName("stationLatitude")
			private float stationLatitude; // 위도
			@SerializedName("stationLongitude")
			private float stationLongitude; // 경도
			@SerializedName("stationId")
			private String stationId; // 대여소 ID
		}
	}

}
