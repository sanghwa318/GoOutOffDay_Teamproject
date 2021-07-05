package study.spring.goodspring.model;

import lombok.Data;

/**
 * 실시간 자전거 현황에 대한 POJO 클래스
 */
@Data
public class bicycle {
	private int rackTotCnt; // 거치대 개수
	private String stationName; // 대여소 이름
	private int parkingBikeTotCnt; // 자전거 주차 총 건수
	private int shared; // 거치율
	private float stationLatitude; // 위도
	private float stationLongitude; // 경도
	private String stationId; // 대여소 ID
}